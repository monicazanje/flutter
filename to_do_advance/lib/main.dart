//import 'dart:developer';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
//import 'package:sqflite/sqlite_api.dart';
import 'package:to_do_advance/todolist.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//import 'package:to_do_advance/connectivity.dart';
//import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

dynamic database;
Future<void> insertCardData(ToDoModelClass obj) async {
  final localDB = await database;
  await localDB.insert(
    'CardInfo',
    obj.cardMap(),
    ConflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<ToDoModelClass>> getCardData() async {
  final localDB = await database;
  List<Map<String, dynamic>> cardMapentry = await localDB.query("CardInfo");
  return List.generate(cardMapentry.length, (index) {
    return ToDoModelClass(
      cardNo: cardMapentry[index]['cardNo'],
      title: cardMapentry[index]['title'],
      description: cardMapentry[index]['description'],
      date: cardMapentry[index]['date'],
    );
  });
}
// Future<void> deleteCardList(int data)async{
//   final localDB=await database;
//   await localDB.delete{
//     "CardInfo",
//     WHERE:"CARDnO=?",
//     whereArgs:[data],
//   }
// }

// Future<void> updateCardData(ToDoModelClass obj) async {
//   final localDB = await database;
//   await localDB.update(
//       'CardInfo', obj.cardMap(), where: 'cardNo=?', whereArgs[obj.cardNo]);
// }

void main() async {
  //return runApp(const MainApp());
  //WidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfi;

  database = openDatabase(
      path.join(await getDatabasesPath(), "todoDatabase.db"),
      version: 1, onCreate: (db, version) async {
    await db.execute(''' CREATE TABLE CardInfo(
        cardNo INT PRIMERY KEY
        title  TEXT,
        description TEXT,
        date DATE
      ) ''');
  });
  ToDoModelClass card1 = ToDoModelClass(
      cardNo: 1,
      title: 'start work',
      description: 'good morning start working on project',
      date: "24-3-2024");
  insertCardData(card1);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advance to do list',
      home: ToDoApp(),
    );
  }
}
