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
              height: 40,
            ),
            Text(
              "PROCÉDURE ET LIEUX DE DÉLIVRANCE :",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              "L’ouverture du Guichet Unique pour la Création d’Entreprises s’inscrit dans le cadre de la loi du 13 mai 2008. le Décret (N°08-276/P-RM) fixe les formalités administratives de création d’entreprises par le Guichet Unique au sein de l’Agence pour la Promotion des Investissements au Mali (API-Mali).",
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
              "DOCUMENTS À FOURNIR :",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              "¤ Copie d'extrait de casier judiciaire obligatoire pour Bamako et Kati ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              "¤ Dépôt du capital social à la banque de votre choix à condition de respecter les procedures",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              "¤ Signature des statuts ou acte de dépôt devant le notaire de votre choix egalement ",
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
              "COÛT LÉGAL :",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              "Achat timbre fiscal : 200 FCFA immatriculation ...........RCCM : 15 000 FCA ...........immatriculation NINA : 1000 FCA ..........frais guichet unique pour les SA : 7 500 FCFA .........frais d'enregistrement des statuts aux impôts : 6000FCA .........timbre fiscal pour les statuts : 1500 FCFA par feuille frais d'enregistrement de la déclaration de souscription aux impôts : 1 250 FCFA .............publication des statuts : 20 000 FCFA; moyens de paiements acceptés: en espèces, par chèque sur le reçu de paiement, les droits et frais de la Direction Générale des Impôts (DGI) regroupent les droits de timbres (1 500 fCFA par feuille) et les frais d’enregistrement des statuts (6 000 FCFA) et de la déclaration de souscription (1 250 FCFA).",
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
              "SERVICE EN LIGNE ET FORMULAIRE :",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              " http://mali.eregulations.org/procedure/4/2/step/17?l=fr",
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
              " Agence pour la Promotion des Investissements au Mali (API-MALI), Quartier du Fleuve (ex Air Afrique), BP : 1980, Bamako - République du Mali. , Tél : (223) 20 22 95 25, (223) 20 22 95 26, Fax : (223) 20 22 95 27",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
