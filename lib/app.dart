import 'package:flutter/material.dart';
import 'package:math/features/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
