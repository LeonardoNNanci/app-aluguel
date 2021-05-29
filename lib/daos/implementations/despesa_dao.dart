import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/config/sqflite/database.dart';
import 'package:sqflite/sqflite.dart';

class DespesaDao {
  static String get table => 'despesa';

  static String get idField => 'id';

  static String get servicoField => 'servico';

  static String get valorField => 'valor';

  static String get imovelField => 'imovel_id';

  AppDatabase database = AppDatabase();

  Future<Despesa> insert(Despesa despesa) async {
    Database db = await database.instance;
    despesa.id = await db.insert(table, despesa.toMap());
    return despesa;
  }

  Future<Despesa> update(Despesa despesa) async {
    Database db = await database.instance;
    await db.update(table, despesa.toMap(),
        where: "$idField=?", whereArgs: [despesa.id]);
    return despesa;
  }

  Future<Despesa> delete(Despesa despesa) async {
    Database db = await database.instance;
    await db.delete(table, where: "$idField=?", whereArgs: [despesa.id]);
    return despesa;
  }

  Future<List<Despesa>> selectAll() async {
    Database db = await database.instance;
    List<Map<String, dynamic>> maps = await db.query(table);
    return maps.map((map) => Despesa.fromMap(map)).toList();
  }

  Future<Despesa> selectById(int id) async {
    Database db = await database.instance;
    List<Map<String, dynamic>> map =
        await db.query(table, where: "$idField=?", whereArgs: [id]);
    if (map.isEmpty) return null;
    return Despesa.fromMap(map[0]);
  }
}
