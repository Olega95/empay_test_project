# empay_test_project

Empay test project

## Getting Started

1. flutter pub get
2. A local server was used for development, so the baseUrl is local.
In order to connect to a remote server, you need to go to the path lib/core/dio/rest_client and on line 8 change the baseUrl parameter, changing it to the url of the remote server.
3. flutter pub run build_runner build --delete-conflicting-outputs
4. flutter run --release --no-tree-shake-icons




Build application in release mode
```shell
flutter build apk --release --no-tree-shake-icons
flutter build ipa --release --no-tree-shake-icons
```

Run application in release mode
```shell
flutter run --release --no-tree-shake-icons
```
