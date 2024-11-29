// import 'package:animations/animations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_netflix_app/home/presentation/view/home_movies.dart';
// import 'package:flutter_netflix_app/search/presentation/view/search_screen.dart';
//
// import 'package:go_router/go_router.dart';
//
// import '../../home/presentation/view/entry_point.dart';
//
// final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
//
// GoRouter router() {
//   return GoRouter(
//     navigatorKey: _rootNavigatorKey,
//     initialLocation: '/search',
//     routes: [
//       StatefulShellRoute.indexedStack(
//         parentNavigatorKey: _rootNavigatorKey,
//         builder: (context, state, navigationShell) {
//           return HomeScreen(navigationShell: navigationShell);
//         },
//         branches: [
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                 path: '/home',
//                 pageBuilder: (context, state) {
//                   return CustomTransitionPage(
//                     child: const HomeMovies(),
//                     transitionsBuilder:
//                         (context, animation, secondaryAnimation, child) {
//                       return SharedAxisTransition(
//                         animation: animation,
//                         secondaryAnimation: secondaryAnimation,
//                         transitionType: SharedAxisTransitionType.horizontal,
//                         child: child,
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                 path: '/search',
//                 pageBuilder: (context, state) {
//                   return CustomTransitionPage(
//                     child: const SearchScreen(),
//                     transitionsBuilder:
//                         (context, animation, secondaryAnimation, child) {
//                       return FadeTransition(
//                         opacity: CurveTween(
//                           curve: Curves.easeInOut,
//                         ).animate(animation),
//                         child: child,
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//   );
// }
//
