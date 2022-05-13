import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
@HiveType(typeId: 1)
class Todo with _$Todo {
  factory Todo({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
    @HiveField(3) @Default(false) bool completed,
  }) = _Todo;
}
