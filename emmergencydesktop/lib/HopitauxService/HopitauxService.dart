
import 'package:http/http.dart' as http;
class HopitauxService{

  Future<void> fetchApiData(int id) async {
    final response = await http.post(
      Uri.parse('http://192.168.10.119:8000/api/ConfirmationHopitale/$id/'),
      body: {
        "description" : "J'ai des maux de têtes",
        "statut" : "Acceptée",
        "personne_en_danger" : "1",
        "hopital": "1"
      },
    );

    if (response.statusCode == 200) {
      // La requête a réussi, vous pouvez traiter les données ici
      print(response.body);
    } else {
      // La requête a échoué
      print('Échec de la requête GET avec le code ${response.statusCode}');
    }
  }
}