import 'package:sqflite/sqflite.dart';

import '../models/event_model.dart';

abstract class HomeLocalDataSource {
  Future<List<EventModel>> getModels(String time);

  Future<void> addModel(EventModel model);

  Future<List<int>> getFirst3EventsColorIndexes(String date);

  Future<void> deleteAnEvent(int id);

  Future<void> editAnEvent(EventModel model);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  HomeLocalDataSourceImpl(this._database);

  final Database _database;

  @override
  Future<List<EventModel>> getModels(String time) async {
    final data = await _database.rawQuery(
      'SELECT * FROM events WHERE day = ?',
      [time],
    );
    final models = data.map((e) => EventModel.fromMap(e)).toList();
    return models;
  }

  @override
  Future<void> addModel(EventModel model) async {
    await _database.insert('events', model.toMap());
  }

  @override
  Future<List<int>> getFirst3EventsColorIndexes(String date) async {
    final data =
        await _database.rawQuery('SELECT colorIndex FROM events WHERE day = ? LIMIT 3', [date]);
    final List<int> result = data.map((e) => e['colorIndex'] as int).toList();
    return result;
  }

  @override
  Future<void> deleteAnEvent(int id) async {
    await _database.delete('events', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> editAnEvent(EventModel model) async {
    await _database.update('events', model.toMap(), where: 'id = ${model.id}');
  }
}
