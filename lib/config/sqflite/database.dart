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
        onCreate: (database, version) async {
          await database.execute(config.createTableImovel);
          await database.execute(config.createTableHospede);
          await database.execute(config.createTableAluguel);
          await database.execute(config.createTableDespesa);
        },
        version: 1,
      );
    }
    return _database;
  }
}
