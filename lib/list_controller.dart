import 'package:fl_list_example/list_state.dart';
import 'package:fl_list_example/models.dart';
import 'package:fl_list_example/repository.dart';
import 'package:flutter/foundation.dart';

class ListController extends ValueNotifier<ListState> {
  // Вызов super устанавливает исходное состояние списка
  ListController() : super(ListState()) {
    // Инициируем процесс получения содержимого списка при создании контроллера
    loadRecords();
  }

  // Получаем данные из репо
  Future<Iterable<ExampleRecord>> fetchRecords() async {
    final loadedRecords = await MockRepository().queryRecords();
    return loadedRecords;
  }

  // Загрузка данных для списка и изменения состояния списка в процессе загрузки
  Future<void> loadRecords() async {
    if (value.isLoading) return;

    value = value.copyWith(isLoading: true, error: "");

    try {
      final fetchResult = await fetchRecords();
      value = value.copyWith(isLoading: false, records: fetchResult);
    } catch (e) {
      value = value.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  repeatQuery() {
    return loadRecords();
  }
}
