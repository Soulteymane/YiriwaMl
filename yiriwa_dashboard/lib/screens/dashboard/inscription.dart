import 'dart:typed_data';

import 'package:admin/service/Auth_Service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:admin/utils/utils.dart';

class inscription extends StatefulWidget {
  const inscription({Key? key}) : super(key: key);

  @override
  _inscriptionState createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _activityController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  Uint8List? _image;

  bool circular = false;
  AuthClass authClass = AuthClass();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _pwdController.dispose();
    _activityController.dispose();
    _userNameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  String? dropdownvalue = 'Entrepreneur';
  var roleChoix = [
    'Admin',
    'Entrepreneur',
    'Expert',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      //appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Image.asset(
                "images/Logo2.png",
                scale: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Enregistrer un utilisateur',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://www.nicepng.com/png/detail/933-9332131_profile-picture-default-png.png"),
                          radius: 50,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 50,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 200,
                child: Center(
                  child: DropdownButton(
                    value: dropdownvalue,
                    iconEnabledColor: Colors.black,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    items: roleChoix.map((items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              textItem(
                  "Entrer un nom d'utilisateur", _userNameController, false),
              SizedBox(
                height: 15,
              ),
              textItem("Entrer un email", _emailController, false),
              SizedBox(
                height: 15,
              ),
              textItem("Entrer un mot de passe", _pwdController, true),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                height: 40,
                child: TextButton(
                  onPressed: () async {
                    setState(() {
                      circular = true;
                    });
                    String res = await AuthClass().signUpuser(
                      email: _emailController.text,
                      password: _pwdController.text,
                      username: _userNameController.text,
                      file: _image!,
                      activity: dropdownvalue.toString(),
                    );
                    print(res);
                  },
                  child: Text("Enrégistrer"),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    onSurface: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(
      String labelText, TextEditingController controller, bool obscureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          border: UnderlineInputBorder(),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            //fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
