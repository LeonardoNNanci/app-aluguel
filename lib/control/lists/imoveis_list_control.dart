import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImoveisListControl {
  final service = ImovelService();

  Future<List<Imovel>> getAll() async {
    return await service.getAll();
  }

  openReviewScreen(BuildContext context, Imovel imovel) {
    Navigator.pushNamed(context, '/review/imovel', arguments: imovel);
  }
}
