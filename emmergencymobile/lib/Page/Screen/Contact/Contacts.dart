import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Personne à contacter",style: TextStyle(color: Colors.white,fontFamily: 'Outfit'),),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context,int){
            return Slidable(
                startActionPane: ActionPane(motion: const StretchMotion(), children: [

                  SlidableAction(
                    onPressed: (BuildContext context) {

                    },
                    backgroundColor: Colors.pink,
                    icon: Icons.add,
                  ),

                  SlidableAction(
                    onPressed: (BuildContext context) {

                    },
                    backgroundColor: Colors.green,
                    icon: Icons.edit,
                  ),

                ]),
                endActionPane: ActionPane(motion: const StretchMotion(), children: [

                  SlidableAction(
                    onPressed: (BuildContext context) {

                    },
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                  ),



                ]),
                child: GestureDetector(
                  onTap: (){
                    _launchPhoneCall();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5
                        )
                      ),
                      child: ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Yohann",style: TextStyle(color: Colors.black,fontFamily: 'Outfit'),),
                        subtitle: Text("+228 91 28 12 70",style: TextStyle(color: Colors.grey,fontFamily: 'Outfit'),),
                      ),
                    ),
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(onPressed: ()async{},

          child: Icon(Icons.add),
      ),
    );
  }
  void _launchPhoneCall() async {
    const phoneNumber = 'tel:+22891281270';
    FlutterPhoneDirectCaller.callNumber(phoneNumber);
    /*final Uri _url = Uri.parse(phoneNumber);// Remplacez par le numéro de téléphone que vous souhaitez appeler
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Impossible de lancer l\'appel $phoneNumber';
    }*/
  }
}
