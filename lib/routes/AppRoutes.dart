import 'package:animal/views/favorite/favorite_page.dart';
import 'package:animal/views/home/home_page.dart';
import 'package:animal/views/login/login_page.dart';
import 'package:animal/views/search/search_page.dart';
import 'package:animal/views/signUp/signUp_page.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static String signUp = '/';
  static String login = 'login';
  static String Home = 'home';
  static String favorite = 'favorite';
  static String search = 'search';

  static final Map<String, WidgetBuilder> routes = {
    signUp: (context) => SignupPage(),
    login: (context) => LoginPage(),
    Home: (context) => HomePage(),
    AppRoutes.favorite: (context) => FavoritePage(),
    AppRoutes.search: (context) => SearchPage(),
  };
}
