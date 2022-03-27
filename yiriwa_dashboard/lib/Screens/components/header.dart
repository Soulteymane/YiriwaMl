import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.headline6,
        ),
        Spacer(),
        Expanded(
          child: searchField(),
        ),
        SizedBox(
          width: 10,
        ),
        profileWidget(),
      ],
    );
  }
}

class profileWidget extends StatelessWidget {
  const profileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade600,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15 / 2),
            child: Text("Nom administrateur"),
          ),
          Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}

class searchField extends StatelessWidget {
  const searchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "recherche...",
        fillColor: Colors.grey.shade400,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIcon: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15 * 0.75),
          decoration: BoxDecoration(color: Colors.grey.shade800),
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
