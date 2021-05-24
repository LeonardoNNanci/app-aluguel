import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/config/sqflite/database.dart';
import 'package:sqflite/sqflite.dart';

class HospedeDao {
  static String get table => 'hospede';

  static String get idField => 'id';

  static String get nomeField => 'nome';

  static String get emailField => 'email';

  static String get cpfField => 'cpf';

  AppDatabase database = AppDatabase();

  Future<Hospede> insert(Hospede hospede) async {
    Database db = await database.instance;
    hospede.id = await db.insert(table, hospede.toMap());
    return hospede;
  }

  Future<Hospede> update(Hospede hospede) async {
    Database db = await database.instance;
    await db.update(table, hospede.toMap());
    return hospede;
  }

  Future<Hospede> delete(Hospede hospede) async {
    Database db = await database.instance;
    await db.delete(table, where: "$idField=?", whereArgs: [hospede.id]);
    return hospede;
  }

  Future<List<Hospede>> selectAll() async {
    Database db = await database.instance;
    List<Map<String, dynamic>> maps = await db.query(table);
    return maps.map((map) => Hospede.fromMap(map)).toList();
  }

  Future<Hospede> selectById(int id) async {
    Database db = await database.instance;
    List<Map<String, dynamic>> map =
    await db.query(table, where: "$idField=?", whereArgs: [id]);
    return Hospede.fromMap(map[0]);
  }
}
