import 'package:flutter/material.dart';
import 'package:muscle_schedule/pages/workout.dart';

void createWorkout(String name, DateTime? day  ) {
  Workout(day: day, name: name, exercice: []);
}
  final TextEditingController _controllerName = TextEditingController();
  DateTime? day;
@override
  Widget build(BuildContext context) {
    Future <DateTime?> getDate() async {
      day = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2300));
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
                
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () => createWorkout(_controllerName.text , day),
                  child: Text('TextButton'),
                )]
              ),
      ),
      
    );
  }