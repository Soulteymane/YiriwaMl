import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudFirestoreSearch extends StatefulWidget {
  @override
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.teal,
                ),
                hintText: 'Recherche...'),
            cursorColor: Colors.teal,
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (FirebaseFirestore.instance.collection("users").snapshots()),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return Card(
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              data['photo'],
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: [
                              Text(
                                data['username'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                data['role'],
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            color: Colors.teal,
                            height: 10,
                            width: 10,
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
