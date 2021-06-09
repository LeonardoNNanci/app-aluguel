import 'package:aluguel/control/lists/despesas_list_control.dart';
import 'package:aluguel/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';

class DespesasList extends StatelessWidget {
  final _control = DespesasListControl();

  DespesasList({Key key}) : super(key: key);

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
                      '${despesas[index]["despesa"].date.toString()}'),
                  onTap: () => _control.openReviewScreen(
                      context, despesas[index]["despesa"]),
                ),
              );
            },
            itemCount: despesas.length,
          ),
        ));
  }
}
