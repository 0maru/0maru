import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = usePackageInfo();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(packageInfo.data?.packageName ?? 'loading...'),
            TextButton(
              child: Text('run'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

AsyncSnapshot<PackageInfo> usePackageInfo() {
  final packageInfo = useMemoized(
    init,
    ['packageInfo'],
  );
  return useFuture(packageInfo);
}

Future<PackageInfo> init() {
  print('init');
  return PackageInfo.fromPlatform();
}
