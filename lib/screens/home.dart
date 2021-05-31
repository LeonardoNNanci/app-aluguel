import 'package:aluguel/style/default_icons.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);



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
              leading: DefaultIcons.imovel,
              title: Text("Imóveis"),
              onTap: () {},
            ),
            ListTile(
              leading: DefaultIcons.hospede,
              title: Text("Hospedes"),
              onTap: () {},
            ),
            ListTile(
              leading: DefaultIcons.aluguel,
              title: Text("Alugueis"),
              onTap: () {},
            ),
            ListTile(
              leading: DefaultIcons.despesa,
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
            Text("Próximos aluguéis", style: textTheme.headline6,),
            Container(
              height: 128.0,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  aluguelCard(context, 1),
                  aluguelCard(context, 2),
                  aluguelCard(context, 3),
                  aluguelCard(context, 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget aluguelCard(BuildContext context, int index){
    final Color pc = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
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
                    "Araruama",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text("João da Silva"),
                  Text("02/02/2022 - 05/02/2022"),
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
