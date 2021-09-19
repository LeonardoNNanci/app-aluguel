import 'dart:math';

import 'package:aluguel/config/date_format.dart';
import 'package:aluguel/control/home/overview_control.dart';
import 'package:aluguel/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  final OverviewControl _control = OverviewControl();

  Overview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFutureBuilder(
            future: _control.getFutureAlugueis(),
            onSuccess: (context, alugueis) {
              if (alugueis.isEmpty) return Container();
              return alugueisFuturos(context, alugueis, textTheme, _control);
            },
          ),
          CustomFutureBuilder(
            future: _control.getOnGoingAlugueis(),
            onSuccess: (context, alugueis) {
              if (alugueis.isEmpty) return Container();
              return alugueisAndamento(context, alugueis, textTheme, _control);
            },
          ),
        ],
      ),
    );
  }

  Widget alugueisAndamento(BuildContext context, List alugueis,
      TextTheme textTheme, OverviewControl control) {
    return Container(
      child: Column(
        children: [
          Text(
            "Alugueis em andamento",
            style: textTheme.headline6,
          ),
          Container(
            height: 128.0,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AluguelCard(
                  index: 0,
                  aluguel: alugueis[index],
                  color: Theme.of(context).primaryColor,
                  control: control,
                );
              },
              itemCount: alugueis.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  Widget alugueisFuturos(BuildContext context, List alugueis,
      TextTheme textTheme, OverviewControl control) {
    return Container(
      child: Column(
        children: [
          Text(
            "Próximos aluguéis",
            style: textTheme.headline6,
          ),
          Container(
            height: 128.0,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AluguelCard(
                  index: index + 1,
                  aluguel: alugueis[index],
                  color: Theme.of(context).accentColor,
                  control: control,
                );
              },
              itemCount: alugueis.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class AluguelCard extends StatelessWidget {
  final BuildContext context;
  final int index;
  final Map<String, dynamic> aluguel;
  final MaterialColor color;
  final OverviewControl control;

  const AluguelCard(
      {Key key,
      this.context,
      this.index,
      this.color,
      this.aluguel,
      this.control})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = aluguel['imovel'].local;
    final hospede = aluguel['hospede'].nome;
    final periodo = DDMMYY.format(aluguel['aluguel'].checkin) +
        " - " +
        DDMMYY.format(aluguel['aluguel'].checkout);
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
            color: color[max(50, 500 - index * 100)],
            borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    local,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(hospede),
                  Text(periodo),
                ],
              ),
            ),
          ),
          onTap: () => control.openAluguelScreen(
              context, "/review/aluguel", aluguel["aluguel"]),
        ),
      ),
    );
  }
}
