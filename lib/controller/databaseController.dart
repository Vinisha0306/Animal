import 'package:animal/helper/databaseHelper.dart';
import 'package:animal/modal/apiModal.dart';
import 'package:flutter/material.dart';

class DbController extends ChangeNotifier {
  List<Animal> allAnimalData = [];

  DbController() {
    initData();
  }

  Future<void> initData() async {
    DbHelper.dbHelper.initDb();
    allAnimalData = await DbHelper.dbHelper.getAllData();
    notifyListeners();
  }

  void insertData({required Animal animal}) {
    DbHelper.dbHelper.insertData(animal: animal);
    initData();
  }

  void deleteData({required Animal animal, required int id}) {
    DbHelper.dbHelper.deleteData(id: id);
    initData();
  }
}
