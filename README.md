[Example Project](https://github.com/brookesb91/view_router_demo)

A view router library for Flutter apps.

## Features

TODO

## Getting started

In your `pubspec.yaml`, add to your dependencies.

```yaml
view_router:
  git:
    url: git://github.com/brookesb91/view_router.git
```

## Usage

### Basic Usage

Define your view routes.

```dart
import 'package:view_router/view_router.dart';

final Routes routes = {
  '/': (_) => HomePage(),
  '/items': (_) => ItemsPage()
};
```

Create a `ViewRouter` and add to your `MaterialApp` as the `onGenerateRoute` callback.

```dart
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      onGenerateRoute: ViewRouter(routes),
      initialRoute: '/',
    );
  }
}
```

Navigate using the navigator.

```dart
Navigator.of(context).pushNamed('/profile');
```

## Additional information

TODO
