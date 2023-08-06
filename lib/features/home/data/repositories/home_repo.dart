import '../../../../core/data/either.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_local_data_source.dart';
import '../models/event_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource _localDataSource = HomeLocalDataSourceImpl();

  @override
  Future<Either<StorageFailure, void>> addNewEvent(EventModel model) async {
    try {
      await _localDataSource.addModel(model);
      return Right(null);
    } catch (e) {
      return Left(StorageFailure(errorMessage: 'Unable to add'));
    }
  }

  @override
  Future<Either<StorageFailure, List<EventModel>>> getEvents(
      String time) async {
    try {
      final data = await _localDataSource.getModels(time);
      return Right(data);
    } catch (e) {
      return Left(StorageFailure(errorMessage: 'Unable to get data'));
    }
  }

  @override
  Future<Either<StorageFailure, List<int>>> getFirst3EventsColorIndexes(
      String date) async {
    // try {
    final result = await _localDataSource.getFirst3EventsColorIndexes(date);
    return Right(result);
    // } catch (e) {
    //   return Left(StorageFailure(errorMessage: 'Something went wrong'));
    // }
  }
}
