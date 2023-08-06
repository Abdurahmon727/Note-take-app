import 'package:get_it/get_it.dart';
import 'package:udevs_task/features/home/data/data_sources/local_data_source.dart';
import '../../features/home/data/repositories/home_repo.dart';
import '../../features/home/domain/repositories/home_repo.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl());
}
