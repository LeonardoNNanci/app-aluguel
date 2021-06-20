import 'package:aluguel/config/date_format.dart';
import 'package:aluguel/control/home_control.dart';
import 'package:aluguel/style/default_icons.dart';
import 'package:aluguel/widgets/custom_future_builder.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final HomeControl _control = HomeControl();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciador de aluguéis"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              child: Text("Teste"),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
            ListTile(
              leading: Icon(DefaultIcons.imovel),
              title: Text("Imóveis"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(DefaultIcons.hospede),
              title: Text("Hospedes"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(DefaultIcons.aluguel),
              title: Text("Alugueis"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(DefaultIcons.despesa),
              title: Text("Despesas"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFutureBuilder(
              future: _control.getOnGoingAlugueis(),
              onSuccess: (context, alugueis) {
                if (alugueis.isEmpty) return Container();
                return alugueisAndamento(context, alugueis, textTheme);
              },
            ),
            CustomFutureBuilder(
              future: _control.getFutureAlugueis(),
              onSuccess: (context, alugueis) {
                if (alugueis.isEmpty) return Container();
                return alugueisFuturos(context, alugueis, textTheme);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            label: 'Alugueis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Afazeres',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget alugueisAndamento(
      BuildContext context, List alugueis, TextTheme textTheme) {
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
                final local = alugueis[index]['imovel'].local;
                final hospede = alugueis[index]['hospede'].nome;
                final periodo =
                    formatter.format(alugueis[index]['aluguel'].checkin) +
                        " - " +
                        formatter.format(alugueis[index]['aluguel'].checkout);
                return aluguelFuturoCard(context, index + 1, local, hospede, periodo);
              },
              itemCount: alugueis.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  Widget alugueisFuturos(
      BuildContext context, List alugueis, TextTheme textTheme) {
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
                final local = alugueis[index]['imovel'].local;
                final hospede = alugueis[index]['hospede'].nome;
                final periodo =
                    formatter.format(alugueis[index]['aluguel'].checkin) +
                        " - " +
                        formatter.format(alugueis[index]['aluguel'].checkout);
                return aluguelFuturoCard(context, index + 1, local, hospede, periodo);
              },
              itemCount: alugueis.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  Widget aluguelFuturoCard(
    BuildContext context,
    int index,
    String local,
    String nomeHospede,
    String periodo,
  ) {
    final MaterialColor pc = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
            color: pc[index * 100], borderRadius: BorderRadius.circular(20)),
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
                  Text(nomeHospede),
                  Text(periodo),
                ],
              ),
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
