import 'package:flutter/material.dart';

/// Build a widget using the given builder which is supplied
/// with the query parameters parsed from the current named route.
///
/// Example:
///
/// ```
/// static MyViewWidget route(BuildContext context) {
///   return view(context, (args) => MyViewWidget(id: args['id']));
/// }
/// ```
Widget view(
    BuildContext context, Widget Function(Map<String, String>) builder) {
  final args =
      ModalRoute.of(context)!.settings.arguments as Map<String, String>;
  return builder.call(args);
}
