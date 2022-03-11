import 'package:flutter/material.dart';
import 'package:muscle_schedule/services/wgerApi.dart';

void main() {
  runApp( MyApp());
}
  List<Workout> workout = [];

class MyApp extends StatelessWidget {
 MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = 'Workout';

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  void _addWorkout() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          (pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: TextStyle(fontSize: 18.0),
              ),
            );
          };

          return Scaffold(
              appBar: AppBar(
                title: const Text('Saved Suggestions'),
              ),
              body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'nom',
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'jour',
                        ),
                      ),
                    ]),
              ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getExo();
    print("object");
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'On va mettre une liste la',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => getExo()),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Exercice {
  String? name;
  String? status;
  String? description;
  int? category;
  String? muscles;
  String? muscles_secondary;
  String? equipment;
  Exercice(
      {required this.name,
      required this.status,
      required this.description,
      required this.category,
      required this.muscles,
      required this.muscles_secondary,
      required this.equipment});
}

class Workout {
  String name;
  DateTime? day;
  List<Exercice?> exercice; 
  Workout({required this.name, required this.day ,required this.exercice });
}
