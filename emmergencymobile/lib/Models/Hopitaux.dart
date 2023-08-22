
class Hopitaux {
  String id;
  String nom;
  String localisation;
  String horaire;
  Hopitaux({required this.id,required this.nom,required this.localisation,required this.horaire,});

  Map<String, dynamic> toJson(){
    return{
      'id' : id ,
      'nom' : nom ,
      'localisation' : localisation ,
      'horaire' : horaire ,
    };}
  static Hopitaux fromJson(Map<String,dynamic> json) => Hopitaux(id: json['uid'],nom: json['nom'],localisation: json['localisation'],horaire: json['horaire'],);

}