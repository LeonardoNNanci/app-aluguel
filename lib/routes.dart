import 'package:aluguel/screens/forms/aluguel_form.dart';
import 'package:aluguel/screens/forms/despesa_form.dart';
import 'package:aluguel/screens/forms/hospede_form.dart';
import 'package:aluguel/screens/forms/imovel_form.dart';
import 'package:aluguel/screens/lists/alugueis_list.dart';
import 'package:aluguel/screens/lists/despesas_list.dart';
import 'package:aluguel/screens/lists/hospedes_list.dart';
import 'package:aluguel/screens/lists/imoveis_list.dart';
import 'package:aluguel/screens/todo_list/todo_list.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes(BuildContext context) => {
      // Home
      '/': (context) => Placeholder(),

      // Task list
      'task_list': (context) => ToDo(),

      // Lists
      '/list/imoveis': (context) => ImoveisList(),
      '/list/hospedes': (context) => HospedesList(),
      '/list/despesas': (context) => DespesasList(),
      '/list/alugueis': (context) => AlugueisList(),

      // Reviews
      '/review/imovel': (context) => ImovelForm(),
      '/review/hospede': (context) => HospedeForm(),
      '/review/despesa': (context) => DespesaForm(),
      '/review/aluguel': (context) => AluguelForm(),

      // Creation forms
      '/create/imovel': (context) => ImovelForm(),
      '/create/hospede': (context) => HospedeForm(),
      '/create/despesa': (context) => DespesaForm(),
      '/create/aluguel': (context) => AluguelForm(),

      // Update forms (creation forms with arguments)
      '/update/imovel': (context) => ImovelForm(),
      '/update/hospede': (context) => HospedeForm(),
      '/update/despesa': (context) => DespesaForm(),
      '/update/aluguel': (context) => AluguelForm(),
    };
