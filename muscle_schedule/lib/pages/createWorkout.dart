import 'package:flutter/material.dart';
import 'package:muscle_schedule/pages/workout.dart';
import 'package:muscle_schedule/services/wgerApi.dart';


class CreateWorkout extends StatefulWidget {
  const CreateWorkout({ Key? key }) : super(key: key);
  
  @override
  State<CreateWorkout> createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  final TextEditingController _controllerName = TextEditingController();
  DateTime? day;
  @override
  Widget build(BuildContext context) {
    Future <void> getDate() async {
      day = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2300)
      );
    }
    return Scaffold(
      appBar: AppBar(
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
                  controller: _controllerName,
                  ),
                  ElevatedButton(onPressed: ()=> getDate(), child: Text("choisire la date")),
                  ElevatedButton(onPressed: _pushSaved, child: Text("choisire lees exercice")),

                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () => addWorkout(_controllerName.text , day, select),
                    child: Text('TextButton'),
                  )
                ]
              ),
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
            itemBuilder: /*1*/ (context, i) {
              return _buildRow(exercices[i]);
            })
          );
        },
      ),
    );
  }
  final select = <Exercice>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

    Widget _buildRow(Exercice pair) {
    final alreadySaved = select.contains(pair);
    return ListTile(
      title: Text(
        pair.name!,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.check_box : Icons.check_box,
        color: alreadySaved ? Colors.blue : null,
        semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
      ),
      onTap: () {
        // NEW lines from here...
        setState(() {
          if (alreadySaved) {
            select.remove(pair);
          } else {
            select.add(pair);
          }
        });
      },
    );
  }
}
void addWorkout(String name, DateTime? day, List<Exercice> exo) {
 workout.add(Workout(name: name, day: day, exercice: exo));
}


  