import 'package:udevs_task/core/data/database/database_service.dart';
import 'package:udevs_task/features/home/data/models/event_model.dart';

abstract class HomeLocalDataSource {
  Future<List<EventModel>> getModels(String time);
  Future<void> addModel(String time);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<EventModel>> getModels(String time) {
    throw UnimplementedError();
  }

  @override
  Future<void> addModel(String time) async {
    final db = await DatabaseService().database;
    db.insert('events', {});
    throw UnimplementedError();
  }
}
