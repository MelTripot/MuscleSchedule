import 'dart:collection';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:muscle_schedule/pages/workout.dart';
import 'package:table_calendar/table_calendar.dart';

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
List<Workout> MyWorkout = [] ;
List<Exercice> exercices = [];
DateTime? day;
    Future <void> getDate(context) async {
      day = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2300)
      );
    }

List<Workout> getWod(DateTime key) {
  List<Workout> wod = MyWorkout.where((c) => c.day == key).toList();
  return wod;
}
