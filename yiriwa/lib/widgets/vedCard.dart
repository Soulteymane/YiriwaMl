import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yiriwa/service/firestore_methods.dart';
import 'package:yiriwa/utils/utils.dart';

class vedCard extends StatefulWidget {
  final snap;
  const vedCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<vedCard> createState() => _vedCardState();
}

class _vedCardState extends State<vedCard> {
  int commentLen = 0;
  bool isLikeAnimating = false;

  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      commentLen = snap.docs.length;
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
    setState(() {});
  }

  deletePost(String postId) async {
    try {
      await FireStoreMethods().deletePost(postId);
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: 300,
      child: Row(
        children: [
          Container(
            height: 200,
            width: 90,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage:
                        NetworkImage(widget.snap["profImage"].toString()),
                  ),
                ),
                Text(
                  widget.snap["username"].toString(),
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(widget.snap["postUrl"].toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
