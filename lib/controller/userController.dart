import 'package:animal/modal/userModal.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserNameController extends ChangeNotifier {
  late SharedPreferences preferences;
  late UserNameModal userNameModal;
  bool isLogin = false;
  String userName = '';
  String userPassword = '';

  UserNameController({required this.preferences}) {
    init();
  }

  void init() {
    userNameModal = UserNameModal(
        name: preferences.getString("userName") ?? 'Demo Name',
        password: preferences.getString("userPassword") ?? 'Demo password');
    isLogin = preferences.getBool("isLogin") ?? false;
  }

  void userNameF() {
    userNameModal.userName = userName ?? "Demo Name";
    preferences.setString("userName", userNameModal.userName);
    userNameModal.userPassword = userPassword ?? "Demo password";
    preferences.setString("userPassword", userNameModal.userPassword);
    isLogin = !isLogin;
    preferences.setBool("isLogin", isLogin);
    Logger().i('$userName,$userPassword,$isLogin');
    notifyListeners();
  }
}
