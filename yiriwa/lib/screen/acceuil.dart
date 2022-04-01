import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yiriwa/screen/CreaEntScreen.dart';
import 'package:yiriwa/screen/meeting_screen.dart';
import 'package:yiriwa/widgets/postCard.dart';
import 'package:yiriwa/widgets/vedCard.dart';

class acceuil extends StatefulWidget {
  final Stream<QuerySnapshot> userStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  acceuil({Key? key}) : super(key: key);

  @override
  _acceuilState createState() => _acceuilState();
}

class _acceuilState extends State<acceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MeetingScreen()),
                );
              },
              icon: Icon(
                Icons.message,
                color: Colors.teal,
              ))
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Guide Yirirwa",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          Center(
            child: Text(
              "Nous vous orientons sur la manière de créer votre entréprise",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreatEnt()),
              );
            },
            child: Text("Commencer"),
          ),
          CarouselSlider(
            items: [
              Card(
                elevation: 10,
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/75632.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 4 / 3,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
