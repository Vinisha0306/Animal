class UserNameModal {
  late String userName;
  late String userPassword;

  String get getUserName => userName;
  String get getUserContact => userPassword;

  UserNameModal({required String name, required String password}) {
    userName = name;
    userPassword = password;
  }
}
