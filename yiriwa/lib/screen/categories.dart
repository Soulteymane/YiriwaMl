import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class categoriesScreen extends StatefulWidget {
  const categoriesScreen({Key? key}) : super(key: key);

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection("CategiesExp").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return Column(
                      children: [
                        Card(
                          elevation: 10,
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Text(data['nom']),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
