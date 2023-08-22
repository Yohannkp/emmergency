import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget AcceuilHeader(context){
  return ListTile(

      leading: Lottie.asset("lib/Assets/LottiesAnimation/PageAcceuil/animation_lk91fgm4.json"),
      trailing: Container(
        width: MediaQuery.of(context).size.width/4,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Lomé",style: TextStyle(fontFamily: "Outfit",fontSize: 15,color: Colors.white),),
                Icon(Icons.location_on_sharp,color: Colors.blue,size: 15,)
              ],
            ),
            Text("Hedzranawoe",style: TextStyle(fontFamily: "Outfit",fontSize: 12,color: Colors.white))
          ],
        ),
      )
  );
}