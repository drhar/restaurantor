# restaurantour

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Developing

To run this application locally, you'll need to locate and enable the Google API Keys. **NEVER CHECK THESE IN TO THE CODEBASE**. First, create a `.env`:

```
cp .env.copy .env
```

### Google Maps

* Go to the API Keys in the GCP: https://console.cloud.google.com/apis/credentials?project=restaurantour
* Locate the API Key for the platform you are interested in
* Edit the API Key so that you can use it with your locally signed debug application. E.g. for Android:
    * The package name is the `applicationId` in `build.gradle`
    * You can get the SHA 1 by running (in the restaurantour root): ```./android/gradlew signingReport```
* Add the API key to your new .env file (this is .gitignored but please be careful!!!!)