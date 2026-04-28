import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> initDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'army.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE units(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            points INTEGER,
            notes TEXT
          )
        ''');
      },
    );
  }
}
