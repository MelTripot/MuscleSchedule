import 'package:flutter/material.dart';
import 'package:muscle_schedule/pages/workout.dart';
import 'package:muscle_schedule/services/wgerApi.dart';
import 'package:muscle_schedule/utils.dart';

class CreateWorkout extends StatefulWidget {
  final Function callback;
  const CreateWorkout({Key? key, required this.callback}) : super(key: key);

  @override
  State<CreateWorkout> createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  final TextEditingController _controllerName = TextEditingController();
  final select = <Exercice>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'name',
            ),
            controller: _controllerName,
          ),
          ElevatedButton(
              onPressed: () => getDate(context), child: Text("chois date")),
          ElevatedButton(onPressed: _pushSaved, child: Text("chois exo")),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () =>
                addWorkout(_controllerName.text, day, select, context),
            child: Text('Save Workout'),
          )
        ]),
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Saved Suggestions'),
              ),
              body: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: exercices.length,
                  itemBuilder: /*1*/ (context, i) {
                    return _buildRow(exercices[i]);
                  }));
        },
      ),
    );
  }

  Widget _buildRow(Exercice exo) {
    return ListTile(
      title: Text(
        exo.name!,
        style: _biggerFont,
      ),
      onTap: () {
        setState(() {
          select.add(exo);
        });
      },
    );
  }

  void addWorkout(
      String name, DateTime? day, List<Exercice> exo, BuildContext context) {
    MyWorkout.add(Workout(name: name, day: day, exercice: exo));
    widget.callback();
    Navigator.pop(context);
  }
}
