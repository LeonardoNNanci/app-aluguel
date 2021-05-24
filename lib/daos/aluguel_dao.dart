import 'package:aluguel/models/aluguel.dart';
import 'package:aluguel/config/sqflite/database.dart';
import 'package:sqflite/sqflite.dart';

class AluguelDao {
  static String get table => 'aluguel';

  static String get idField => 'id';

  static String get imovelField => 'imovel_id';

  static String get hospedeField => 'hospede_id';

  static String get totalHospedesField => "total_hospedes";

  static String get checkinField => "checkin";

  static String get checkoutField => "checkout";

  static String get valorField => "valor";

  static String get formaField => "forma";

  static String get roupaDeCamaField => "roupa_de_cama";

  static String get observacaoField => "observacao";

  AppDatabase database = AppDatabase();

  Future<Aluguel> insert(Aluguel aluguel) async {
    Database db = await database.instance;
    aluguel.id = await db.insert(table, aluguel.toMap());
    return aluguel;
  }

  Future<Aluguel> update(Aluguel aluguel) async {
    Database db = await database.instance;
    await db.update(table, aluguel.toMap());
    return aluguel;
  }

  Future<Aluguel> delete(Aluguel aluguel) async {
    Database db = await database.instance;
    await db.delete(table, where: "$idField=?", whereArgs: [aluguel.id]);
    return aluguel;
  }

  Future<List<Aluguel>> selectAll() async {
    Database db = await database.instance;
    List<Map<String, dynamic>> maps = await db.query(table);
    return maps.map((map) => Aluguel.fromMap(map)).toList();
  }

  Future<Aluguel> selectById(int id) async {
    Database db = await database.instance;
    List<Map<String, dynamic>> map =
    await db.query(table, where: "$idField=?", whereArgs: [id]);
    return Aluguel.fromMap(map[0]);
  }
}
