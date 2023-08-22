import 'dart:async';
import 'dart:convert';

import 'package:emmergency/HomePage/Utils/ContainerDonneeanterieures.dart';
import 'package:emmergency/HopitauxService/HopitauxService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Models/Requete.dart';
import 'package:flutter/material.dart';
class Contenu extends StatefulWidget {
  final indice;

  Contenu({required this.indice});

  @override
  State<Contenu> createState() => _ContenuState();
}

class _ContenuState extends State<Contenu> {
  HopitauxService hopitauxService = new HopitauxService();
  List<Requete> allrequest = [];
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    ValueNotifier<List<Requete>> valueNotifier = ValueNotifier(allrequest);

    StreamController<List<Requete>> _controller = StreamController<List<Requete>>();

    void fetchData() async {


      try {
        final response = await http.get(
            Uri.parse('http://192.168.10.119:8000/api/ListeRequ%C3%AAtes/'));
        allrequest = [];
        if (response.statusCode == 200) {

          final List<dynamic> responseData = json.decode(response.body);

          for(int i =0;i<responseData.length;i++){

            allrequest.add(Requete.fromJson(responseData[i]));

          }

          setState(() {
            _controller.add(allrequest);
          });


        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        _controller.sink.addError(e.toString());
        print("Une erreure est survenue ${e.toString()}");
      }
    }


    fetchData();
    if(this.widget.indice == 0){
      return Expanded(
          flex: 5,
          child: Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Acceuil",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),)),
                Expanded(
                  flex: 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ContainerDonneeAnterieures(screenwidth, screenheight,"Totale requêtes","125",Icons.headphones),
                            ContainerDonneeAnterieures(screenwidth, screenheight,"Requêtes acceptées","125",Icons.fmd_good_outlined),
                            ContainerDonneeAnterieures(screenwidth, screenheight,"Requêtes refusées","3",Icons.add),

                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: Container(
                            color: Colors.white,
                            width: screenwidth*0.78,
                            child: DataTable(
                              //dataTextStyle: TextStyle(fontWeight: FontWeight.bold),
                              columns: [
                                DataColumn(label: Text("Id")),
                                DataColumn(label: Text("Nom")),
                                DataColumn(label: Text("Prenom")),
                                DataColumn(label: Text("Date")),
                                DataColumn(label: Text("Statut")),
                              ], rows: [
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),


                            ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ));
    }else if(this.widget.indice == 1){
      return Expanded(
          flex: 5,
          child: Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Historique",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),)),
                Expanded(
                  flex: 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: Container(
                            color: Colors.white,
                            width: screenwidth*0.78,
                            child: DataTable(
                              //dataTextStyle: TextStyle(fontWeight: FontWeight.bold),
                              columns: [
                                DataColumn(label: Text("Id")),
                                DataColumn(label: Text("Nom")),
                                DataColumn(label: Text("Prenom")),
                                DataColumn(label: Text("Date")),
                                DataColumn(label: Text("Statut")),
                              ], rows: [
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("AHARH ")),
                                DataCell(Text("Yohann")),
                                DataCell(Text("15 -04 -2005")),
                                DataCell(Text("refusé")),
                              ]),


                            ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ));
    }
    else if(this.widget.indice == 4){

      return Expanded(
          flex: 5,
          child: Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Notifications",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),)),
                Expanded(
                  flex: 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: Container(
                              color: Colors.white,
                              width: screenwidth*0.78,
                              height: screenheight/1.2,
                              child: StreamBuilder(
                                stream: _controller.stream,
                                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                  return ListView.builder(
                                      itemCount: allrequest.length,
                                      itemBuilder: (context,indice){
                                        
                                        return DataTable(
                                          //dataTextStyle: TextStyle(fontWeight: FontWeight.bold),
                                          columns: [
                                            DataColumn(label: Text("Id")),
                                            DataColumn(label: Text("Description")),
                                            DataColumn(label: Text("Personne en danger",maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                            DataColumn(label: Text("Hopitale")),
                                            DataColumn(label: Text("Statut")),
                                            DataColumn(label: Text("Actions"))
                                          ], rows: [
                                          DataRow(cells: [
                                            DataCell(Text("${allrequest[indice].id}")),
                                            DataCell(Text("${allrequest[indice].description}")),
                                            DataCell(Text("${allrequest[indice].personne_en_danger}")),
                                            DataCell(Text("${allrequest[indice].hopital}")),
                                            DataCell(Text("${allrequest[indice].statut}")),
                                            DataCell(Row(
                                              children: [
                                                TextButton(onPressed: (){
                                                  hopitauxService.fetchApiData(allrequest[indice].id!);
                                                }, child: Text("Secourire")),
                                              ],
                                            ))
                                          ]),



                                        ],
                                        );
                                      });
                                },

                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ));
    }
    else{
      return Expanded(
          flex: 5,
          child: Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Paramètre",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),)),
                Expanded(
                  flex: 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: Container(
                            color: Colors.white,
                            width: screenwidth*0.78,

                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ));
    }
  }
}


