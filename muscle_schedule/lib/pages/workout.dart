import 'package:flutter/material.dart';
import 'package:muscle_schedule/pages/createWorkout.dart';
import 'package:muscle_schedule/services/wgerApi.dart';
import 'package:muscle_schedule/utils.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);
  final String title = 'Workout';
  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MyWorkout.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: MyWorkout.length,
              itemBuilder: /*1*/ (context, i) {
                return _buildRowWorkout(MyWorkout[i]);
              })
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateWorkout(callback: () {
                      setState(() {});
                    })),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildRowWorkout(Workout pair) {
    return ListTile(
      title: Text(
        pair.name!,
        style: _biggerFont,
      ),
      onTap: () {
        _curentWorkout(pair);
      },
    );
  }

  void _curentWorkout(Workout work) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${work.name}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed: () => getDate(context),
                        child: Text('${work.day}')),
                    // work.exercice.isNotEmpty
                    // ? ListView.builder(
                    //     padding: const EdgeInsets.all(16.0),
                    //     itemCount: work.exercice.length,
                    //     itemBuilder: /*1*/ (context, i) {
                    //       return _buildRowExercice(work.exercice[i]!);
                    //     })
                    // : null,
                  ]),
            ),
          );
        },
      ),
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
  Workout({required this.name, required this.day, required this.exercice});
}
