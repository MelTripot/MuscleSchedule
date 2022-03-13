import 'package:flutter/material.dart';
import 'package:muscle_schedule/pages/workout.dart';
import 'package:muscle_schedule/services/wgerApi.dart';
import 'package:html/parser.dart';

class ExerciceDetailsPage extends StatefulWidget {
  final Exercice exo;
  ExerciceDetailsPage({Key? key, required this.exo}) : super(key: key);

  @override
  State<ExerciceDetailsPage> createState() => _ExerciceDetailsPageState();
}

class _ExerciceDetailsPageState extends State<ExerciceDetailsPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.exo.description != null) {
      final document = parse(widget.exo.description!);
      final String parsedString =
          parse(document.body!.text).documentElement!.text;
      widget.exo.description = parsedString.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exo.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Description  :',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              widget.exo.description!,
              style: const TextStyle(
                fontSize: 26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
