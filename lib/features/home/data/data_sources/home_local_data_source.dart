import '../../../../core/data/database/database_service.dart';
import '../models/event_model.dart';

abstract class HomeLocalDataSource {
  Future<List<EventModel>> getModels(String time);
  Future<void> addModel(EventModel model);
  Future<List<int>> getFirst3EventsColorIndexes(String date);
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

  @override
  Future<List<int>> getFirst3EventsColorIndexes(String date) async {
    final db = await DatabaseService().database;
    final data = await db.rawQuery(
        'SELECT colorIndex FROM events WHERE day = ? LIMIT 3', [date]);
    final List<int> result = data.map((e) => e['colorIndex'] as int).toList();
    return result;
  }
}
