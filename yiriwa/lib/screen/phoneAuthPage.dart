// ignore_for_file: file_names, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:yiriwa/service/Auth_Service.dart';

class phoneAuthPage extends StatefulWidget {
  const phoneAuthPage({Key? key}) : super(key: key);

  @override
  _phoneAuthPageState createState() => _phoneAuthPageState();
}

class _phoneAuthPageState extends State<phoneAuthPage> {
  int start = 45;
  bool wait = false;
  String butttonName = "Envoyer";
  TextEditingController phoneController = TextEditingController();
  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";
  String smsCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Inscription par téléphone",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/otp.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              textField(),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    Text(
                      "Entrez les 6 chiffres reçu par sms  ",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              otpField(),
              const SizedBox(
                height: 40,
              ),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: "Renvoyez le code dans ",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  TextSpan(
                    text: "00:$start",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " sec",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              )),
              SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {
                  authClass.signInwithPhoneNumber(
                      verificationIdFinal, smsCode, context);
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Let's Go",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal[600],
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void starTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 58,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.white,
        borderColor: Colors.white,
      ),
      style: TextStyle(fontSize: 17, color: Colors.grey[600]),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  Widget textField() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: phoneController,
        style: TextStyle(color: Colors.grey[600], fontSize: 17),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Entrez votre numéro de téléphone",
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 17),
          contentPadding: EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text(
              "(+223)",
              style: TextStyle(color: Colors.grey[600], fontSize: 17),
            ),
          ),
          suffixIcon: InkWell(
            onTap: wait
                ? null
                : () async {
                    starTimer();
                    setState(() {
                      start = 45;
                      wait = true;
                      butttonName = "Renvoyer";
                    });
                    await authClass.verifyPhoneNumber(
                        "+223${phoneController.text}", context, setData);
                  },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                butttonName,
                style: TextStyle(
                    color: wait ? Colors.grey : Colors.grey[600],
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    starTimer();
  }
}
