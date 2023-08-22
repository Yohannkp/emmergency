import 'package:emergency/Page/Screen/Parametre/Utils/ParametreOption.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class ParametrePage extends StatelessWidget {
  const ParametrePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("P A R A M E T T R E",style: TextStyle(color: Colors.white,fontFamily: "Outfit"),),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenheight,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Lottie.asset("lib/Assets/LottiesAnimation/PageParametre/animation_llb5rm3o.json",width: MediaQuery.of(context).size.height/4)),
              Text("Informations personnelles",style: TextStyle(fontFamily: "Outfit"),),
              Parametreoption("Informations personnelles", "lib/Assets/LottiesAnimation/PageParametre/user.png", context),
              Parametreoption("Modifier mon mot de passe", "lib/Assets/LottiesAnimation/PageParametre/padlock.png", context),
              Parametreoption("Informations personnelles", "lib/Assets/LottiesAnimation/PageParametre/user.png", context),
              Text("Autres",style: TextStyle(fontFamily: "Outfit"),),
              Parametreoption("Notifications", "lib/Assets/BottomNavbarIcons/bell.png", context),
              Parametreoption("Historiques", "lib/Assets/LottiesAnimation/PageParametre/history.png", context),
            ],
          ),
        ),
      ),
    );
  }
}
