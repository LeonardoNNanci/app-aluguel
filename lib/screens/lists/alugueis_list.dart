import 'package:aluguel/config/date_format.dart';
import 'package:aluguel/control/lists/alugueis_list_control.dart';
import 'package:aluguel/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';

class AlugueisList extends StatefulWidget {
  AlugueisList({Key key}) : super(key: key);

  @override
  _AlugueisListState createState() => _AlugueisListState();
}

class _AlugueisListState extends State<AlugueisList> {
  final _control = AlugueisListControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meus aluguéis"),
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
                      Text('${DDMMYY.format(alugueis[index]["aluguel"].checkin)} - '
                          '${DDMMYY.format(alugueis[index]["aluguel"].checkout)}'),
                  onTap: () => _control
                      .openReviewScreen(context, alugueis[index]["aluguel"])
                      .then((value) => setState(() {})),
                ),
              );
            },
            itemCount: alugueis.length,
          ),
        ));
  }
}
