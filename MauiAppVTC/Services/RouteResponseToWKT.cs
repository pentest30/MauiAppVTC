namespace MauiAppVTC.Services;

using System;
using System.Text.Json;

public class RouteResponseToWKT
{
    public static string ConvertResponseToWKT(string jsonResponse)
    {
        try
        {
            using (JsonDocument doc = JsonDocument.Parse(jsonResponse))
            {
                // Navigate to the coordinates array within the GeoJSON structure
                // Adjust the path as necessary based on the exact structure of your GeoJSON
                var coordinatesArray = doc.RootElement
                    .GetProperty("features")[0]
                    .GetProperty("geometry")
                    .GetProperty("coordinates")
                    .EnumerateArray();
                
                // Start building the WKT string for LINESTRING
                string wkt = "LINESTRING(";
                
                bool firstCoordinate = true;
                foreach (var coordinatePair in coordinatesArray)
                {
                    if (!firstCoordinate)
                    {
                        wkt += ", ";
                    }
                    firstCoordinate = false;

                    // Assuming each coordinate pair is an array [longitude, latitude]
                    var lon = coordinatePair[0].GetDouble();
                    var lat = coordinatePair[1].GetDouble();
                    
                    wkt += $"{lon} {lat}";
                }
                
                wkt += ")";
                return wkt;
            }
        }
        catch (Exception e)
        {
            Console.WriteLine($"Error converting GeoJSON to WKT: {e.Message}");
            return null;
        }
    }
    public static List<(double Latitude, double Longitude)> ParseLineString(string wkt)
    {
        var pointsList = new List<(double Latitude, double Longitude)>();
        if (string.IsNullOrWhiteSpace(wkt)) return pointsList;

        // Remove the LINESTRING prefix and split into points
        try
        {
            var trimmed = wkt.Replace("LINESTRING(", "").Replace(")", "");
            var points = trimmed.Split(',');

            foreach (var point in points)
            {
                try
                {
                    var coords = point.Trim().Split(' ');
                    var latitude = double.Parse(coords[0]);
                    var longitude = double.Parse(coords[1]);
                    pointsList.Add((latitude, longitude));
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    //throw;
                }
            }

            return pointsList;
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            return pointsList;
        }
    }

}
