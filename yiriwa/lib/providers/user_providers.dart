import 'package:flutter/widgets.dart';
import 'package:yiriwa/model/user.dart';
import 'package:yiriwa/service/Auth_Service.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthClass _authClass = AuthClass();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authClass.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
