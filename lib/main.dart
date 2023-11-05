import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nonstopioassignment/core/di/di.dart';
import 'package:nonstopioassignment/core/navigation/app_router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Injector.setUp();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.router.routeInformationParser,
      routerDelegate: appRouter.router.routerDelegate,
      routeInformationProvider: appRouter.router.routeInformationProvider,
    );
    
  }
}
