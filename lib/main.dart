import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waqarul Hasan Naqvi Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAoPCmqIuVbrhiFJCjjb8ZHnRzmBU93paM",
        authDomain: "waqarul-naqvi-portfolio.firebaseapp.com",
        projectId: "waqarul-naqvi-portfolio",
        storageBucket: "waqarul-naqvi-portfolio.appspot.com",
        messagingSenderId: "752520042022",
        appId: "1:752520042022:web:5776b3395111222e5df8e7",
        measurementId: "G-B5V9EGVS04",
      ),
    );

    // Simulate some delay for loading
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false; // Update loading state
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Loading indicator
        ),
      );
    } else {
      return const HomePage(); // Home page after loading
    }
  }
}
