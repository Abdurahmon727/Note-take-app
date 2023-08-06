import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'event_db.dart';

class DatabaseService {
  Database? _dataBase;

  Future<Database> get database async {
    if (_dataBase != null) {
      return _dataBase!;
    } else {
      _dataBase = await _initialize();
      return _dataBase!;
    }
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async => await EventDb().createTable(db),
      singleInstance: true,
    );
    return database;
  }

  Future<String> get fullPath async {
    const name = 'events.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }
}
