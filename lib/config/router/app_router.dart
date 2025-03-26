import 'package:go_router/go_router.dart';
import 'package:mtg/presentation/pages/home/home_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
