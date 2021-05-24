import 'package:aluguel/daos/aluguel_dao.dart';
import 'package:aluguel/daos/despesa_dao.dart';
import 'package:aluguel/daos/hospede_dao.dart';
import 'package:aluguel/daos/imovel_dao.dart';

const String databaseFileName = "gag_database.db";

String createDatabaseSql = _createTableImovel +
    _createTableHospede +
    _createTableDespesa +
    _createTableAluguel;

String tableImovel = ImovelDao.table;
String tableAluguel = AluguelDao.table;
String tableHospede = HospedeDao.table;
String tableDespesa = DespesaDao.table;

String _createTableImovel = "CREATE TABLE ${ImovelDao.table}("
    "${ImovelDao.idField} INTEGER PRIMARY KEY, "
    "${ImovelDao.localField} TEXT NOT NULL, "
    "${ImovelDao.maxHospedesField} INTEGER NOT NULL, "
    "${ImovelDao.tarifaField} REAL NOT NULL, "
    "${ImovelDao.descontoSemanaField} REAL NOT NULL, "
    "${ImovelDao.descontoMesField} REAL NOT NULL"
    ");";

String _createTableHospede = "CREATE TABLE ${HospedeDao.table}("
    "${HospedeDao.table} INTEGER PRIMARY KEY, "
    "${HospedeDao.idField} TEXT NOT NULL, "
    "${HospedeDao.nomeField} TEXT NOT NULL, "
    "${HospedeDao.emailField} TEXT NOT NULL"
    ");";

String _createTableDespesa = "CREATE TABLE ${DespesaDao.table}("
    "${DespesaDao.idField} INTEGER PRIMARY KEY, "
    "${DespesaDao.servicoField} TEXT NOT NULL, "
    "${DespesaDao.valorField} REAL NOT NULL, "
    "${DespesaDao.imovelField} INTEGER NOT NULL, "
    "FOREIGN KEY (${DespesaDao.imovelField}) "
    "REFERENCES ${ImovelDao.table}(${ImovelDao.idField}) "
    "ON DELETE CASCADE "
    "ON UPDATE CASCADE"
    ");";

String _createTableAluguel = "CREATE TABLE ${AluguelDao.table}("
    "${AluguelDao.idField} INTEGER PRIMARY KEY, "
    "${AluguelDao.imovelField} INTEGER NOT NULL, "
    "${AluguelDao.hospedeField} INTEGER NOT NULL, "
    "${AluguelDao.totalHospedesField} INTEGER NOT NULL, "
    "${AluguelDao.checkinField} TEXT NOT NULL, "
    "${AluguelDao.checkoutField} TEXT NOT NULL, "
    "${AluguelDao.valorField} REAL NOT NULL, "
    "${AluguelDao.formaField} TEXT NOT NULL, "
    "${AluguelDao.roupaDeCamaField} INTEGER NOT NULL, "
    "${AluguelDao.observacaoField} TEXT, "
    "FOREIGN KEY (${AluguelDao.imovelField}) "
    "REFERENCES ${ImovelDao.table}(${ImovelDao.idField}), "
    "FOREIGN KEY (${AluguelDao.hospedeField}) "
    "REFERENCES ${HospedeDao.table}(${HospedeDao.idField})"
    ");";
