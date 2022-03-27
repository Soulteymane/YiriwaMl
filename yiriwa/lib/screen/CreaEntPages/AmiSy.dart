import 'package:flutter/material.dart';

class AmiSy extends StatefulWidget {
  const AmiSy({Key? key}) : super(key: key);

  @override
  State<AmiSy> createState() => _AmiSyState();
}

class _AmiSyState extends State<AmiSy> {
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
                      "https://1.bp.blogspot.com/-IOal01MF9yY/XhZJoIGSAOI/AAAAAAAASbY/yaWLYUzw_bECxiEEDdHCoxs2ZxKGZ0QGQCLcBGAsYHQ/s1600/quelles-exigences-pour-ouvrir-un-cabinet-avocats.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
