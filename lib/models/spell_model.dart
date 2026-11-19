import 'package:hive/hive.dart';

part 'spell_model.g.dart';

@HiveType(typeId: 0)
class SpellModel extends HiveObject {
  @HiveField(0)
  final int index;

  @HiveField(1)
  final String spell;

  @HiveField(2)
  final String use;

  SpellModel({
    required this.index,
    required this.spell,
    required this.use,
  });

  factory SpellModel.fromJson(Map<String, dynamic> json) {
    return SpellModel(
      index: (json['index'] as num?)?.toInt() ?? 0,
      spell: json['spell'] as String? ?? '',
      use: json['use'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'spell': spell,
      'use': use,
    };
  }
}
