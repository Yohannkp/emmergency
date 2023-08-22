import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:emergency/Page/Screen/Acceuil/Utils/header.dart';
import 'package:emergency/Page/Screen/D%C3%A9compte/Decompte.dart';
import 'package:emergency/Service/Requ%C3%AAtePersonneEnDanger/Requ%C3%AAteHopitalService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../Models/Requete.dart';
import 'Utils/AcceuilProposition.dart';
import 'Utils/BouttonSOS.dart';

class PageAcceuil extends StatefulWidget {
  const PageAcceuil({super.key});

  @override
  State<PageAcceuil> createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {

  late ValueNotifier<double> valueNotifier;
  late ValueNotifier<double> sizeNotifier;
  bool buttonclicked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valueNotifier =ValueNotifier(0.0);
    sizeNotifier =ValueNotifier(270);
  }

  @override
  Widget build(BuildContext context) {

    final sizeofAcceuil = MediaQuery.of(context).size;
    RequeteHopitalService rqhs = new RequeteHopitalService();

    return Scaffold(
      backgroundColor: Colors.white,
      body: ColoredSafeArea(
        color: Colors.red,
        child: Container(
          color: Colors.white,
                height: sizeofAcceuil.height,
                child: Column(

                  children: [

                    Expanded(
                        flex: 1,
                        child: Container(

                          color: Colors.red,
                      child: ListTile(
                        leading: Lottie.asset("lib/Assets/LottiesAnimation/PageAcceuil/animation_lk91fgm4.json"),
                        trailing: Text("Lomé",style: TextStyle(fontFamily: "Outfit",color: Colors.white),),
                      ),
                    )),


                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [

                            FittedBox(
                                fit: BoxFit.fitHeight,
                                child: Text("Avez vous besoins d'aide ?",style: TextStyle(fontSize: 40,fontFamily: "Outfit"),maxLines: 2,overflow: TextOverflow.ellipsis,)),


                          ],
                        ),
                      ),
                    ),



                    Expanded(
                      flex: 4,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [

                          AnimatedPositioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            duration: Duration(seconds: 2),
                            child: AnimatedContainer(

                              duration: Duration(seconds: 2),
                              child: ValueListenableBuilder(
                                  valueListenable: valueNotifier,
                                  builder: (BuildContext context, double value, Widget? child) {
                                    print("La valeur est : $value");
                                    return ValueListenableBuilder(valueListenable: sizeNotifier, builder: (BuildContext context, double value, Widget? child){
                                      print("La valeur est : $value");
                                      return LayoutBuilder(builder: (BuildContext context,contraint){
                                        if(MediaQuery.of(context).size.width>=400 && MediaQuery.of(context).size.width<1000){
                                          return SimpleCircularProgressBar(
                                            size: MediaQuery.of(context).size.height/4,
                                            progressStrokeWidth: 30,
                                            backStrokeWidth: 30,
                                            progressColors: const [Colors.red],
                                            mergeMode: true,
                                            backColor: Color(0xffD6D8E4),
                                            animationDuration: 1,
                                            valueNotifier: valueNotifier,
                                          );
                                        }
                                        return SimpleCircularProgressBar(
                                          size: MediaQuery.of(context).size.height/4,
                                          progressStrokeWidth: 30,
                                          backStrokeWidth: 30,
                                          progressColors: const [Colors.red],
                                          mergeMode: true,
                                          backColor: Color(0xffD6D8E4),
                                          animationDuration: 1,
                                          valueNotifier: valueNotifier,
                                        );
                                      });
                                    });
                                  }
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: (){
                                if(buttonclicked == true){

                                }else{
                                  Future.delayed(Duration(seconds: 3), () {
                                    // Action à exécuter après l'attente
                                    setState(() {
                                      buttonclicked = false;
                                    });
                                    valueNotifier.value = 0;

                                    void getmarequete() async{
                                     rqhs.EnvoiDetresse().then((value){
                                       print(value?.id);
                                       QuickAlert.show(
                                         context: context,
                                         type: QuickAlertType.success,
                                         text: 'Votre requête a bien été envoyée',
                                       );
                                       Navigator.push(
                                         context,
                                         MaterialPageRoute(builder: (context) => Decompte(id: value!.id,)),
                                       );
                                     });
                                    }

                                    getmarequete();





                                  });




                                  Future.delayed(Duration(seconds: 1), () {
                                    // Action à exécuter après l'attente
                                    valueNotifier.value = 100;

                                  });

                                  print("Fait");
                                }
                                setState(() {
                                  buttonclicked = true;
                                });



                              },
                              child: BouttonSOS(context,buttonclicked)),
                          // Example 10

                        ],
                      ),
                    ),


                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            FittedBox(child: Text("Vous ne savez pas quoi faire ?",style: TextStyle(fontFamily: "Outfit",fontSize: 20),)),
                            FittedBox(child: Text("Regardez nos propositions",style: TextStyle(color: Colors.grey,fontFamily: "Outfit"),))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AcceuilProposition(context,"J'ai été hurté \npar un véhicule","lib/Assets/PropositionAcceuilIcons/accident.png"),
                            SizedBox(width: 10,),

                            AcceuilProposition(context,"J'ai eu un\n accident à moto","lib/Assets/PropositionAcceuilIcons/motorbike.png"),
                            SizedBox(width: 10,),


                            AcceuilProposition(context,"J'ai des \nmaux de têtes","lib/Assets/PropositionAcceuilIcons/headache.png"),
                            SizedBox(width: 10,),


                            AcceuilProposition(context,"J'ai des \nmaux ventre","lib/Assets/PropositionAcceuilIcons/stomachache.png"),
                            SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    ),





                  ],
                )
              ),



      ),
    );
  }
  
  
}


class ColoredSafeArea extends StatelessWidget {
  final Color color;
  final Widget child;

  ColoredSafeArea({required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: child,
      ),
    );
  }

}
