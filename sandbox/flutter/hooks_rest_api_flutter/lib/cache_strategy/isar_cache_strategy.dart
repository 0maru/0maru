import 'cache_strategy.dart';

class IsarCacheStrategy implements CacheStrategy {
  @override
  void delete(String key) {
    return;
  }

  @override
  dynamic get(String key) {
    return null;
  }

  @override
  void set(String key, value) {
    return;
  }
}
