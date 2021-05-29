import 'package:aluguel/daos/implementations/aluguel_dao.dart';
import 'package:aluguel/daos/implementations/despesa_dao.dart';
import 'package:aluguel/daos/implementations/hospede_dao.dart';
import 'package:aluguel/daos/implementations/imovel_dao.dart';

const String databaseFileName = "gag_database.db";

String tableImovel = ImovelDao.table;
String tableAluguel = AluguelDao.table;
String tableHospede = HospedeDao.table;
String tableDespesa = DespesaDao.table;

String createTableImovel = "CREATE TABLE ${ImovelDao.table}(\n"
    "${ImovelDao.idField} INTEGER PRIMARY KEY, \n"
    "${ImovelDao.localField} TEXT NOT NULL, \n"
    "${ImovelDao.maxHospedesField} INTEGER NOT NULL, \n"
    "${ImovelDao.tarifaField} REAL NOT NULL, \n"
    "${ImovelDao.descontoSemanaField} REAL NOT NULL, \n"
    "${ImovelDao.descontoMesField} REAL NOT NULL\n"
    ");\n\n";

String createTableHospede = "CREATE TABLE ${HospedeDao.table}(\n"
    "${HospedeDao.idField} INTEGER PRIMARY KEY, \n"
    "${HospedeDao.nomeField} TEXT NOT NULL, \n"
    "${HospedeDao.emailField} TEXT NOT NULL, \n"
    "${HospedeDao.cpfField} TEXT NOT NULL, \n"
    "${HospedeDao.enderecoField} TEXT NOT NULL\n"
    ");\n\n";

String createTableDespesa = "CREATE TABLE ${DespesaDao.table}(\n"
    "${DespesaDao.idField} INTEGER PRIMARY KEY, \n"
    "${DespesaDao.servicoField} TEXT NOT NULL, \n"
    "${DespesaDao.valorField} REAL NOT NULL, \n"
    "${DespesaDao.dateField} TEXT NOT NULL, \n"
    "${DespesaDao.imovelField} INTEGER NOT NULL, \n"
    "FOREIGN KEY (${DespesaDao.imovelField}) \n"
    "REFERENCES ${ImovelDao.table}(${ImovelDao.idField}) \n"
    "ON DELETE CASCADE \n"
    "ON UPDATE CASCADE\n"
    ");\n\n";

String createTableAluguel = "CREATE TABLE ${AluguelDao.table}(\n"
    "${AluguelDao.idField} INTEGER PRIMARY KEY, \n"
    "${AluguelDao.imovelField} INTEGER NOT NULL, \n"
    "${AluguelDao.hospedeField} INTEGER NOT NULL, \n"
    "${AluguelDao.totalHospedesField} INTEGER NOT NULL, \n"
    "${AluguelDao.checkinField} TEXT NOT NULL, \n"
    "${AluguelDao.checkoutField} TEXT NOT NULL, \n"
    "${AluguelDao.valorField} REAL NOT NULL, \n"
    "${AluguelDao.formaField} TEXT NOT NULL, \n"
    "${AluguelDao.roupaDeCamaField} INTEGER NOT NULL, \n"
    "${AluguelDao.observacaoField} TEXT, \n"
    "FOREIGN KEY (${AluguelDao.imovelField}) \n"
    "REFERENCES ${ImovelDao.table}(${ImovelDao.idField}), \n"
    "FOREIGN KEY (${AluguelDao.hospedeField}) \n"
    "REFERENCES ${HospedeDao.table}(${HospedeDao.idField})\n"
    ");\n\n";
