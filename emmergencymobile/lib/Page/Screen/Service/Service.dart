import 'package:flutter/material.dart';

import 'Utils/ServiceBuilder.dart';
class ServiceSupport extends StatelessWidget {
  const ServiceSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Services",style: TextStyle(color: Colors.white,fontFamily: "Outfit"),),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Wrap(

                spacing: 10,
                runSpacing: 10,
                children: [
                  ServiceBuilder(context, "lib/Assets/Service/ambulance.png", "Ambulance"),
                  ServiceBuilder(context, "lib/Assets/Service/police-station.png", "Police"),
                  ServiceBuilder(context, "lib/Assets/Service/no-aggression.png", "Mal traitance"),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
