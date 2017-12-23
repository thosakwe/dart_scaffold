library scaffold.src.models;

import 'package:angel_serialize/angel_serialize.dart';
part 'models.g.dart';

@serializable
class _Prompt {
  String type;
  String name;
  String description;
  var defaultsTo;
}