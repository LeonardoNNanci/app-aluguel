import 'package:aluguel/config/sqflite/database.dart';
import 'package:aluguel/models/abstract_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class GenericDao<T extends AbstractModel> {

  T Function() _creatorEmpty;
  T Function(Map<String, dynamic> map) _creatorFromMap;

  final database = AppDatabase();

  GenericDao(this._creatorFromMap, this._creatorEmpty);

  Future<T> insert(T value) async {
    Database db = await database.instance;
    value.id = await db.insert(value.table, value.toMap());
    return value;
  }

  Future<T> update(T value) async {
    Database db = await database.instance;
    await db.update(value.table, value.toMap(), where: "${value.idField}=?");
    return value;
  }

  Future<T> delete(T value) async {
    Database db = await database.instance;
    await db.delete(value.table, where: "${value.idField}=?", whereArgs: [value.id]);
    return value;
  }

  Future<List<T>> selectAll() async {
    final db = await database.instance;
    final generic = _creatorEmpty();
    List<Map<String, dynamic>> maps = await db.query(generic.table);
    return maps.map((map) => _creatorFromMap(map)).toList();
  }

  Future<T> selectById(int id) async {
    Database db = await database.instance;
    final generic = _creatorEmpty();
    List<Map<String, dynamic>> map =
    await db.query(generic.table, where: "${generic.idField}=?", whereArgs: [id]);
    if (map.isEmpty) return null;
    return _creatorFromMap(map[0]);
  }

}
