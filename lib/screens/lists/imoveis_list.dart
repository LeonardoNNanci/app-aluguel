import 'package:aluguel/control/lists/imoveis_list_control.dart';
import 'package:aluguel/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';

class ImoveisList extends StatelessWidget {
  final _control = ImoveisListControl();

  ImoveisList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meus imóveis"),
        ),
        body: CustomFutureBuilder(
          future: _control.getAll(),
          onSuccess: (context, imoveis) => ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(imoveis[index].local),
                  onTap: () =>
                      _control.openReviewScreen(context, imoveis[index]),
                ),
              );
            },
            itemCount: imoveis.length,
          ),
        ));
  }
}
