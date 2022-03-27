import 'package:flutter/material.dart';
import 'package:yiriwa/utils/colors.dart';

class verCard extends StatelessWidget {
  final snap;
  const verCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      height: 150.0,
      margin: EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 5.0,
      ),
      child: Stack(
        children: <Widget>[
          _cardCorp(),
        ],
      ),
    );
  }

  Widget _cardCorp() {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.teal,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child: Image.network(snap["postUrl"], fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(snap["profImage"]),
            ),
            SizedBox(
              width: 5,
            ),
            Center(
              child: Text(
                snap["username"],
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _test() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      alignment: FractionalOffset.center,
      child: Image(
        image: NetworkImage(
          snap["postUrl"],
        ),
        height: 92,
        width: 92,
      ),
    );
  }
}
