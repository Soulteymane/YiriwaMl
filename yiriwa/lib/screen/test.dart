import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yiriwa/providers/user_providers.dart';
import 'package:yiriwa/model/user.dart' as model;
import 'package:yiriwa/screen/CreaEntScreen.dart';
import 'package:yiriwa/screen/meeting_screen.dart';
import 'package:yiriwa/widgets/postCard.dart';
import 'package:yiriwa/widgets/vedCard.dart';
import 'package:yiriwa/widgets/verCard.dart';

class testScreen extends StatefulWidget {
  const testScreen({Key? key}) : super(key: key);

  @override
  _testScreenState createState() => _testScreenState();
}

class _testScreenState extends State<testScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Image.asset(
          "assets/icons/Logo2.png",
          color: Colors.teal,
          height: 70,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MeetingScreen(),
                ),
              );
            },
            icon: FaIcon(
              FontAwesomeIcons.video,
              color: Colors.teal,
            ),
          )
        ],
        toolbarHeight: 70, // Set this height
        flexibleSpace: Container(
          color: Colors.white,
          child: Column(
            children: [],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.teal,
              child: Column(
                children: [
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
                        MaterialPageRoute(
                            builder: (context) => const CreatEnt()),
                      );
                    },
                    child: Text("Commencer"),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: [
                Card(
                  elevation: 10,
                  child: Container(
                      width: 300,
                      margin: EdgeInsets.all(6.0),
                      child: Center(
                        child: Text(
                          "Fidélisez vos clients avec des cadeaux",
                          style: TextStyle(fontSize: 17),
                        ),
                      )),
                ),
                Card(
                  elevation: 10,
                  child: Container(
                      width: 300,
                      margin: EdgeInsets.all(6.0),
                      child: Center(
                        child: Text(
                          "Soyez à l'ecoute",
                          style: TextStyle(fontSize: 17),
                        ),
                      )),
                ),
                Card(
                  elevation: 10,
                  child: Container(
                      width: 300,
                      margin: EdgeInsets.all(6.0),
                      child: Center(
                        child: Text(
                          "Etudiez votre marché cible",
                          style: TextStyle(fontSize: 17),
                        ),
                      )),
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
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return new ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => vedCard(
                          snap: snapshot.data!.docs[index].data(),
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
