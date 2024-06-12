import 'package:hive/hive.dart';

part 'selected_model.g.dart';

@HiveType(typeId: 001)
class SelectedModel {
  @HiveField(0)
  final String key;
  @HiveField(1)
  bool checked;

  SelectedModel(this.key, this.checked);

  @override
  String toString() {
    return 'SelectedModel{key: $key, checked: $checked}';
  }
}
