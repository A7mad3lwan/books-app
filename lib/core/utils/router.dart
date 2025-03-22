import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeViewRoute = '/homeView';
  static const kBookDetailsViewRoute = '/bookDetailsView';

  static final router = GoRouter(routes: []);
}
