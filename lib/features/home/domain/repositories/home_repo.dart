import '../../../../core/data/either.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/event_model.dart';

abstract class HomeRepository {
  Future<Either<StorageFailure, void>> addNewEvent(EventModel model);
  Future<Either<StorageFailure, List<EventModel>>> getEvents(String time);
}
