import 'package:flutter/material.dart';

import '../../features/breeds/presentation/breeds_page.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    final availableRoutes = getAvailableRoutes(args);
    var page = availableRoutes[settings.name];

    page ??= (_) => const BreedsPage();

    return MaterialPageRoute(settings: settings, builder: page);
  }

  static Map<String, WidgetBuilder> getAvailableRoutes(Map? args) {
    return {
      AppRoutes.breedsPage: (_) => const BreedsPage(),
    };
  }
}
