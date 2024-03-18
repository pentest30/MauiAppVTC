using System.Reflection;

namespace MauiAppVTC.Services;

public static class ResourceLoader
{
    public static string LoadEmbeddedResourceAsString(string resourceFileName)
    {
        var assembly = IntrospectionExtensions.GetTypeInfo(typeof(ResourceLoader)).Assembly;
        var resourceName = assembly.GetManifestResourceNames().FirstOrDefault(name => name.EndsWith(resourceFileName, StringComparison.OrdinalIgnoreCase));

        if (resourceName == null)
        {
            throw new FileNotFoundException($"Resource with name {resourceFileName} not found.");
        }

        using (var stream = assembly.GetManifestResourceStream(resourceName))
        using (var reader = new StreamReader(stream))
        {
            return reader.ReadToEnd();
        }
    }
}