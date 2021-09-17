import 'package:aluguel/screens/forms/aluguel_form.dart';
import 'package:aluguel/screens/forms/despesa_form.dart';
import 'package:aluguel/screens/forms/hospede_form.dart';
import 'package:aluguel/screens/forms/imovel_form.dart';
import 'package:aluguel/screens/home/home.dart';
import 'package:aluguel/screens/lists/alugueis_list.dart';
import 'package:aluguel/screens/lists/despesas_list.dart';
import 'package:aluguel/screens/lists/hospedes_list.dart';
import 'package:aluguel/screens/lists/imoveis_list.dart';
import 'package:aluguel/screens/review/aluguel_review.dart';
import 'package:aluguel/screens/review/despesa_review.dart';
import 'package:aluguel/screens/review/hospede_review.dart';
import 'package:aluguel/screens/review/imovel_review.dart';
import 'package:aluguel/screens/home/todo_list/todo_list.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes(BuildContext context) => {
      // Home
      '/': (context) => Home(),

      // Task list
      'task_list': (context) => ToDo(),

      // Lists
      '/list/imovel': (context) => ImoveisList(),
      '/list/hospede': (context) => HospedesList(),
      '/list/despesa': (context) => DespesasList(),
      '/list/aluguel': (context) => AlugueisList(),

      // Reviews
      '/review/imovel': (context) => ImovelReview(),
      '/review/hospede': (context) => HospedeReview(),
      '/review/despesa': (context) => DespesaReview(),
      '/review/aluguel': (context) => AluguelReview(),

      // Creation forms
      '/create/imovel': (context) => ImovelForm(),
      '/create/hospede': (context) => HospedeForm(),
      '/create/despesa': (context) => DespesaForm(),
      '/create/aluguel': (context) => AluguelForm(),

      // Edit forms (creation forms with arguments)
      '/edit/imovel': (context) => ImovelForm(),
      '/edit/hospede': (context) => HospedeForm(),
      '/edit/despesa': (context) => DespesaForm(),
      '/edit/aluguel': (context) => AluguelForm(),
    };
