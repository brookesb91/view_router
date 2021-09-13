import 'package:flutter/material.dart';
import 'package:view_router/routes.dart';

/// Extract query parameters from a named route and generate
/// the page route, supplying the parameters as arguments.
///
/// Example:
///
/// Initial route settings:
///
/// name: `/profile?id=123`,
/// arguments: `null`
///
/// After:
///
/// name: `/profile`,
/// arguments: `{ id: '123' }`
Route<dynamic>? parseRouteUri(Routes routes, RouteSettings settings) {
  final Uri uri = Uri.parse(settings.name ?? '/');
  final Map<String, String> params = uri.queryParameters;

  final String path = uri.path;

  if (routes.containsKey(path)) {
    // If the path can be immediately found, return it.
    return MaterialPageRoute(
        builder: routes[path]!,
        settings: settings.copyWith(arguments: params, name: path));
  } else {
    // Otherwise, the route may not have been found due
    // to it containing dynamic parameters. Figure that out here.

    // Only get routes that have named parameters.
    final routesWithNamedParams = routes.keys
        .where((element) => RegExp(r":\w{1,}").hasMatch(element))
        .toList();

    routesWithNamedParams.sort((a, b) => a.length.compareTo(b.length));

    final segments = path.split('/').toList();

    for (var route in routesWithNamedParams) {
      final parts = route.split('/').toList();

      if (parts.length != segments.length) {
        // Lengths do not match.
        continue;
      }

      bool matches = true;
      final Map<String, String> namedParams = {};

      for (var i in segments.asMap().keys) {
        final isDynamic = RegExp(r":\w{1,}").hasMatch(parts[i]);

        matches = segments[i] == parts[i] || isDynamic;

        if (!matches) break;

        if (matches && isDynamic) {
          final name = parts[i].substring(1);
          final value = segments[i];
          namedParams[name] = value;
        }
      }

      if (matches) {
        namedParams.addAll(params);

        return MaterialPageRoute(
            builder: routes[route]!,
            settings: settings.copyWith(arguments: namedParams, name: path));
      }
    }
  }
}
