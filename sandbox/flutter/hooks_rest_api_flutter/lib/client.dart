import 'package:flutter/foundation.dart';

class Client {
  final _interceptors = <Function>[];

  void addInterceptor(Function interceptor) {
    _interceptors.add(interceptor);
  }

  void run() {
    for (var interceptor in _interceptors) {
      interceptor();
    }
  }
}

void main() {
  final client = Client()
    ..addInterceptor(() {
      debugPrint('test');
    });
}
