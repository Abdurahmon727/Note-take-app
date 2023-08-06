class EventDb {
  final tableName = 'events';

  Future<void> createTable(db) async {
    await db.execute("""CREATE TABLE $tableName (   
        "id" INTEGER PRIMARY KEY AUTOINCREMENT,    
        "name" TEXT,
        "description" TEXT,
        "time" TEXT,
        "day" TEXT,
        "location" TEXT,
        "colorIndex" INTEGER
      );""");
  }
}
