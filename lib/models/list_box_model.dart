import 'package:hive/hive.dart';

part 'list_box_model.g.dart';

@HiveType(typeId: 002)
class ListBoxModel {
  @HiveField(0)
  final String key;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double hour;
  @HiveField(3)
  final double minute;
  @HiveField(4)
  final String song;
  @HiveField(5)
  final List<dynamic> days;
  @HiveField(6)
  bool checked;
  ListBoxModel(
    this.key,
    this.name,
    this.hour,
    this.minute,
    this.song,
    this.days,
    this.checked,
  );

  @override
  String toString() {
    // TODO: implement toString
    return 'ListBoxModel{ key: $key, name: $name, hour: $hour, minute: $minute, song: $song, days: $days, checked: $checked}';
  }
}
