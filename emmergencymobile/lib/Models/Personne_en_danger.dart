
class Personne_en_danger {
  String id;
  String nom;
  String prenom;
  String email;
  String password;
  String telephone;
  String localisation;
  Personne_en_danger({required this.id,required this.nom,required this.prenom,required this.email,required this.password,required this.telephone,required this.localisation});

  Map<String, dynamic> toJson(){
    return{
      'nom' : nom ,
      'prenom' : prenom ,
      'email' : email ,
      'password' : password ,
      'telephone' : telephone ,
      'localisation' : localisation ,
    };}
  static Personne_en_danger fromJson(Map<String,dynamic> json) => Personne_en_danger(id: json["id"],nom: json['nom'],prenom: json['prenom'],email: json['email'],password: json['password'],telephone: json['telephone'],localisation: json['localisation']);

}