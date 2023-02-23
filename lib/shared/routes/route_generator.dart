import 'package:flutter/material.dart';

import '../../features/breeds/presentation/pages/breed_detail_page.dart';
import '../../features/breeds/presentation/pages/breeds_page.dart';
import '../../features/splash/presentation/splash_page.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    final availableRoutes = getAvailableRoutes(args);
    var page = availableRoutes[settings.name];

    page ??= (_) => const SplashPage();

    return MaterialPageRoute(settings: settings, builder: page);
  }

  static Map<String, WidgetBuilder> getAvailableRoutes(Map? args) {
    return {
      AppRoutes.splashPage: (_) => const SplashPage(),
      AppRoutes.breedsPage: (_) => const BreedsPage(),
      AppRoutes.breedDetailPage: (_) => BreedDetailPage(
            breed: args!.values.first,
          ),
    };
  }
}
