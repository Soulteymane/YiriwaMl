import 'package:flutter/material.dart';
import 'package:yiriwa/responsive/mobile_screen.dart';
import 'package:yiriwa/responsive/mobile_screenEnt.dart';
import 'package:yiriwa/screen/inscription.dart';
import 'package:yiriwa/screen/phoneAuthPage.dart';
import 'package:yiriwa/service/Auth_Service.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class connexion extends StatefulWidget {
  const connexion({Key? key}) : super(key: key);

  @override
  _connexionState createState() => _connexionState();
}

class _connexionState extends State<connexion> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _activityController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

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
              Stack(
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
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  "Bienvenue connectez-vous",
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontFamily: 'Montserrat',
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Connexion',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              textItem("Entrer votre email", _emailController, false),
              SizedBox(
                height: 15,
              ),
              textItem("Entrer votre mot de passe", _pwdController, true),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    // Provider.of<UserProvider>(context, listen: false);
                    setState(() {
                      circular = true;
                    });
                    try {
                      firebase_auth.UserCredential userCredential =
                          await firebaseAuth.signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _pwdController.text);
                      print(userCredential.user?.email);
                      print(userCredential.user?.providerData);
                      setState(() {
                        circular = false;
                      });
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => mobileScreenLayout()),
                          (route) => false);
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
                            "Se connecter",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                  ),
                  style: TextButton.styleFrom(
                    elevation: 10,
                    primary: Colors.black,
                    backgroundColor: Colors.teal.shade600,
                    onSurface: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const inscription()),
                  );
                },
                child: Text(
                  "Creé un nouveau compte",
                  style: TextStyle(color: Colors.teal[600]),
                ),
              ),
              SizedBox(
                height: 5,
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
          fontFamily: 'Montserrat',
          fontSize: 17,
          color: Colors.grey,
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
