import 'package:aluguel/control/home/home_control.dart';
import 'package:aluguel/screens/home/todo_list/todo_list.dart';
import 'package:aluguel/style/default_icons.dart';
import 'package:flutter/material.dart';

import 'overview.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  final screens = <dynamic>[Overview(), ToDo()];
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
    final screen = widget.screens[_selectedIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titles[_selectedIndex]),
        actions: _control.addAction(screen, context),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            // DrawerHeader(
            //   child: Text("Teste"),
            //   decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            // ),
            ListTile(
              leading: Icon(DefaultIcons.imovel),
              title: Text("Imóveis"),
              onTap: () => _control.openScreen(context, "/list/imovel"),
            ),
            ListTile(
              leading: Icon(DefaultIcons.hospede),
              title: Text("Hospedes"),
              onTap: () => _control.openScreen(context, "/list/hospede"),
            ),
            ListTile(
              leading: Icon(DefaultIcons.aluguel),
              title: Text("Alugueis"),
              onTap: () => _control.openScreen(context, "/list/aluguel"),
            ),
            ListTile(
              leading: Icon(DefaultIcons.despesa),
              title: Text("Despesas"),
              onTap: () => _control.openScreen(context, "/list/despesa"),
            ),
          ],
        ),
      ),
      body: screen,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}
