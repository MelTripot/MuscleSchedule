import 'dart:convert';
import 'dart:io';

import 'package:muscle_schedule/pages/workout.dart';
import 'package:http/http.dart' as http;

List<Exercice> exercices = [];
Future<void> getExo() async {
  var url = Uri.parse('https://wger.de/api/v2/exercise/?language=2&limit=300');
  http.Response response = await http.get(
    url,
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader:
          'Token f2f7d4b2f79e3554a8da29aa9ddc50e96df24ba6',
    },
  );
// List<dynamic> body = json.decode(response.body) ;
 var body = jsonDecode(response.body) as Map<String, dynamic>;
 int compt = 0;
 for (var exo in body["results"]) {
  List<int> convertM = exo["muscles"].cast<int>();
  List<int> convertM2 = exo["muscles_secondary"].cast<int>();
  List<int> convertEq = exo["equipment"].cast<int>();
  exercices.add(
    Exercice(
      name: exo["name"], 
      status: exo["status"], 
      description: exo["description"], 
      category: exo["category"], 
      muscles: convertM, 
      musclesSecondary: convertM2, 
      equipment: convertEq
    )
  );
  print(exercices[compt].name);
  compt ++;
 }
}
