import 'package:emmergency/HomePage/Utils/Contenu.dart';

import 'package:flutter/material.dart';

import 'Utils/NavBarSideButton.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int index_page;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index_page = 0;
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("AMBULANCE",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
        actions: [

          GestureDetector(
              onTap: (){
                setState(() {
                  index_page = 4;
                });
              },
              child: Image.asset("lib/Asset/notification.png",width: 25,)),Text("2"),Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 0.2
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            width: screenwidth/5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

                children: [Image.asset("lib/Asset/map.png"),Text("Lomé - TOGO",maxLines: 1,overflow: TextOverflow.ellipsis,)],),
            ),),
        )],
      ),
      body: Center(
        child: Row(
          children: [
            SideBar(),
            Contenu(indice: index_page,)
          ],
        ),
      ),
    );
  }
  Widget SideBar(){
    return Expanded(child: Container(child: Column(
      children: [

        GestureDetector(
            onTap: (){
              setState(() {
                index_page = 0;
              });
            },
            child: NavBarSideButton("Acceuil", Image.asset("lib/Asset/speedometer.png",width: 20,))),
        GestureDetector(
            onTap: (){
              setState(() {
                index_page = 1;
              });
            },
            child: NavBarSideButton("Historiques", Image.asset("lib/Asset/history.png",width: 20,))),
        GestureDetector(
            onTap: (){
              setState(() {
                index_page = 2;
              });
            },
            child: NavBarSideButton("Paramètre", Image.asset("lib/Asset/gear.png",width: 20,))),
        NavBarSideButton("Déconnexion", Image.asset("lib/Asset/log-out.png",width: 20,)),
        Spacer(),
        Container(
          child: ListTile(
            title: Center(child: Text("EMERGENCY",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),maxLines: 1,overflow: TextOverflow.ellipsis,)),

          ),
        )
      ],
    ),));
  }
}


