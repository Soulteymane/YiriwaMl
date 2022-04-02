import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yiriwa/service/Auth_Service.dart';
import 'package:yiriwa/service/firestore_methods.dart';
import 'package:yiriwa/utils/colors.dart';
import 'package:yiriwa/widgets/follow_button.dart';

class ExpertProfilScreen extends StatefulWidget {
  final String uid;
  final String username;
  final String photo;
  final String role;
  const ExpertProfilScreen({
    Key? key,
    required this.username,
    required this.photo,
    required this.role,
    required this.uid,
  }) : super(key: key);

  @override
  State<ExpertProfilScreen> createState() => _ExpertProfilScreenState();
}

class _ExpertProfilScreenState extends State<ExpertProfilScreen> {
  AuthClass authClass = AuthClass();

  var userData = {};
  int postLen = 0;
  int followers = 0;
  int following = 0;
  bool isFollowing = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      // get post lENGTH
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      postLen = postSnap.docs.length;
      userData = userSnap.data()!;
      followers = userSnap.data()!['followers'].length;
      following = userSnap.data()!['following'].length;
      isFollowing = userSnap
          .data()!['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
      setState(() {});
    } catch (e) {
      // showSnackBar(
      //   context,
      //   e.toString(),
      // );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          children: [Text(widget.username), Text("/"), Text(widget.role)],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: isFollowing
                  ? FollowButton(
                      text: 'Se desabonner',
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      borderColor: Colors.grey,
                      function: () async {
                        await FireStoreMethods().followUser(
                          FirebaseAuth.instance.currentUser!.uid,
                          userData['uid'],
                        );

                        setState(() {
                          isFollowing = false;
                          followers--;
                        });
                      },
                    )
                  : FollowButton(
                      text: "S'abonner",
                      backgroundColor: Colors.blue,
                      textColor: Colors.grey,
                      borderColor: Colors.blue,
                      function: () async {
                        await FireStoreMethods().followUser(
                          FirebaseAuth.instance.currentUser!.uid,
                          userData['uid'],
                        );

                        setState(() {
                          isFollowing = true;
                          followers++;
                        });
                      },
                    ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.teal, Colors.teal])),
                child: Container(
                  width: double.infinity,
                  height: 350.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(widget.photo),
                          radius: 50.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.username,
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.role,
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 22.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Posts",
                                        style: TextStyle(
                                          color: Colors.teal,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        postLen.toString(),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.teal,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Abonnés",
                                        style: TextStyle(
                                          color: Colors.teal,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        followers.toString(),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.teal,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Description:",
                      style: TextStyle(
                          color: Colors.teal,
                          fontStyle: FontStyle.normal,
                          fontSize: 28.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'My name is Alice and I am  a freelance mobile app developper.\n'
                      'if you need any mobile app for your company then contact me for more informations\n'
                      'My name is Alice and I am  a freelance mobile app developper.\n'
                      'if you need any mobile app for your company then contact me for more informations\n',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 300.00,
              child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  elevation: 0.0,
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [Colors.tealAccent, Colors.teal]),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Contactez moi",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
