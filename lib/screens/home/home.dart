import 'package:aluguel/control/home/home_control.dart';
import 'package:aluguel/screens/home/todo_list/todo_list.dart';
import 'package:aluguel/style/default_icons.dart';
import 'package:aluguel/widgets/expandable_fab.dart';
import 'package:flutter/material.dart';

import 'overview.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  final screens = <dynamic>[() => Overview(), () => ToDo()];
  final titles = <String>["Aluguéis", "Tarefas"];

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
    final screen = widget.screens[_selectedIndex]();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titles[_selectedIndex]),
        actions: _control.addAction(screen, context),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              child: Container(
                alignment: AlignmentDirectional.bottomStart,
                child: Text(
                  "Dados cadastrados:",
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
              ),
              decoration:
                  BoxDecoration(color: Theme.of(context).primaryColorDark),
            ),
            ListTile(
              leading: Icon(DefaultIcons.aluguel),
              title: Text("Aluguéis"),
              onTap: () => _control
                  .closeOpenScreen(context, "/list/aluguel")
                  .then((value) => setState(() {})),
            ),
            ListTile(
              leading: Icon(DefaultIcons.despesa),
              title: Text("Despesas"),
              onTap: () => _control
                  .closeOpenScreen(context, "/list/despesa")
                  .then((value) => setState(() {})),
            ),
            ListTile(
              leading: Icon(DefaultIcons.hospede),
              title: Text("Hóspedes"),
              onTap: () => _control
                  .closeOpenScreen(context, "/list/hospede")
                  .then((value) => setState(() {})),
            ),
            ListTile(
              leading: Icon(DefaultIcons.imovel),
              title: Text("Imóveis"),
              onTap: () => _control
                  .closeOpenScreen(context, "/list/imovel")
                  .then((value) => setState(() {})),
            ),
          ],
        ),
      ),
      body: screen,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            label: 'Aluguéis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Tarefas',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: ExpandableFab(
        icon: Icons.playlist_add,
        distance: 112.0,
        children: [
          ActionButton(
            key: UniqueKey(),
            onPressed: () => _control
                .openScreen(context, '/create/imovel')
                .then((value) => setState(() {})),
            icon: Icon(DefaultIcons.imovel),
          ),
          ActionButton(
            key: UniqueKey(),
            onPressed: () => _control
                .openScreen(context, '/create/aluguel')
                .then((value) => setState(() {})),
            icon: Icon(DefaultIcons.aluguel),
          ),
          ActionButton(
            key: UniqueKey(),
            onPressed: () => _control
                .openScreen(context, '/create/despesa')
                .then((value) => setState(() {})),
            icon: Icon(DefaultIcons.despesa),
          ),
          ActionButton(
            key: UniqueKey(),
            onPressed: () => _control
                .openScreen(context, '/create/hospede')
                .then((value) => setState(() {})),
            icon: Icon(DefaultIcons.hospede),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
