import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yiriwa/responsive/mobile_screen.dart';
import 'package:yiriwa/screen/acceuil.dart';
import 'package:yiriwa/screen/connexion.dart';
import 'package:yiriwa/screen/phoneAuthPage.dart';
import 'package:yiriwa/service/Auth_Service.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:yiriwa/utils/utils.dart';

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
  TextEditingController _EntrepriseController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _expController = TextEditingController();
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
  var roleChoix = ['Entrepreneur', 'Expert'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/img001.png"),
                        fit: BoxFit.cover)),
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/icons/Logo2.png",
                          ),
                          fit: BoxFit.contain)),
                ),
              ),
              Text(
                'Inscription',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 25,
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
                  color: Colors.white,
                ),
                width: 200,
                child: Center(
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: Icon(Icons.keyboard_arrow_down),
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
              textItem("Entrer votre nom d'utilisateur *", _userNameController,
                  false),
              SizedBox(
                height: 15,
              ),
              textItem("Entrer votre email *", _emailController, false),
              SizedBox(
                height: 15,
              ),
              textItem("Entrer le nom de votre entreprise",
                  _EntrepriseController, false),
              SizedBox(
                height: 15,
              ),
              textItem("Entrer votre mot de passe *", _pwdController, true),
              SizedBox(
                height: 15,
              ),
              textItem("Experience professionnelle", _expController, false),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: TextButton(
                  onPressed: () async {
                    setState(() {
                      circular = true;
                    });
                    try {
                      String res = await AuthClass().signUpuser(
                        email: _emailController.text,
                        password: _pwdController.text,
                        username: _userNameController.text,
                        entName: _EntrepriseController.text,
                        lastMessageTime: DateTime.now(),
                        expPro: _expController.text,
                        file: _image!,
                        activity: dropdownvalue.toString(),
                      );
                      print(res);
                    } catch (e) {
                      final snackBar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      setState(() {
                        circular = false;
                      });
                    }
                  },
                  child: Center(
                    child: circular
                        ? CircularProgressIndicator()
                        : Text(
                            "S'inscrire",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                  ),
                  style: TextButton.styleFrom(
                    elevation: 10,
                    primary: Colors.black,
                    backgroundColor: Colors.teal[600],
                    onSurface: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const connexion()),
                  );
                },
                child: Text(
                  "Connectez-vous si vous avez déja un compte",
                  style: TextStyle(color: Colors.teal[600]),
                ),
              ),
              Text(
                'Continuer avec',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Image.asset(
                        'assets/icons/google.png',
                      ),
                      onPressed: () async {
                        await authClass.googleSignIn(context);
                      } //do something,
                      ),
                  IconButton(
                      icon: Image.asset(
                        'assets/icons/phone1.png',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const phoneAuthPage()),
                        );
                      } //do something,
                      ),
                ],
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
          color: Colors.grey.shade600,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey.shade600,
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
