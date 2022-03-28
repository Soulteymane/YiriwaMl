import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:yiriwa/screen/CreaEntScreen.dart';
import 'package:yiriwa/screen/comments_screen.dart';
import 'package:yiriwa/service/firestore_methods.dart';
import 'package:yiriwa/utils/colors.dart';
import 'package:yiriwa/utils/utils.dart';
import 'package:yiriwa/widgets/like_animation.dart';

class postCard extends StatefulWidget {
  final snap;
  const postCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<postCard> createState() => _postCardState();
}

class _postCardState extends State<postCard> {
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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      NetworkImage(widget.snap["profImage"].toString()),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.snap["username"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shrinkWrap: true,
                          children: [
                            'Delete',
                          ]
                              .map(
                                (e) => InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                    child: Text(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.width,
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    stops: [0.0, 1],
                    colors: [
                      Colors.black.withOpacity(1.0),
                      Colors.black.withOpacity(0.0)
                    ],
                  ),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.snap["postUrl"].toString())),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  DateFormat.yMMMd()
                      .format(widget.snap['datePublished'].toDate()),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              LikeAnimation(
                isAnimating: widget.snap['likes'].contains(widget.snap['uid']),
                smallLike: true,
                child: IconButton(
                  icon: widget.snap['likes'].contains(widget.snap['uid'])
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                  onPressed: () => FireStoreMethods().likePost(
                    widget.snap['postId'].toString(),
                    widget.snap['uid'].toString(),
                    widget.snap['likes'],
                  ),
                ),
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.comment,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CommentsScreen(
                      postId: widget.snap['postId'].toString(),
                      uid: widget.snap['uid'].toString(),
                    ),
                  ),
                ),
              ),
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ))
            ],
          ),
          //DESCRIPTION AND NUMBER OF COMMENTS
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w800),
                    child: Text(
                      "${widget.snap['likes'].length} j'aimes",
                      style: TextStyle(color: Colors.white),
                    )),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: primaryColor),
                      children: [
                        // TextSpan(
                        //   text: widget.snap['username'].toString(),
                        //   style: const TextStyle(
                        //       fontWeight: FontWeight.bold, color: Colors.white),
                        // ),
                        TextSpan(
                            text: ' ${widget.snap['description']}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    child: Text(
                      'View all $commentLen comments',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CommentsScreen(
                        postId: widget.snap['postId'].toString(),
                        uid: widget.snap['uid'].toString(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
