import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/dashboard/presentation/screens/splash_screen.dart';
import '../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../features/analytics/presentation/screens/plant_analytics_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/analytics/:plantId/:plantName',
        name: 'analytics',
        builder: (context, state) => PlantAnalyticsScreen(
          plantId: state.pathParameters['plantId'] ?? '',
          plantName: state.pathParameters['plantName'] ?? '',
        ),
      ),
    ],
    initialLocation: '/',
  ));
