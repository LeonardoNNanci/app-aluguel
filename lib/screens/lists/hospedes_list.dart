import 'package:aluguel/control/lists/hospedes_list_control.dart';
import 'package:aluguel/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';

class HospedesList extends StatelessWidget {
  final _control = HospedesListControl();

  HospedesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meus hóspedes"),
        ),
        body: CustomFutureBuilder(
          future: _control.getAll(),
          onSuccess: (context, hospedes) => ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(hospedes[index].nome),
                  onTap: () =>
                      _control.openReviewScreen(context, hospedes[index]),
                ),
              );
            },
            itemCount: hospedes.length,
          ),
        ));
  }
}
