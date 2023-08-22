class Requete {
  int? id;
  String? description;
  String? statut;
  int? personne_en_danger;
  int? hopital;
  Requete({required this.id,required this.description,required this.statut,required this.personne_en_danger,required this.hopital,});

  Map<String, dynamic> toJson(){
    return{
      'id' : id ,
      'description' : description ,
      'statut' : statut ,
      'personne_en_danger' : personne_en_danger ,
      'hopital' : hopital ,
    };}
  static Requete fromJson(Map<String,dynamic> json) => Requete(id: json['id'],description: json['description'],statut: json['statut'],personne_en_danger: json['personne_en_danger'],hopital: json['hopital'],);

}