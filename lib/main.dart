import 'package:animal/app.dart';
import 'package:animal/controller/apiController.dart';
import 'package:animal/controller/databaseController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/userController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserNameController(preferences: preferences),
        ),
        ChangeNotifierProvider(
          create: (context) => ApiController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DbController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
