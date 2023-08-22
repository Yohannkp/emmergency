import 'package:emmergency/HomePage/Utils/ContainerDonneeanterieures.dart';
import 'package:flutter/material.dart';
Widget Contenu(context,int indice){
  final screenwidth = MediaQuery.of(context).size.width;
  final screenheight = MediaQuery.of(context).size.height;
  if(indice == 0){
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
  }else if(indice == 1){
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
  else if(indice == 4){
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