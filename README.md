TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

### Basic Usage

Define your view routes.

```dart
import 'package:view_router/view_router.dart';

final Routes routes = {
  '/': (_) => HomePage(),
  '/profile': (_) => ProfilePage()
};
```

Create a `ViewRouter` and add to your `MaterialApp` as the `onGenerateRoute` callback.

```dart

class App extends StatelessWidget {
  // This widget is the root of your application.
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

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
