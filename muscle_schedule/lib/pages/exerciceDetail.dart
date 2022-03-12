import 'package:flutter/material.dart';
import 'package:muscle_schedule/pages/workout.dart';
import 'package:muscle_schedule/services/wgerApi.dart';

class ExerciceDetailsPage extends StatefulWidget {
  final Exercice exo;
  ExerciceDetailsPage({Key? key, required this.exo}) : super(key: key);

  @override
  State<ExerciceDetailsPage> createState() => _ExerciceDetailsPageState();
}

class _ExerciceDetailsPageState extends State<ExerciceDetailsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exo.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'On va mettre une liste la',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
