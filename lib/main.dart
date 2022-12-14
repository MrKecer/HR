import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'feature/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IK App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        primarySwatch: Colors.blue,
        backgroundColor: const Color(0xFF6711fe),
      ),
      home: const Splash(),
      // Splash(),
    );
  }
}
