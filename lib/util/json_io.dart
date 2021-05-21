import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class JsonFile {
  final String filename;

  JsonFile(this.filename);

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/$filename");
  }

  Future<File> writeData(dynamic data) async {
    final file = await _localFile;

    String jsonString = const JsonEncoder().convert(data);

    return file.writeAsString(jsonString);
  }

  Future<dynamic> readData() async {
    try {
      final file = await _localFile;
      final jsonString = await file.readAsString();

      final data = const JsonDecoder().convert(jsonString);

      return data;
    } on Error {
      print("ERROR!");
      return [];
    }
  }
}
