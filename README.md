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

### Using Named Parameters

> `view` is a convenience function for defining a builder with access to all named and query route parameters. View builders have the signature `Widget Function(BuildContext, Widget Function(Map<String, String>))`

```dart
final Routes routes = {
  // Home route
  '/': (context) => view(context, (_) => HomePage()),
  // List route
  '/items': (context) => view(context, (_) => ItemsPage()),
  // List item route
  // Named parameters are prefixed with a `:`.
  // The value with the specified name will be added to `params`.
  '/items/:item_id': (context) =>
    view(context, (params) => ItemPage(id: params['item_id']))
}
```

## Additional information

TODO
