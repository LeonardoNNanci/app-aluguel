import 'package:aluguel/control/lists/alugueis_list_control.dart';
import 'package:aluguel/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';

class AlugueisList extends StatelessWidget {
  final _control = AlugueisListControl();

  AlugueisList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meus alugueis"),
        ),
        body: CustomFutureBuilder(
          future: _control.getAll(),
          onSuccess: (context, alugueis) => ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('${alugueis[index]["imovel"].local} - '
                      '${alugueis[index]["hospede"].nome}'),
                  subtitle:
                      Text('${alugueis[index]["aluguel"].checkin.toString()} - '
                          '${alugueis[index]["aluguel"].checkout.toString()}'),
                  onTap: () => _control.openReviewScreen(
                      context, alugueis[index]["aluguel"]),
                ),
              );
            },
            itemCount: alugueis.length,
          ),
        ));
  }
}
