import 'package:aluguel/control/lists/imoveis_list_control.dart';
import 'package:aluguel/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';

class ImoveisList extends StatefulWidget {
  final _control = ImoveisListControl();

  ImoveisList({Key key}) : super(key: key);

  @override
  _ImoveisListState createState() => _ImoveisListState();
}

class _ImoveisListState extends State<ImoveisList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meus imóveis"),
        ),
        body: CustomFutureBuilder(
          future: widget._control.getAll(),
          onSuccess: (context, imoveis) => ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(imoveis[index].local),
                  onTap: () =>
                      widget._control.openReviewScreen(context, imoveis[index]),
                ),
              );
            },
            itemCount: imoveis.length,
          ),
        ));
  }
}
