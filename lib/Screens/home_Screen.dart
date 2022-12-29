import 'package:flutter/material.dart';
import 'package:huna_ksa/Widgets/site_Card.dart';
import 'package:huna_ksa/Components/session.dart' as session;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Components/constants.dart';


final _firestore = FirebaseFirestore.instance;

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSpinner = false;
  List<String> interests=[];
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body:Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              height: MediaQuery.of(context).size.height*.30,
              width: MediaQuery.of(context).size.width,
              child: SizedBox(
                  child: Image(image:AssetImage(session.cityImage[session.city]), fit: BoxFit.cover,)),
            ),
            Positioned(
              top:MediaQuery.of(context).size.height*.20,
              child: Container(
                height:MediaQuery.of(context).size.height*.65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
child: Padding(
  padding: const EdgeInsets.symmetric(vertical: 40),
  child:   Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("General Sites",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                    Text("show more >>",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),

              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                            SiteCard(imagePath: "images/Boulevard.png", cityName: "Place 1"),
                            SiteCard(imagePath: "images/Boulevard.png", cityName: "Place 2"),
                            SiteCard(imagePath: "images/Boulevard.png", cityName: "Place 3")

                          ]),
            ],
          ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Divider(
          thickness: 3,
        ),
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Woman Sites",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                Text("show more >>",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),

              ],
            ),
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SiteCard(imagePath: "images/Boulevard.png", cityName: "Place 1"),
                SiteCard(imagePath: "images/Boulevard.png", cityName: "Place 2"),
                SiteCard(imagePath: "images/Boulevard.png", cityName: "Place 3")

              ]),
        ],
      ),
    ],
  ),
),
            )
            ),
          ],
        ),
      ),
    );
  }
}
