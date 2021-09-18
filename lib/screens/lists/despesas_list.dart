import 'package:aluguel/config/date_format.dart';
import 'package:aluguel/control/lists/despesas_list_control.dart';
import 'package:aluguel/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';

class DespesasList extends StatefulWidget {
  DespesasList({Key key}) : super(key: key);

  @override
  _DespesasListState createState() => _DespesasListState();
}

class _DespesasListState extends State<DespesasList> {
  final _control = DespesasListControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Minhas despesas"),
        ),
        body: CustomFutureBuilder(
          future: _control.getAll(),
          onSuccess: (context, despesas) => ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(despesas[index]["despesa"].servico),
                  subtitle: Text('${despesas[index]["imovel"].local} - '
                      '${DDMMYY.format(despesas[index]["despesa"].date)}'),
                  onTap: () => _control
                      .openReviewScreen(context, despesas[index]["despesa"])
                      .then((value) => setState(() {})),
                ),
              );
            },
            itemCount: despesas.length,
          ),
        ));
  }
}
