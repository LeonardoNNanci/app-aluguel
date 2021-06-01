const String databaseFileName = 'gag_database.db';

const ImovelTable = 'imovel';
const ImovelIdField = 'id';
const ImovelLocalField = 'local';
const ImovelMaxHospedesField = 'max_hospedes';
const ImovelTarifaField = 'tarifa_padrao';
const ImovelDescontoSemanaField = 'desconto_semana';
const ImovelDescontoMesField = 'desconto_mes';

const HospedeTable = 'hospede';
const HospedeIdField = 'id';
const HospedeNomeField = 'nome';
const HospedeEmailField = 'email';
const HospedeCpfField = 'cpf';
const HospedeEnderecoField = 'endereco';

const DespesaTable = 'despesa';
const DespesaIdField = 'id';
const DespesaServicoField = 'servico';
const DespesaValorField = 'valor';
const DespesaDateField = 'date';
const DespesaImovelField = 'imovel_id';

const AluguelTable = "aluguel";
const AluguelIdField = "id";
const AluguelImovelField = "imovel_id";
const AluguelHospedeField = "hospede_id";
const AluguelTotalHospedesField = "total_hospedes";
const AluguelCheckinField = "checkin";
const AluguelCheckoutField = "checkout";
const AluguelValorField = "valor";
const AluguelFormaField = "forma";
const AluguelRoupaDeCamaField = "roupa_de_cama";
const AluguelObservacaoField = "observacao";

String createTableImovel = 'CREATE TABLE $ImovelTable(\n'
    '$ImovelIdField INTEGER PRIMARY KEY, \n'
    '$ImovelLocalField TEXT NOT NULL, \n'
    '$ImovelMaxHospedesField INTEGER NOT NULL, \n'
    '$ImovelTarifaField REAL NOT NULL, \n'
    '$ImovelDescontoSemanaField REAL NOT NULL, \n'
    '$ImovelDescontoMesField REAL NOT NULL\n'
    ');\n\n';

String createTableHospede = 'CREATE TABLE $HospedeTable(\n'
    '$HospedeIdField INTEGER PRIMARY KEY, \n'
    '$HospedeNomeField TEXT NOT NULL, \n'
    '$HospedeEmailField TEXT NOT NULL, \n'
    '$HospedeCpfField TEXT NOT NULL, \n'
    '$HospedeEnderecoField TEXT NOT NULL\n'
    ');\n\n';

String createTableDespesa = 'CREATE TABLE $DespesaTable(\n'
    '$DespesaIdField INTEGER PRIMARY KEY, \n'
    '$DespesaServicoField TEXT NOT NULL, \n'
    '$DespesaValorField REAL NOT NULL, \n'
    '$DespesaDateField TEXT NOT NULL, \n'
    '$DespesaImovelField INTEGER NOT NULL, \n'
    'FOREIGN KEY ($DespesaImovelField) \n'
    'REFERENCES $ImovelTable($ImovelIdField) \n'
    'ON DELETE CASCADE \n'
    'ON UPDATE CASCADE\n'
    ');\n\n';

String createTableAluguel = 'CREATE TABLE $AluguelTable(\n'
    '$AluguelIdField INTEGER PRIMARY KEY, \n'
    '$AluguelImovelField INTEGER NOT NULL, \n'
    '$AluguelHospedeField INTEGER NOT NULL, \n'
    '$AluguelTotalHospedesField INTEGER NOT NULL, \n'
    '$AluguelCheckinField TEXT NOT NULL, \n'
    '$AluguelCheckoutField TEXT NOT NULL, \n'
    '$AluguelValorField REAL NOT NULL, \n'
    '$AluguelFormaField TEXT NOT NULL, \n'
    '$AluguelRoupaDeCamaField INTEGER NOT NULL, \n'
    '$AluguelObservacaoField TEXT, \n'
    'FOREIGN KEY ($AluguelImovelField) \n'
    'REFERENCES $ImovelTable($ImovelIdField), \n'
    'FOREIGN KEY ($AluguelHospedeField) \n'
    'REFERENCES $HospedeTable($HospedeIdField)\n'
    ');\n\n';
