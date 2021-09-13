library view_router;

import 'package:flutter/material.dart';
import 'package:view_router/parse_route_uri.dart';
import 'package:view_router/routes.dart';

export 'package:view_router/routes.dart';
export 'package:view_router/view.dart';

/// A view router that parses named routes as URIs, supplying
/// any query parameters as arguments.
class ViewRouter {
  final Routes routes;

  ViewRouter({required this.routes});

  call(RouteSettings settings) => parseRouteUri(routes, settings);
}
