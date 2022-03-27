import 'package:flutter/material.dart';

class haidara extends StatefulWidget {
  const haidara({Key? key}) : super(key: key);

  @override
  State<haidara> createState() => _haidaraState();
}

class _haidaraState extends State<haidara> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://thumbs.dreamstime.com/b/african-american-black-man-using-notary-stamp-official-paper-227262937.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          )
        ],
      ),
    );
  }
}
