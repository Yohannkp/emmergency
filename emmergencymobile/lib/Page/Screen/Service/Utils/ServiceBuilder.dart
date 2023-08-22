import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

Widget ServiceBuilder(context,String link,String text){
  final screenwidth = MediaQuery.of(context).size.width;
  final screenheight = MediaQuery.of(context).size.height;

  return GestureDetector(
    onTap: (){
      showModalBottomSheet(context: context, builder: (BuildContext context){
        return SingleChildScrollView(
          child: Container(
            width: screenwidth,
            child: Column(
              children: [
                Image.asset("lib/Assets/Service/flag.png",scale: 3,),
               Container(
                 width: screenwidth/1.2,

                 child: Center(
                   child: CupertinoTextField(
                     padding: EdgeInsets.all(20),
                     placeholder: "Decrivez nous la situation",
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       color: Colors.white
                     ),
                   ),
                 ),
               ),
                TextButton(onPressed: (){
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'Votre message a bien été envoyée',
                  );
                  Navigator.pop(context);
                }, child: Container(child: Text("Soumettre"),))
              ],
            ),
          ),
        );
      });
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: LayoutBuilder(builder: (BuildContext context,size){
        print("Taille de l'écran : ${size.maxWidth}");
        if(size.maxWidth > 450 && size.maxWidth < 690){
          return Container(
            width: screenwidth/2.2,
            height: screenheight/3,
            color: Colors.grey[300],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("$link",scale: screenwidth/150,),
                  Text("$text",style: TextStyle(fontFamily: "Outfit",fontSize: screenheight/50),)
                ],
              ),
            ),
          );
        }
        else if(size.maxWidth>=690){
          return Container(
            width: screenwidth/2.2,
            height: screenheight/3,
            color: Colors.grey[300],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("$link",scale: screenwidth/250,),
                  Text("$text",style: TextStyle(fontFamily: "Outfit",fontSize: screenheight/50),)
                ],
              ),
            ),
          );
        }

        else{
          return Container(
            width: screenwidth/2.2,
            height: screenheight/4,
            color: Colors.grey[300],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("$link",scale: screenwidth/70,),
                  Text("$text",style: TextStyle(fontFamily: "Outfit",fontSize: screenheight/50),)
                ],
              ),
            ),
          );
        }

      })
    ),
  );
}