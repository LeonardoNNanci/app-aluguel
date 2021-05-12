import 'dart:io';
import "package:csv/csv.dart";
import 'package:path_provider/path_provider.dart';

class CsvFile {
  final String filename;

  CsvFile(this.filename);

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print("$path/$filename");
    return File("$path/$filename");
  }

  Future<File> writeData(List data) async {
    final file = await _localFile;

    String csvString = const ListToCsvConverter().convert(data);

    print(csvString);

    return file.writeAsString(csvString);
  }

  Future<List> readData() async {
    try {
      final file = await _localFile;
      final csvString = await file.readAsString();

      final data = const CsvToListConverter().convert(csvString);

      return data;
    } on Error {
      return [];
    }
  }
}
