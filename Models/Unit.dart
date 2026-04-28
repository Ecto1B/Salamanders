class Unit {
  int? id;
  String name;
  int points;
  String notes;

  Unit({this.id, required this.name, required this.points, required this.notes});

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'points': points,
        'notes': notes,
      };

  static Unit fromMap(Map<String, dynamic> map) => Unit(
        id: map['id'],
        name: map['name'],
        points: map['points'],
        notes: map['notes'],
      );
}
