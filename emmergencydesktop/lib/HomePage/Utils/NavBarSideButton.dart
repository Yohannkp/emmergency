import 'package:flutter/material.dart';
Widget NavBarSideButton(String title,icon){
  return Container(
    child: ListTile(
      leading: icon,
      title: Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,),
      trailing: Icon(Icons.navigate_next),
    ),
  );
}