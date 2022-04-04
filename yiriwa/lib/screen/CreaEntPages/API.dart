import 'package:flutter/material.dart';

class API extends StatefulWidget {
  const API({Key? key}) : super(key: key);

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          textBaseline: TextBaseline.alphabetic,
          textDirection: TextDirection.ltr,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "http://www.investir.gouv.ml/sites/default/files/2020-02/api-logo_3_0.png"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "DÉLAI D'OBTENTION :",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              " 72 heures à partir de la date du dépôt par le notaire",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "SERVICES À CONTACTER :",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              " Agence pour la Promotion des Investissements au Mali (API-MALI)\n,"
              "Quartier du Fleuve (ex Air Afrique), BP : 1980, Bamako - République du Mali."
              "Tél : (223) 20 22 95 25, (223) 20 22 95 26, Fax : (223) 20 22 95 27",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                child: Text("Plus de details en pdf"), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
