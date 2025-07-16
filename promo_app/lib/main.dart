import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initializing = true;
  bool _loggedIn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _initializing = false;
      });
    });
  }

  void _login() {
    setState(() {
      _loggedIn = true;
    });
  }

  void _logout() {
    setState(() {
      _loggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Promo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: _initializing
          ? const LoadingScreen()
          : _loggedIn
              ? HomeScreen(onLogout: _logout)
              : LoginScreen(onLogin: _login),
    );
  }
}
