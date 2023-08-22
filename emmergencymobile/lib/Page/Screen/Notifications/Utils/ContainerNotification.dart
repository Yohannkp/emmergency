import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'NotificationApi.dart';

Widget ContainerNotification(String Titre,String Description){

  EmmettreUneNotification(int id,String titre,String body){
    AwesomeNotifications().createNotification(
        schedule: NotificationAndroidCrontab.daily(referenceDateTime: DateTime.now().add(Duration(seconds: 5))),
        actionButtons: [
      NotificationActionButton(key: "1", label: "Boutton 1 "),
      NotificationActionButton(key: "2", label: "Boutton 2 "),
    ],content: NotificationContent(
      criticalAlert: true,
      displayOnForeground: true,
      displayOnBackground: true,
      locked: true,
      id: 1, channelKey: 'basic_channel',title: "${titre}${Emojis.emotion_beating_heart}",body: '${body}',));
  }

  return Dismissible(
    confirmDismiss: (DismissDirection direction) async{
      if(direction == DismissDirection.startToEnd){
        print("Supprimer");
        //NotificationApi.showNotification();
        EmmettreUneNotification(1, "Vous nous avez oublié ? ", 'Terminer la configuration de votre compte');
        }else{
        print("Confirmer");
      }
    },
    background: Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Text("Supprimer",textAlign: TextAlign.start,style: TextStyle(color: Colors.white,fontFamily: "Outfit",fontSize: 20),)),
      ),
    ),

    secondaryBackground: Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Text("Confirmer",textAlign: TextAlign.end,style: TextStyle(color: Colors.white,fontFamily: "Outfit",fontSize: 20),)),
      ),
    ),
    key: ValueKey<String>("$Titre$Description"),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey[200],
        child: ListTile(
          leading: Lottie.asset("lib/Assets/LottiesAnimation/PageNotification/animation_lk92y6gv.json"),
          title: Text(Titre,style: TextStyle(fontFamily: "Outfit"),),
          subtitle: Text(Description,style: TextStyle(fontFamily: "Outfit",color: Colors.grey),),
        ),
      ),
    ),
  );
}