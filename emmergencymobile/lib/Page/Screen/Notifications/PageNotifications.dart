import 'package:emergency/Page/Screen/Notifications/Utils/ContainerNotification.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Notifications",style: TextStyle(fontFamily: "Outfit",color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  ContainerNotification("Titre de la notification","Description de la notification ici on parle unpeut de ce qui se passe"),
                  ContainerNotification("Titre de la notificationd","Description de la notification ici on parle unpeut de ce qui se passe"),


                ],
              ),
            ),
          ),
        ),

    );
  }
}
