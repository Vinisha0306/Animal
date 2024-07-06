import 'dart:typed_data';

import 'package:animal/modal/apiModal.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();

  Logger logger = Logger();
  String sql = '';
  String dbName = "my_dataBase";
  String tableName = "Animal";

  late Database database;

  Future<void> initDb() async {
    String path = await getDatabasesPath();

    database = await openDatabase("$path/$tableName", version: 1,
        onCreate: (db, version) {
      String query =
          """create table if not exists $tableName (id integer primary key autoincrement,
                          name text
                          )""";

      db
          .execute(query)
          .then(
            (value) => logger.i("Table Create successfully"),
          )
          .onError(
            (error, stackTrace) => logger.e("ERROR : $error"),
          );
    }, onUpgrade: (db, v1, v2) {
      sql = "alter table $tableName add column image blob";
      db
          .execute(sql)
          .then((value) => logger.i('alter image added'))
          .onError((error, stackTrace) => logger.e('error : $error'));
    });
  }

  Future<void> insertData({required Animal animal}) async {
    sql = "insert into $tableName(name) values(?)";
    List args = [
      animal.name,
    ];
    await database.rawInsert(sql, args);
  }

  Future<void> deleteData({required int id}) async {
    await database
        .delete(
          tableName,
          where: "id=?",
          whereArgs: [id],
        )
        .then(
          (value) => logger.i('Deleted'),
        )
        .onError(
          (error, stackTrace) => logger.e('Error : $error'),
        );
  }

  Future<List<Animal>> getAllData() async {
    List<Animal> allAnimal = [];

    sql = "select * from $tableName;";
    List Data = await database.rawQuery(sql);
    allAnimal = Data.map((e) => Animal.fromJson(e)).toList();

    return allAnimal;
  }
}
