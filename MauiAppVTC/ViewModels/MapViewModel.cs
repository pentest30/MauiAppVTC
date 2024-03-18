using System.Globalization;
using System.Reflection;
using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using Mapsui;
using Mapsui.Extensions;
using Mapsui.Layers;
using Mapsui.Nts;
using Mapsui.Nts.Extensions;
using Mapsui.Projections;
using Mapsui.Styles;
using Mapsui.Tiling;
using Mapsui.UI.Maui;
using MauiAppVTC.Services;
using NetTopologySuite.Geometries;
using NetTopologySuite.IO;
using Brush = Mapsui.Styles.Brush;
using Color = Mapsui.Styles.Color;
using Location = Microsoft.Maui.Devices.Sensors.Location;
using Position = Mapsui.UI.Maui.Position;

namespace MauiAppVTC.ViewModels;

public class MapViewModel: BaseViewModel
{
    private readonly ILocationService _locationService;
    private readonly IOpenRouteService _openRouteService;
    private string _currentAddress;
    private MapView _mapView;
    private Location _currentLocation;
    private string _destAddress;

    public MapViewModel(
        ILocationService locationService,
        IOpenRouteService openRouteService)
    {
        _locationService = locationService;
        _openRouteService = openRouteService;
    }

    private string _cost  ;
    
    public string Cost
    {
        get => _cost;
        set
        {
            if (_cost != value)
            {
                _cost = value;
                OnPropertyChanged(nameof(Cost));
            }
        }
    }
    public string DestAddress {
        get => _destAddress;
        set
        {
            if (_destAddress != value)
            {
                _destAddress = value;
                OnPropertyChanged(nameof(DestAddress));
            }
        }
    }
    public string CurrentAddress
    {
        get => _currentAddress;
        set
        {
            if (_currentAddress != value)
            {
                _currentAddress = value;
                OnPropertyChanged(nameof(CurrentAddress));
            }
        }
    }

    public async Task InitializeMapAsync(MapView mapView)
    {
        _mapView = mapView;
        var location = await _locationService.GetCurrentUserLocationAsync();
        _currentLocation = location;
        CurrentAddress = await _locationService.GetAddressFromCoordinates(location.Latitude, location.Longitude);
        var map = new Mapsui.Map();
        var tileLayer = OpenStreetMap.CreateTileLayer();
        map.Layers.Add(tileLayer);
        map.Widgets.Add(new Mapsui.Widgets.ScaleBar.ScaleBarWidget(map)
        {
            TextAlignment = Mapsui.Widgets.Alignment.Center,
            HorizontalAlignment = Mapsui.Widgets.HorizontalAlignment.Left,
            VerticalAlignment = Mapsui.Widgets.VerticalAlignment.Bottom
        });
        mapView.PinClicked += OnPinClicked;
        map.Info += MapOnInfo;
        CreateMapPins(mapView, location);
        mapView.MyLocationEnabled = true;
        mapView.Map = map;
        var centerPoint = SphericalMercator.FromLonLat(location.Longitude, location.Latitude);
        mapView.MyLocationLayer.UpdateMyLocation(new Position(location.Latitude, location.Longitude), true);
        map.Navigator.CenterOnAndZoomTo( new MPoint(centerPoint.x, centerPoint.y), 16);
        
    }

    private void CreateMapPins(MapView mapView, Location location)
    {
        byte[]? funkIcon = GetImageAsByteArray("MauiAppVTC.Resources.Images.car.png");
        var pin = new Pin
        {
            Address = CurrentAddress,
            Label = "Current_PIN",
            Position = new Position(location.Latitude, location.Longitude),
            Icon = funkIcon,
            Type = PinType.Icon,
            MaxVisible = 12
        };
        mapView.Pins.Add(pin);
    }

    private void OnPinClicked(object? sender, PinClickedEventArgs e)
    {
    }

    private void MapOnInfo(object? sender, MapInfoEventArgs e)
    {
        if (e.MapInfo?.WorldPosition != null)
        {
            var clickedPosition = e.MapInfo.WorldPosition;
            AddPin(clickedPosition);
            DrawLineFromCurrentLocationTo(clickedPosition);
            _mapView.Refresh();
            _mapView.Map.Navigator.CenterOnAndZoomTo(new MPoint(clickedPosition.X, clickedPosition.Y), 13);

        }
    }

    private async void DrawLineFromCurrentLocationTo(MPoint clickedPosition)
    {
        try
        {
            var endPoint = SphericalMercator.ToLonLat(clickedPosition.X, clickedPosition.Y);
            var points = await _openRouteService.GetRouteAsync(_mapView.Pins[0].Position.Latitude, _mapView.Pins[0].Position.Longitude, endPoint.lat, endPoint.lon);
            var allPoints = RouteResponseToWKT.ParseLineString(points);
            var distanceMeters = TotalDistance(allPoints);
            var distanceKm = Math.Round(distanceMeters / 1000, 2); 
            var lineString = (LineString)new WKTReader().Read(points);
            lineString = new LineString(lineString.Coordinates
                .Select(v => SphericalMercator.FromLonLat(v.X, v.Y).ToCoordinate()).ToArray());
            var lineLayer = MemoryLayer(lineString, distanceKm, clickedPosition);
            var item = _mapView.Map.Layers.FirstOrDefault(l => l.Name == "LineLayer");
            if (item != null) _mapView.Map.Layers.Remove(item);
            _mapView.Map.Layers.Add(lineLayer);
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            //throw;
        }
    }

    private MemoryLayer MemoryLayer(LineString lineString, double distanceKm, MPoint clickedPosition)
    {
        var lineLayer = new MemoryLayer
        {
            Name = "LineLayer",
            Features = new[]
            {
                new GeometryFeature { Geometry = lineString },
                AddLabelToMap(distanceKm, clickedPosition)

            },
            Style = CreateLineStringStyle()
        };
        return lineLayer;
    }

    private IFeature AddLabelToMap(double distance, MPoint p)
    {
        Cost =(decimal) Math.Round(distance * 30, 2) + " DZD";
        var toast = Toast.Make("Distance: " +distance + $"\nEsitmated Cost: {Math.Round(distance * 30,2)} DZD"  , ToastDuration.Long); 
        toast.Show();
        return new PointFeature(new MPoint(p.X, p.Y))
        {
            Styles = new[] { new LabelStyle { Text = distance.ToString(CultureInfo.InvariantCulture) + " Km", ForeColor = Color.White,
                Halo = new Pen(Color.Red), BorderThickness = 16,BackColor = new Brush() {Color = Color.Red},} }
        }; 
    }
    private static IStyle CreateLineStringStyle()
    {
        return new VectorStyle
        {
            Fill = null,
            Outline = null,
#pragma warning disable CS8670 // Object or collection initializer implicitly dereferences possibly null member.
            Line = { Color = Color.FromString("Blue"), Width = 4 }
        };
    }


    private async void AddPin(MPoint clickedPosition)
    {
      
        var lonLat = SphericalMercator.ToLonLat(clickedPosition.X, clickedPosition.Y);
        DestAddress = await _locationService.GetAddressFromCoordinates(lonLat.lat, lonLat.lon);
        var pin = new Pin
        {
            Address =  DestAddress,
            Label = "Destination_PIN",
            Position = new Position(lonLat.lat, lonLat.lon),
            Type  = PinType.Pin,
            Color = Colors.Gray
        };
        var previousPin = _mapView.Pins.FirstOrDefault(x => x.Label == "Destination_PIN");
        if (previousPin != null)
        {
            _mapView.Pins.Remove(previousPin);
        }
        _mapView.Pins.Add(pin);
    }

    private static double TotalDistance(List<(double Latitude, double Longitude)> points)
    {
        double totalDistance = 0;
        for (int i = 0; i < points.Count - 1; i++)
        {
            totalDistance += CalculateDistance(points[i].Latitude, points[i].Longitude, points[i + 1].Latitude, points[i + 1].Longitude);
        }
        return totalDistance;
    }
    private static byte[]? GetImageAsByteArray(string embeddedResourceName)
    {
        var assembly = Assembly.GetExecutingAssembly();
        foreach (var resourceName in assembly.GetManifestResourceNames())
        {
            Console.WriteLine(resourceName);
        }

        using var stream = assembly.GetManifestResourceStream(embeddedResourceName);
        if (stream == null) return null;
        using var memoryStream = new MemoryStream();
        stream.CopyTo(memoryStream);
        return memoryStream.ToArray();
    }

    private static double CalculateDistance(double lat1, double lon1, double lat2, double lon2)
    {
        const double r = 6371e3; // metres
        var φ1 = lat1 * Math.PI/180; // φ, λ in radians
        var φ2 = lat2 * Math.PI/180;
        var Δφ = (lat2-lat1) * Math.PI/180;
        var Δλ = (lon2-lon1) * Math.PI/180;

        var a = Math.Sin(Δφ/2) * Math.Sin(Δφ/2) +
                Math.Cos(φ1) * Math.Cos(φ2) *
                Math.Sin(Δλ/2) * Math.Sin(Δλ/2);
        var c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1-a));

        var distance = r * c; // in meters
        return distance;
    }
}