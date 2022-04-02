import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:yiriwa/screen/comments_screen.dart';
import 'package:yiriwa/service/firestore_methods.dart';
import 'package:yiriwa/utils/utils.dart';
import 'package:yiriwa/widgets/like_animation.dart';

class vedCard extends StatefulWidget {
  final snap;
  const vedCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<vedCard> createState() => _vedCardState();
}

class _vedCardState extends State<vedCard> {
  late VideoPlayerController _controller;
  int commentLen = 0;
  bool isLikeAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
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
      padding: const EdgeInsets.symmetric(vertical: 1),
      height: 200,
      width: 300,
      child: Row(
        children: <Widget>[
          Container(
            height: 200,
            width: 90,
            child: Column(
              children: <Widget>[
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
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(widget.snap["postUrl"].toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  LikeAnimation(
                    isAnimating:
                        widget.snap['likes'].contains(widget.snap['uid']),
                    smallLike: true,
                    child: IconButton(
                      icon: widget.snap['likes'].contains(widget.snap['uid'])
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                      onPressed: () => FireStoreMethods().likePost(
                        widget.snap['postId'].toString(),
                        widget.snap['uid'].toString(),
                        widget.snap['likes'],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "${widget.snap['likes'].length} appreciations",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
