import '../../../../core/data/either.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/event_model.dart';

abstract class HomeRepository {
  Future<Either<StorageFailure, void>> addAnEvent(EventModel model);
  Future<Either<StorageFailure, List<EventModel>>> getEvents(String time);
  Future<Either<StorageFailure, List<int>>> getFirst3EventsColorIndexes(
      String date);

  Future<Either<StorageFailure, void>> deleteAnEvent(int id);
  Future<Either<StorageFailure, void>> editAnEvent(EventModel model);
}
