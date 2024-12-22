import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/home/data/data_sources/local_data_source.dart';
import '../../features/home/data/repository/home_repo.dart';
import '../../features/home/domain/repositories/home_repo.dart';
import 'database/database_service.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
  sl.registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceImpl(sl()));

  final db = await DatabaseService().database;
  sl.registerLazySingleton<Database>(() => db);
}
