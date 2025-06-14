import 'package:flutter/material.dart';
import 'package:un_widget/screens/combined_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
