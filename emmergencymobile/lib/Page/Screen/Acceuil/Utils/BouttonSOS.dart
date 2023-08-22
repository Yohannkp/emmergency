import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget BouttonSOS(BuildContext cont,bool butonclicked){
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      final screenwidth = MediaQuery.of(context).size.width;
      final screenheight = MediaQuery.of(context).size.height;

      if(screenwidth < 400){
        print("phone");
        return AnimatedContainer(
          duration: Duration(seconds: 2),
          width: MediaQuery.of(cont).size.width/1.2,
          height: MediaQuery.of(cont).size.height/2,

          child: Stack(
            children: [

              AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Lottie.asset('lib/Assets/LottiesAnimation/PageAcceuil/animation_lk8vr25j.json',fit: BoxFit.contain)),
              Center(child: Text("SOS",style: TextStyle(color: CupertinoColors.white,fontSize: MediaQuery.of(cont).size.height/15,fontFamily: "Outfit"))),




            ],
          ),
        );
      }
      else if(screenwidth >=400 && screenwidth < 1000){
        print('tablette');
        return AnimatedContainer(
          duration: Duration(seconds: 2),

          width: MediaQuery.of(cont).size.width/1.2,
          height: MediaQuery.of(cont).size.height/2.5,

          child: Stack(
            children: [

              AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  bottom: 0,
                  left: butonclicked?MediaQuery.of(cont).size.width/8:0,
                  right: butonclicked?MediaQuery.of(cont).size.width/8:0,
                  top: 0,
                  child: Lottie.asset('lib/Assets/LottiesAnimation/PageAcceuil/animation_lk8vr25j.json',fit: BoxFit.contain)),
              Center(child: Text("SOS",style: TextStyle(color: CupertinoColors.white,fontSize: MediaQuery.of(cont).size.height/15,fontFamily: "Outfit"))),




            ],
          ),
        );
      }
      else{
        print("pc");
        return AnimatedContainer(
          duration: Duration(seconds: 2),
          width: MediaQuery.of(cont).size.width,
          height: MediaQuery.of(cont).size.height/2.5,

          child: Stack(
            children: [

              AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  bottom: 0,
                  left: butonclicked?MediaQuery.of(cont).size.width/8:0,
                  right: butonclicked?MediaQuery.of(cont).size.width/8:0,
                  top: 0,
                  child: Lottie.asset('lib/Assets/LottiesAnimation/PageAcceuil/animation_lk8vr25j.json',fit: BoxFit.contain)),
              Center(child: Text("SOS",style: TextStyle(color: CupertinoColors.white,fontSize: MediaQuery.of(cont).size.height/15,fontFamily: "Outfit"))),




            ],
          ),
        );
      }

    },
  );
  ;
}