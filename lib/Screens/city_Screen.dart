import 'package:flutter/material.dart';
import 'package:huna_ksa/Screens/main_Screen.dart';
import 'package:huna_ksa/Widgets//city_Card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huna_ksa/Components/common_Functions.dart';
import 'package:huna_ksa/Components/constants.dart';
import 'package:huna_ksa/Components/session.dart' as session;



final _firestore = FirebaseFirestore.instance;
class CityScreen extends StatefulWidget {

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  List<CityCard> cards = [
    CityCard(imagePath: "images/Riyadh.png", cityName: "Riyadh"),
    CityCard(imagePath: "images/Abha.png", cityName: "Abha"),
    CityCard(imagePath: "images/Jeddah.png", cityName: "Jeddah"),
    CityCard(imagePath: "images/Al-ola.png", cityName: "Al-Ula"),
    CityCard(imagePath: "images/Alkhobar.png", cityName: "Alkhobar")
  ];
  saveCity(String city)
  async {
    await _firestore
        .collection('userData')
        .doc(session.email)
        .update(
      {
        'city': city,
      },
    ).then((value) {
      setState(() {
        session.city=city;
      });
      tost(context, city+" is selected.");
      pushAndRemove(context, MainScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView.builder(
        //scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 30, right:30,bottom: 10,top: 10),
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
            onTap:()
    {
      saveCity(cards.elementAt(index).cityName);
    },
    child: cards.elementAt(index));
          }
        //children: orderBubbles,


      ),
    );
  }
}
