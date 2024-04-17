import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

dynamic database;

class Players {
  String? name;
  int? jerno;
  int? runs;
  double? avg;

  Players({this.name, this.jerno, this.runs, this.avg});

  Map<String, dynamic> playerMap() {
    return {
      "name": name,
      "jerno": jerno,
      "runs": runs,
      "avg": avg,
    };
  }

  String toString() {
    return '{name:$name,jerno:$jerno,runs:$runs,avg:$avg}';
  }
}

Future insertdata(Players obj) async {
  final localDB = await database;

  await localDB.insert('players', obj.playerMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<Players>> getPlayerData() async {
  final localDB = await database;

  List<Map<String, dynamic>> listplayer = await localDB.query("players");

  return List.generate(listplayer.length, (index) {
    return Players(
        name: listplayer[index]['name'],
        jerno: listplayer[index]['jerno'],
        runs: listplayer[index]['runs'],
        avg: listplayer[index]['avg']);
  });
}

Future<void> deleteData(int data) async {
  final localDB = await database;

  await localDB.delete('players', where: 'jerno= ?', whereArgs: [data]);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(
    join(await getDatabasesPath(), "player.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE players( name TEXT,jerno INTEGER PRIMARY KEY,runs INT,avg REAL)');
    },
  );

  Players player1 =
      Players(name: "Rohit Sharma", jerno: 45, runs: 20000, avg: 30.33);
  Players player2 =
      Players(name: "virat Kohali", jerno: 18, runs: 10000, avg: 10);
  insertdata(player1);
  Players player3 = Players(name: "msd", jerno: 7, runs: 10000, avg: 10);

  await insertdata(player2);
  await insertdata(player3);
  print(await getPlayerData());
  await deleteData(7);
  print(await getPlayerData());
}
