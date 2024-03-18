namespace MauiAppVTC.Pages;

public partial class FlyoutMenuPage : ContentPage
{
    public FlyoutMenuPage()
    {
        InitializeComponent();
        Title = "Menu";
        var menuItems = new List<(string Title, Type PageType)>
        {
            ("Home", typeof(MainPage)),
           // ("Settings", typeof(SettingsPage)),
            // Add other menu items here
        };

        ListView menuListView = new ListView
        {
            ItemsSource = menuItems.Select(mi => mi.Title).ToList()
        };

        menuListView.ItemSelected += async (sender, e) =>
        {
            if (e.SelectedItem is string title)
            {
                var pageType = menuItems.First(mi => mi.Title == title).PageType;
                Page page = (Page)Activator.CreateInstance(pageType);
                await this.Navigation.PushAsync(page);
                
                // Close the flyout
                if (Parent is FlyoutPage flyoutPage)
                {
                    flyoutPage.IsPresented = false;
                }
            }
        };

        Content = menuListView;
    }
}