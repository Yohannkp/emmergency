import 'package:flutter/material.dart';

Widget AcceuilProposition(context,String message,String image){
  return LayoutBuilder(builder: (context,contrain){
    print("La taille du layout est  : ${contrain.maxWidth}");
    if(MediaQuery.of(context).size.width<400){

      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100]
        ),
        width: MediaQuery.of(context).size.width/2.5,
        height: MediaQuery.of(context).size.height/6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: "Outfit",fontSize: 18,color: Colors.black),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("lib/Assets/PropositionAcceuilIcons/right-arrow.png",scale: MediaQuery.of(context).size.width/20,color: Colors.red,),
                  Image.asset(image,scale: MediaQuery.of(context).size.width/20,color: Colors.grey,)
                ],
              )
            ],
          ),
        ),
      );
    }
    else if(MediaQuery.of(context).size.width>=400 && MediaQuery.of(context).size.width<600){

      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100]
        ),
        width: MediaQuery.of(context).size.width/2.5,
        height: MediaQuery.of(context).size.height/6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: "Outfit",fontSize: 20,color: Colors.black),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("lib/Assets/PropositionAcceuilIcons/right-arrow.png",scale: 16,color: Colors.red,),
                  Image.asset(image,scale: 16,color: Colors.grey,)
                ],
              )
            ],
          ),
        ),
      );
    }
    else if(MediaQuery.of(context).size.width>=850 && MediaQuery.of(context).size.width<1200){
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100]
        ),
        width: MediaQuery.of(context).size.width/2.5,
        height: MediaQuery.of(context).size.height/4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: "Outfit",fontSize: 25,color: Colors.black),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("lib/Assets/PropositionAcceuilIcons/right-arrow.png",scale: MediaQuery.of(context).size.width/100,color: Colors.red,),
                  Image.asset(image,scale: MediaQuery.of(context).size.width/100,color: Colors.grey,)
                ],
              )
            ],
          ),
        ),
      );
    }
    else{

      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100]
        ),
        width: MediaQuery.of(context).size.width/2.5,
        height: MediaQuery.of(context).size.height/4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: "Outfit",fontSize: 25,color: Colors.black),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("lib/Assets/PropositionAcceuilIcons/right-arrow.png",scale: MediaQuery.of(context).size.width/100,color: Colors.red,),
                  Image.asset(image,scale: MediaQuery.of(context).size.width/100,color: Colors.grey,)
                ],
              )
            ],
          ),
        ),
      );
    }

  });
}