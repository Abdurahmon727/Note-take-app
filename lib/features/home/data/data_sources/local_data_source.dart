import 'package:sqflite/sqflite.dart';

import '../../../../core/data/service_locator.dart';
import '../models/event_model.dart';

abstract class HomeLocalDataSource {
  Future<List<EventModel>> getModels(String time);
  Future<void> addModel(EventModel model);
  Future<List<int>> getFirst3EventsColorIndexes(String date);
  Future<void> deleteAnEvent(int id);
  Future<void> editAnEvent(EventModel model);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<EventModel>> getModels(String time) async {
    final data = await sl<Database>().rawQuery(
      'SELECT * FROM events WHERE day = ?',
      [time],
    );
    final models = data.map((e) => EventModel.fromMap(e)).toList();
    return models;
  }

  @override
  Future<void> addModel(EventModel model) async {
    await sl<Database>().insert('events', model.toMap());
  }

  @override
  Future<List<int>> getFirst3EventsColorIndexes(String date) async {
    final data = await sl<Database>().rawQuery(
        'SELECT colorIndex FROM events WHERE day = ? LIMIT 3', [date]);
    final List<int> result = data.map((e) => e['colorIndex'] as int).toList();
    return result;
  }

  @override
  Future<void> deleteAnEvent(int id) async {
    await sl<Database>().delete('events', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> editAnEvent(EventModel model) async {
    await sl<Database>()
        .update('events', model.toMap(), where: 'id = ${model.id}');
  }
}
