class Make{
  final int id;
  final String name;

  Make({required this.id, required this.name});

  factory Make.fromJson(Map<String, dynamic> json){
    return Make(
      id: json['MakeId'] is int ? json['MakeId'] : int.parse(json['MakeId'].toString()),
      name: (json['MakeName'] ?? '').toString().trim(),
    );
  }

  factory Make.fromDb(Map<String, dynamic> db){
    return Make(id: db['id'] as int, name: db['name'] as String);
  }

  Map<String, dynamic> toDb() => {'id': id, 'name': name};

  @override
  String toString() => 'Make(id: $id, name: $name)';
}
