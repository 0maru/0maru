import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AsyncSnapshot<String?> useUserApi<String>([String? initialData]) {
  final result = useState<String?>(initialData);
  final future = useFuture<String?>(
    Future.delayed(
      const Duration(seconds: 1),
      () {
        return result.value;
      },
    ),
  );
  return future;
}
