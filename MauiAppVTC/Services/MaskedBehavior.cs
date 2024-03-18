namespace MauiAppVTC.Services;

public class MaskedBehavior : Behavior<Entry>
{
    protected override void OnAttachedTo(Entry entry)
    {
        entry.TextChanged += OnEntryTextChanged;
        base.OnAttachedTo(entry);
    }

    protected override void OnDetachingFrom(Entry entry)
    {
        entry.TextChanged -= OnEntryTextChanged;
        base.OnDetachingFrom(entry);
    }

    private void OnEntryTextChanged(object sender, TextChangedEventArgs args)
    {
        var entry = (Entry)sender;
        var text = entry.Text;

        if (string.IsNullOrWhiteSpace(text) || text.Length <= 6)
            return;

        text = text.Substring(0, 6);  // enforce max length
        entry.Text = text;
    }
}
