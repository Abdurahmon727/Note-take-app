import '../../../../core/data/database/database_service.dart';
import '../models/event_model.dart';

abstract class HomeLocalDataSource {
  Future<List<EventModel>> getModels(String time);
  Future<void> addModel(EventModel model);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<EventModel>> getModels(String time) {
    throw UnimplementedError();
  }

  @override
  Future<void> addModel(EventModel model) async {
    final db = await DatabaseService().database;
    print(
      await db.insert(
        'events',
        model.toMap(),
      ),
    );
  }
}
