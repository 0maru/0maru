import 'package:hooks_rest_api_flutter/cache_strategy/cache_strategy.dart';

class DefaultCacheStrategy implements CacheStrategy {
  final Map<String, dynamic> _cache = {};

  @override
  void delete(String key) {
    _cache.remove(key);
  }

  @override
  dynamic get(String key) {
    if (!_cache.containsKey(key)) {
      return null;
    }

    return _cache[key];
  }

  @override
  void set(String key, value) {
    _cache.addAll({key: value});
  }
}
