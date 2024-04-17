import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

dynamic database;

class Zomato {
  int? orderNo;
  String? custname;
  String? hotelname;
  String? food;
  double? bill;

  Zomato({this.orderNo, this.custname, this.hotelname, this.food, this.bill});

  Map<String, dynamic> zomatomap() {
    return {
      "orderNo": orderNo,
      "custname": custname,
      "hotelname": hotelname,
      "food": food,
      "bill": bill
    };
  }

  @override
  String toString() {
    return '{orderno:$orderNo,custname:$custname,hotelname:$hotelname,food:$food,bill:$bill}';
  }
}

Future insertData(Zomato obj) async {
  final localDB = await database;

  await localDB.insert('zomato', obj.zomatomap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<Zomato>> getZomatoData() async {
  final localDB = await database;
  List<Map<String, dynamic>> zomatoList = await localDB.query("zomato");
  return List.generate(zomatoList.length, (index) {
    return Zomato(
      orderNo: zomatoList[index]['orderno'],
      custname: zomatoList[index]['custname'],
      hotelname: zomatoList[index]['hotelname'],
      food: zomatoList[index]['food'],
      bill: zomatoList[index]['bill'],
    );
  });
}

Future deleteData(int data) async {
  final localDB = await database;
  await localDB.delete('zomato', where: 'orderno=?', whereArgs: [data]);
}

Future<void> updateorderdata(Zomato obj) async {
  final localDB = await database;
  await localDB.update(
    'zomato',
    obj.zomatomap(),
    where: 'orderno=?',
    whereArge: [obj.orderNo],
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(
    join(await getDatabasesPath(), 'zomatoDB.db'),
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          '''CREATE TABLE zomato(orderNo INTEGER PRIMARY KEY,custname TEXT,hotelname TEXT,food TEXT,bill REAL)''');
    },
  );
  Zomato order1 = Zomato(
      orderNo: 101,
      custname: 'monica',
      hotelname: 'shree',
      food: 'pavBhaji',
      bill: 550);
  await insertData(order1);
  Zomato order2 = Zomato(
      orderNo: 102,
      custname: 'shivani',
      hotelname: 'shree',
      food: 'vadapav',
      bill: 70);
  await insertData(order2);

  print(await getZomatoData());

  deleteData(101);
  //updateorderdata(order1);
  print(await getZomatoData());
}
