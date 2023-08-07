import '../../../../core/data/either.dart';
import '../../../../core/data/service_locator.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/local_data_source.dart';
import '../models/event_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<StorageFailure, void>> addNewEvent(EventModel model) async {
    try {
      await sl<HomeLocalDataSource>().addModel(model);
      return Right(null);
    } catch (e) {
      return Left(StorageFailure(errorMessage: 'Unable to add'));
    }
  }

  @override
  Future<Either<StorageFailure, List<EventModel>>> getEvents(
      String time) async {
    try {
      final data = await sl<HomeLocalDataSource>().getModels(time);
      return Right(data);
    } catch (e) {
      return Left(StorageFailure(errorMessage: 'Unable to get data'));
    }
  }

  @override
  Future<Either<StorageFailure, List<int>>> getFirst3EventsColorIndexes(
      String date) async {
    try {
      final result =
          await sl<HomeLocalDataSource>().getFirst3EventsColorIndexes(date);
      return Right(result);
    } catch (e) {
      return Left(StorageFailure(errorMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<StorageFailure, void>> deleteAnEvent(int id) async {
    try {
      await sl<HomeLocalDataSource>().deleteAnEvent(id);
      return Right(null);
    } catch (e) {
      return Left(StorageFailure(errorMessage: 'Something went wrong'));
    }
  }
}
