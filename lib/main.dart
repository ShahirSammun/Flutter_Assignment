import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'match_list_screen.dart';


Future<void> main() async {
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
      title: 'Firebase App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const MatchListScreen(),
    );
  }
}