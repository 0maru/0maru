import 'package:isar/isar.dart';

@Collection()
class Cache {
  ///
  @Id()
  late String key;

  ///
  late String value;
}
