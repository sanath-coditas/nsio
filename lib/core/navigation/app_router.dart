import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';
import 'package:nonstopioassignment/presentation/screens/auth_screen.dart';
import 'package:nonstopioassignment/presentation/screens/home_screen.dart';
import 'package:nonstopioassignment/presentation/screens/login_screen.dart';
import 'package:nonstopioassignment/presentation/screens/product_detail.dart';
import 'package:nonstopioassignment/presentation/screens/profile_sreen.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: '/auth',
        pageBuilder: (context, state) => MaterialPage(
          child: AuthScreen(),
        ),
      ),
      GoRoute(
        path: '/',
        name: 'login',
        pageBuilder: (context, state) => const MaterialPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: HomeScreen(
            user: ((state.extra as Map<String, dynamic>?)?['user'] as User),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: CurveTween(
              curve: Curves.easeIn,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        pageBuilder: (context, state) => CupertinoPage(
          child: ProfileScreen(
            user: ((state.extra as Map<String, dynamic>?)?['user'] as User),
          ),
        ),
      ),
      GoRoute(
        path: '/product_detail',
        name: 'product_detail',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: ProductDetail(
            beer: ((state.extra as Map<String, dynamic>?)?['beer'] as Beer),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: CurveTween(
              curve: Curves.easeIn,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
    ],
  );
}
