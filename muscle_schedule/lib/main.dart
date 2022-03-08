import 'package:flutter/material.dart';
import 'package:muscle_schedule/pages/calendar.dart';
import 'package:muscle_schedule/pages/workout.dart';
import 'package:muscle_schedule/widget/navgbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'App flutter je dois trouver un nom'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {}

  var display = WorkoutPage();

  Widget getpage() {
    if (Navbar().page == 0) {
      display = WorkoutPage();
    } else if (Navbar().page == 1) {
      return CalendarPage();
    } else if (Navbar().page == 2) {
      return WorkoutPage();
    } else if (Navbar().page == 3) {
      return WorkoutPage();
    } else {
      return WorkoutPage();
    }
    return WorkoutPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getpage(),
      bottomNavigationBar: Navbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
