import 'package:fl_list_example/models.dart';

class ListState {
  // Список записей, null означает, что еще было успешного обращения к репо
  final List<ExampleRecord>? recordsStore;
  final String error;
  final bool isLoading;

  ListState({
    Iterable<ExampleRecord>? records,
    this.isLoading = false,
    // Переменная для хранения ошибки, пустая строка = ошибки нет
    this.error = '',
  }) : recordsStore = records?.toList();

  // Проверка был ли список инициализирован
  bool get isInitialized => recordsStore != null;
  bool get hasError => error.isNotEmpty;
  List<ExampleRecord> get records =>
      recordsStore ?? List<ExampleRecord>.empty();

  // Функция копирования объектов, т.к. объекты иммутабельны
  ListState copyWith({
    Iterable<ExampleRecord>? records,
    String? error,
    bool? isLoading,
  }) {
    return ListState(
      records: records ?? recordsStore,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
