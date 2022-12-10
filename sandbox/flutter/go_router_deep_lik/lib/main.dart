import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

Future<void> initUniLinks() async {
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    // deeplink
    final initialLink = await getInitialLink();
    context.push(initialLink);
  } on PlatformException {
    // Handle exception by warning the user their action did not succeed
    // return?
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

final _router = GoRouter(
  initialLocation: InitWidget.path,
  routes: [
    GoRoute(
      path: InitWidget.path,
      builder: (_, state) => const InitWidget(),
    ),
    GoRoute(
      path: BookshelfScreen.path,
      builder: (_, state) => const BookshelfScreen(),
    ),
  ],
);

class InitWidget extends StatelessWidget {
  const InitWidget({Key? key}) : super(key: key);

  static const path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(
            child: Text(path),
          ),
          TextButton(
            onPressed: () {
              context.push(BookshelfScreen.path);
            },
            child: const Text('push'),
          ),
        ],
      ),
    );
  }
}

class BookshelfScreen extends StatelessWidget {
  const BookshelfScreen({Key? key}) : super(key: key);

  static const path = '/bookshelf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(
            child: Text(path),
          ),
          TextButton(
            onPressed: () {
              context.push(BookContentScreen.path);
            },
            child: const Text('push'),
          ),
        ],
      ),
    );
  }
}

class BookContentScreen extends StatelessWidget {
  const BookContentScreen({Key? key}) : super(key: key);

  static const path = 'bookshelf/content/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(
            child: Text(path),
          ),
          TextButton(
            onPressed: () {
              context.push(BookshelfScreen.path);
            },
            child: Text('push'),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
