import 'package:go_router/go_router.dart';
import 'package:space_x/features/home/presentation/home_page_widget.dart';

/// Routes for the app
List<GoRoute> get appRoutes => [
      GoRoute(
        path: '/',
        builder: ((_, __) => const HomePageWidget()),
      ),
    ];
