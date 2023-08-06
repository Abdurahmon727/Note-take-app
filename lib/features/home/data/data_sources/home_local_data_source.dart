import '../../../../core/data/database/database_service.dart';
import '../models/event_model.dart';

abstract class HomeLocalDataSource {
  Future<List<EventModel>> getModels(String time);
  Future<void> addModel(EventModel model);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<EventModel>> getModels(String time) async {
    final db = await DatabaseService().database;
    final data = await db.rawQuery(
      'SELECT * FROM events WHERE day = ?',
      [time],
    );
    final models = data.map((e) => EventModel.fromMap(e)).toList();
    return models;
  }

  @override
  Future<void> addModel(EventModel model) async {
    final db = await DatabaseService().database;

    await db.insert('events', model.toMap());
  }
}
