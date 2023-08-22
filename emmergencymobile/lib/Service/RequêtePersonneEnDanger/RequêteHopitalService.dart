import 'dart:convert';

import 'package:emergency/Models/Requete.dart';
import 'package:http/http.dart' as http;
class RequeteHopitalService{
  Future<Requete?> EnvoiDetresse() async {
    final response = await http.post(
      Uri.parse('http://192.168.10.119:8000/api/EnvoiDétresse/'),
      body: {
        "description" : "J'ai des maux de ventre",
        "statut" : "En attente",
        "personne_en_danger" : "3"
      },
    );

    final Map<String ,dynamic> data = json.decode(response.body);

    if (response.statusCode == 200) {
      // La requête a réussi, vous pouvez traiter la réponse ici
      print("Résultat de la requête : ${response.body}");

      return Requete.fromJson(data);
    } else {
      // La requête a échoué
      print('Échec de la requête POST avec le code ${response.statusCode} ${response.body}');
      return null;
    }
  }


  Stream<Requete> MaRequeteEncours(int id,_controller) async* {
    final response = await http.get(Uri.parse('http://192.168.10.119:8000/api/RequeteEnAttente/$id'));
    if (response.statusCode == 200) {
      final Map<String ,dynamic> data = json.decode(response.body);
      print(data);
      final Requete personne = Requete.fromJson(data);
      print(personne);
      _controller.sink.add(personne);

    } else {
      throw Exception('Failed to load data');
    }


  }




}