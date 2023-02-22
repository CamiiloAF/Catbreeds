import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/http/di/http_di.dart';
import 'features/breeds/di/breeds_di.dart';
import 'shared/routes/route_generator.dart';
import 'shared/theme/app_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final dependencies = [HttpDI(), BreedsDI()];

  for (var dependency in dependencies) {
    dependency.initializeDependencies();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Michis',
        theme: AppTheme.lightTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
