import 'package:flutter/material.dart';
Widget ContainerDonneeAnterieures(screenwidth,screenheight,String text,String nombre,icon){
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey, // Couleur de l'ombre
            spreadRadius: 5, // Étendue de l'ombre
            blurRadius: 2, // Flou de l'ombre
            offset: Offset(0, 6), // Décalage de l'ombre (horizontal, vertical)
          ),
        ],
      ),
      width: screenwidth/4.5,
      height: screenheight/6,
      child: Row(
        children: [
          Expanded(child: Container(child: CircleAvatar(
              radius: 40,
              child: Icon(icon,size: 45,)),)),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$nombre",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),maxLines: 1,overflow: TextOverflow.ellipsis,),
              Text("$text",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,),

            ],
          ),)
        ],
      )
    ),
  );
}