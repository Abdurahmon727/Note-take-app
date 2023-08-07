class EventModel {
  final int id;
  final String name;
  final String description;
  final String day;
  final String time;
  final String location;
  final int colorIndex;
  EventModel({
    this.id = 1,
    required this.day,
    required this.name,
    required this.description,
    required this.time,
    required this.location,
    required this.colorIndex,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'day': day,
      'time': time,
      'location': location,
      'colorIndex': colorIndex,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      day: map['day'] as String,
      time: map['time'] as String,
      location: map['location'] as String,
      colorIndex: map['colorIndex'] as int,
    );
  }
}
