import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

typedef InterceptorCallback = Request Function(Request request);

class Client {
  final _interceptors = <InterceptorCallback>[];

  void addInterceptor(InterceptorCallback interceptor) {
    _interceptors.add(interceptor);
  }

  void run() {
    for (var interceptor in _interceptors) {
      interceptor(Request('method', Uri.parse('uri')));
    }
  }
}

void main() {
  final client = Client()
    ..addInterceptor((request) {
      debugPrint('test');
      return request;
    });
}
