import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone_assignment_graduation/features/authentication/repos/authentication_repo.dart';
import 'package:tictok_clone_assignment_graduation/features/authentication/view/sign_in_screen.dart';
import 'package:tictok_clone_assignment_graduation/features/authentication/view/sign_up_screen.dart';
import 'package:tictok_clone_assignment_graduation/features/home/home_screen.dart';
import 'package:tictok_clone_assignment_graduation/features/home/mainnavigation_screen.dart';
import 'package:tictok_clone_assignment_graduation/features/home/post_screen.dart';
import 'package:tictok_clone_assignment_graduation/notifications/notifications_provider.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/login",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.subloc != SignUpScreen.routeURL &&
            state.subloc != SignInScreen.routeURL) {
          return SignUpScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          ref.read(notificationsProvider(context));
          return child;
        },
        routes: [
          GoRoute(
            name: SignUpScreen.routeName,
            path: SignUpScreen.routeURL,
            builder: (context, state) => const SignUpScreen(),
          ),
          GoRoute(
            name: SignInScreen.routeName,
            path: SignInScreen.routeURL,
            builder: (context, state) => const SignInScreen(),
          ),
          GoRoute(
            name: HomeScreen.routeName,
            path: HomeScreen.routeURL,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            name: MainNavigationScreen.routeName,
            path: MainNavigationScreen.routeURL,
            builder: (context, state) => const MainNavigationScreen(),
          ),
          GoRoute(
            name: PostScreen.routeName,
            path: PostScreen.routeURL,
            builder: (context, state) => const PostScreen(),
          ),
        ],
      )
    ],
  );
});
