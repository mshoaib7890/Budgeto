import 'package:budgets_app/presentation/screens/auth/login_screen.dart';
import 'package:budgets_app/presentation/screens/home_screen/home_screen.dart';
import 'package:budgets_app/presentation/widgets/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'budgeto_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Safely initialize Firebase
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase initialization failed: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeSwitch(),
      builder: (context, _) {
        final themeSwitch = Provider.of<ThemeSwitch>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeSwitch.themeMode,
          theme: BudgetoThemes.lightTheme,
          darkTheme: BudgetoThemes.darkTheme,
          home: const AuthHandler(),
        );
      },
    );
  }
}

class AuthHandler extends StatelessWidget {
  const AuthHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong. Please try again."),
          );
        } else if (snapshot.hasData) {
          // User is logged in, show the BottomNav screen
          return const BottomNav();
        } else {
          // User is not logged in, show the HomeScreen
          return const LoginScreen();
        }
      },
    );
  }
}
