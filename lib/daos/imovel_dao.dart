import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/config/sqflite/database.dart';
import 'package:sqflite/sqflite.dart';

class ImovelDao {
  static String get table => 'imovel';

  static String get idField => 'id';

  static String get localField => 'local';

  static String get maxHospedesField => 'max_hospedes';

  static String get tarifaField => 'tarifa_padrão';

  static String get descontoSemanaField => 'desconto_semana';

  static String get descontoMesField => 'desconto_mes';

  AppDatabase database = AppDatabase();

  Future<Imovel> insert(Imovel imovel) async {
    Database db = await database.instance;
    imovel.id = await db.insert(table, imovel.toMap());
    return imovel;
  }

  Future<Imovel> update(Imovel imovel) async {
    Database db = await database.instance;
    await db.update(table, imovel.toMap());
    return imovel;
  }

  Future<Imovel> delete(Imovel imovel) async {
    Database db = await database.instance;
    await db.delete(table, where: "$idField=?", whereArgs: [imovel.id]);
    return imovel;
  }

  Future<List<Imovel>> selectAll() async {
    Database db = await database.instance;
    List<Map<String, dynamic>> maps = await db.query(table);
    return maps.map((map) => Imovel.fromMap(map)).toList();
  }

  Future<Imovel> selectById(int id) async {
    Database db = await database.instance;
    List<Map<String, dynamic>> map =
        await db.query(table, where: "$idField=?", whereArgs: [id]);
    return Imovel.fromMap(map[0]);
  }
}
