import 'dart:async';
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:emergency/Models/Requete.dart';
import 'package:emergency/Service/Requ%C3%AAtePersonneEnDanger/Requ%C3%AAteHopitalService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
class Decompte extends StatefulWidget {
  int? id;

  Decompte({required this.id});

  @override
  State<Decompte> createState() => _DecompteState();
}

class _DecompteState extends State<Decompte> {
  RequeteHopitalService requeteHopitalService = new RequeteHopitalService();
  StreamController<Requete> _controller = StreamController<Requete>();

  EmmettreUneNotification(int id,String titre,String body){
    AwesomeNotifications().createNotification(
        schedule: NotificationAndroidCrontab.daily(referenceDateTime: DateTime.now().add(Duration(seconds: 5))),
        actionButtons: [

        ],content: NotificationContent(
      criticalAlert: true,
      displayOnForeground: true,
      displayOnBackground: true,
      locked: true,
      id: 1, channelKey: 'basic_channel',title: "${titre}${Emojis.emotion_beating_heart}",body: '${body}',));
  }




  void fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.10.119:8000/api/RequeteEnAttente/${this.widget.id}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final Requete requete = Requete.fromJson(responseData);
        setState(() {
          _controller.add(requete);
        });

      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      _controller.sink.addError(e.toString());
    }
  }

  ValueNotifier<bool> valueNotifier = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool statut_notification = false;
    fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Attente de réponses",style: TextStyle(color: Colors.white,fontFamily: "Outfit"),),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder(
                stream: _controller.stream,
                builder: (context,snapshot){

                  if(snapshot.hasError){
                    print("Une erreur est survenue ${snapshot.error}");
                    return Text("Une erreur est survenue ${snapshot.error}");
                  }
              else if( snapshot.connectionState == ConnectionState.waiting){
                return Center(child: TimerCountdown(
                  format: CountDownTimerFormat.daysHoursMinutesSeconds,
                  endTime: DateTime.now().add(
                    Duration(

                      minutes: 1,
                      seconds: 30,
                    ),
                  ),
                  onEnd: () {
                    print("Temps écoulé");
                  },
                ));
              }

              else if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  print("nous affichons : ${snapshot.data.toString()}");
                  return Text("aucune requête envoyée");
                }else{
                  print("Nous n'avons rien trouvé");
                  return Text("aucune requête envoyée");
                }



              }else{
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    LayoutBuilder(builder: (context,contrainte){
                      if(snapshot.data?.hopital != null){
                        if (valueNotifier.value == false) {
                          valueNotifier.value = true;
                          EmmettreUneNotification(1, "Urgence", "Une ambulance est en route vers votre position");// Marquer la fonction comme exécutée
                          valueNotifier.value = true;
                        }
                        return Container();

                      }else{
                        statut_notification == false;
                        return Container();
                      }
                    }),

                    ValueListenableBuilder(valueListenable: valueNotifier, builder: (context, value, child){
                      return LayoutBuilder(builder: (BuildContext context,contraint){
                        return Container();
                      });
                    },),



                    Text(snapshot.data?.hopital == null?"En attente d'une reponse":"${snapshot.data?.hopital} à accepté votre requête"),
                    snapshot.data?.hopital ==null?Container():Lottie.asset("lib/Assets/LottiesAnimation/PageDecompte/animation_lllhex3g.json") ,


                    LayoutBuilder(builder: (context,constaint){
                      if(snapshot.data?.hopital == null){
                        return TimerCountdown(
                          format: CountDownTimerFormat.daysHoursMinutesSeconds,
                          endTime: DateTime.now().add(
                            Duration(

                              minutes: 1,
                              seconds: 30,
                            ),
                          ),
                          onEnd: () {
                            print("Temps écoulé");
                          },
                        );
                      }else{
                        return Text("");
                      }
                    }),

                  ],
                );
              }
            }),

          ],
        ),
      ),
    );
  }
}


