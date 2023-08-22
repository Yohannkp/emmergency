import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:emergency/Page/Screen/Service/Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:global_bottom_navigation_bar/widgets/bottom_navigation_item.dart';
import 'package:global_bottom_navigation_bar/widgets/scaffold_bottom_navigation.dart';
import 'package:ionicons/ionicons.dart';

import 'Screen/Acceuil/PageAcceuil.dart';
import 'Screen/Contact/Contacts.dart';
import 'Screen/Notifications/PageNotifications.dart';
import 'Screen/Parametre/ParametrePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return ScaffoldGlobalBottomNavigation(

      listOfChild: [
        PageAcceuil(),
        ServiceSupport(),
        Contacts(),
        ParametrePage(),
      ],
      listOfBottomNavigationItem: buildBottomNavigationItemList(),
    );
  }

  List<BottomNavigationItem> buildBottomNavigationItemList() => [
    BottomNavigationItem(
      activeIcon:Image.asset("lib/Assets/BottomNavbarIcons/home.png",scale: 20,color: Colors.red),
      inActiveIcon: Image.asset("lib/Assets/BottomNavbarIcons/home.png",scale: 20,color: Colors.grey,),

      color: Colors.white,
      vSync: this,
    ),

    BottomNavigationItem(
      activeIcon: Image.asset("lib/Assets/BottomNavbarIcons/support.png",scale: 17,color: Colors.red),
      inActiveIcon: Image.asset("lib/Assets/BottomNavbarIcons/support.png",scale: 17,color: Colors.grey),
      title: 'Services',
      color: Colors.white,
      vSync: this,
    ),
    BottomNavigationItem(
      activeIcon: Image.asset("lib/Assets/BottomNavbarIcons/call.png",scale: 20,color: Colors.red),
      inActiveIcon: Image.asset("lib/Assets/BottomNavbarIcons/call.png",scale: 20,color: Colors.grey),
      title: 'Contacts',
      color: Colors.white,
      vSync: this,
    ),


    BottomNavigationItem(
      activeIcon: Image.asset("lib/Assets/BottomNavbarIcons/settings.png",scale: 20,color: Colors.red),
      inActiveIcon: Image.asset("lib/Assets/BottomNavbarIcons/settings.png",scale: 20,color: Colors.grey),
      title: 'Paramètre',
      color: Colors.white,
      vSync: this,
    ),
  ];
}

