import 'package:animal/helper/apiHelper.dart';
import 'package:animal/modal/apiModal.dart';
import 'package:flutter/material.dart';

class ApiController extends ChangeNotifier {
  List<Animal> allAnimals = [];

  ApiController() {
    initData();
  }

  Future<void> initData({name = 'tiger'}) async {
    allAnimals = await ApiHelper.apiHelper.getAllAnimals(name: name);
    notifyListeners();
  }
}
