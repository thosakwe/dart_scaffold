// GENERATED CODE - DO NOT MODIFY BY HAND

part of scaffold.src.models;

// **************************************************************************
// Generator: JsonModelGenerator
// **************************************************************************

class Prompt extends _Prompt {
  @override
  String type;

  @override
  String name;

  @override
  String description;

  @override
  dynamic defaultsTo;

  Prompt({this.type, this.name, this.description, this.defaultsTo});

  factory Prompt.fromJson(Map data) {
    return new Prompt(
        type: data['type'],
        name: data['name'],
        description: data['description'],
        defaultsTo: data['defaults_to']);
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        'description': description,
        'defaults_to': defaultsTo
      };

  static Prompt parse(Map map) => new Prompt.fromJson(map);

  Prompt clone() {
    return new Prompt.fromJson(toJson());
  }
}
