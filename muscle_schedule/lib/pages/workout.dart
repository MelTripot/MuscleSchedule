import 'package:flutter/material.dart';
import 'package:muscle_schedule/pages/createWorkout.dart';
import 'package:muscle_schedule/services/wgerApi.dart';
import 'package:muscle_schedule/utils.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({ Key? key }) : super(key: key);
  final String title = 'Workout';
  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: 
            MyWorkout.isNotEmpty ?
            ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: MyWorkout.length,
            itemBuilder: /*1*/ (context, i) {
              print(i);
              print(MyWorkout.length);
              
              return _buildRow(MyWorkout[i]);
            }) : null,
            floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateWorkout()),
              );
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
            ),
    );
  }
  
  final select = <Exercice>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

    Widget _buildRow(Workout pair) {
    return ListTile(
      title: Text(
        pair.name!,
        style: _biggerFont,
      ),
      onTap: () { },
    );
  }
}


class Exercice {
  String? name;
  String? status;
  String? description;
  int? category;
  List<int> muscles;
  List<int> musclesSecondary;
  List<int> equipment;
  Exercice(
      {required this.name,
      required this.status,
      required this.description,
      required this.category,
      required this.muscles,
      required this.musclesSecondary,
      required this.equipment});
}

class Workout {
  String? name;
  DateTime? day;
  List<Exercice?> exercice; 
  Workout({required this.name, required this.day ,required this.exercice });
}
