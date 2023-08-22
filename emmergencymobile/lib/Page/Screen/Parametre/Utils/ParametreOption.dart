import 'package:flutter/material.dart';
Widget Parametreoption(String text,String icon,context){
  return ListTile(
    title: Text("$text"),
    subtitle: Divider(),
    leading: Image.asset("$icon",width: MediaQuery.of(context).size.width/15,),
    trailing: Icon(Icons.navigate_next),
  );
}