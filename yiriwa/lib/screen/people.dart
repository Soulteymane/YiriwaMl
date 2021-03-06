import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yiriwa/screen/chat_detail.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class People extends StatelessWidget {
  People({Key? key}) : super(key: key);
  var currentUser = FirebaseAuth.instance.currentUser!.uid;

  void callChatDetailScreen(BuildContext context, String name, String uid) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>
                ChatDetail(friendUid: uid, friendName: name)));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where('uid', isNotEqualTo: currentUser)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: Text("Les utilisateurs"),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    snapshot.data!.docs.map(
                      (DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return ListTile(
                          onTap: () => callChatDetailScreen(
                              context, data['username'], data['uid']),
                          title: Text(data['username']),
                          subtitle: Text(data['role']),
                        );
                      },
                    ).toList(),
                  ),
                )
              ],
            );
          }
          return Container();
        });
  }
}
