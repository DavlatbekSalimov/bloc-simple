import 'package:blocappf/crudpage/controller/todo_ctr.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initial() {
  getIt.registerLazySingleton(() => TodoRepo());
}
