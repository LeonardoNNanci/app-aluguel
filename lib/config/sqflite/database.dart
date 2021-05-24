import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:aluguel/config/sqflite/config.dart' as config;

class AppDatabase {
  String _databaseFileName = config.databaseFileName;
  Database _database;

  AppDatabase();

  Future<Database> get instance async {
    if (_database == null) {
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, _databaseFileName);

      return openDatabase(
        path,
        onCreate: (database, version) {
          database.execute(config.createDatabaseSql);
        },
        version: 1,
      );
    }
    return _database;
  }
}
