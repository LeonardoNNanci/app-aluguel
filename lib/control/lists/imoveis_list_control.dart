import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImoveisListControl {
  final service = ImovelService();

  Future<List<Imovel>> getAll() async {
    List<Imovel>imoveis = await service.getAll();
    imoveis.sort((a, b)=>a.local.compareTo(b.local));
    return imoveis;
  }

  Future openReviewScreen(BuildContext context, Imovel imovel) async {
    await Navigator.pushNamed(context, '/review/imovel', arguments: imovel);
  }
}
