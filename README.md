# Downloader

A Image download app.

## Getting Started

## Create Env File
create `env.json` in `assets/config` folder.

```json
{
    "development": {
        "host": "http://10.0.2.2:3000",
        "debug": true,
        "testing": false
    },
    "testing": {
        "host": "http://10.0.2.2:3000",
        "debug": false,
        "testing": true
    },
    "production": {
        "host": "http://10.0.2.2:3000",
        "debug": false,
        "testing": false
    }
}
```

### Build Runner
```
$ dart run build_runner watch
```


## Flutter Doc
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
