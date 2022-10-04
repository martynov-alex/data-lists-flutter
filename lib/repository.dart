import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:fl_list_example/models.dart';

const recordsToGenerate = 100;

class MockRepository {
  // Формируем список объектов, условную базу данных
  final List<ExampleRecord> _store = List<ExampleRecord>.generate(
    recordsToGenerate,
    (index) => ExampleRecord(title: nouns[Random().nextInt(nouns.length)]),
  );

  // Для работы с одим и тем же объектом делаем класс синглтоном
  static final MockRepository _instance = MockRepository._internal();
  factory MockRepository() => _instance;
  MockRepository._internal();

  // Имитируем задержку при возавращении результата
  Future<Iterable<ExampleRecord>> queryRecords() async {
    await Future.delayed(const Duration(seconds: 2));
    return _store;
  }
}
