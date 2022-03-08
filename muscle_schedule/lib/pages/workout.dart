import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}

class Exercice {
  String name; 
  String status;
  String description;
  int category;
  String muscles;
  String muscles_secondary;
  String equipment;
  Exercice({required this.name, required this.status, required this.description, required this.category, required this.muscles, required this.muscles_secondary, required this.equipment});
}

class Workout {
  String name;
  String day;
  Exercice exercice; 
  Workout({required this.name, required this.day ,required this.exercice });
}