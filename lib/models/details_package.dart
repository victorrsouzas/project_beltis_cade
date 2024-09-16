class Event {
  final String date;
  final String time;
  final String description;
  final String color;

  Event({
    required this.date,
    required this.time,
    required this.description,
    required this.color,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      date: json['date'],
      time: json['time'],
      description: json['description'],
      color: json['color'],
    );
  }
}

class DetailState {
  final String packageName;
  final List<Event> events;

  DetailState({
    required this.packageName,
    required this.events,
  });

  DetailState copyWith({String? packageName, List<Event>? events}) {
    return DetailState(
      packageName: packageName ?? this.packageName,
      events: events ?? this.events,
    );
  }
}
