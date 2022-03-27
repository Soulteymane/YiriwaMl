import 'package:flutter/material.dart';
import 'package:yiriwa/screen/CreaEntPages/API.dart';
import 'package:yiriwa/screen/CreaEntPages/AmiSy.dart';
import 'package:yiriwa/screen/CreaEntPages/Haidara.dart';

class CreatEnt extends StatefulWidget {
  const CreatEnt({Key? key}) : super(key: key);

  @override
  State<CreatEnt> createState() => _CreatEntState();
}

class _CreatEntState extends State<CreatEnt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Guide Yiriwa"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const API()),
                  );
                },
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.80,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "http://www.investir.gouv.ml/sites/default/files/2020-02/api-logo_3_0.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "API-MALI",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Créer votre entréprise en 72H",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AmiSy()),
                  );
                },
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.80,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://1.bp.blogspot.com/-IOal01MF9yY/XhZJoIGSAOI/AAAAAAAASbY/yaWLYUzw_bECxiEEDdHCoxs2ZxKGZ0QGQCLcBGAsYHQ/s1600/quelles-exigences-pour-ouvrir-un-cabinet-avocats.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Notaire Maitre Ami sy",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Créer votre entréprise en 72H",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const haidara()),
                  );
                },
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.teal,
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.80,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://thumbs.dreamstime.com/b/african-american-black-man-using-notary-stamp-official-paper-227262937.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Cabinet Maitre Ousmane Haidara",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Créer votre entréprise en 72H",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
