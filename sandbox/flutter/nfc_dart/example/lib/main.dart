import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_dart/nfc_dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final _nfcDartPlugin = NfcDart();

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      _nfcDartPlugin.loadCardReader();
      platformVersion = await _nfcDartPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            const _ReaderSelector(),
            Text('Running on: $_platformVersion\n'),
            TextButton(
              child: const Text('loadNFC'),
              onPressed: () {
                _nfcDartPlugin.loadNFC();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ReaderSelector extends StatefulWidget {
  const _ReaderSelector({Key? key}) : super(key: key);

  @override
  State<_ReaderSelector> createState() => _ReaderSelectorState();
}

class _ReaderSelectorState extends State<_ReaderSelector> {
  Future<List<String>>? readers;

  @override
  void initState() {
    super.initState();
    readers = _nfcDartPlugin.loadCardReader();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: readers,
      initialData: const <String>[],
      builder: (context, snapshot) {
        return DropdownButton(
          value: snapshot.data?.first,
          items: [
            for (final reader in snapshot.data ?? [])
              DropdownMenuItem(
                value: reader,
                child: Text(reader),
              ),
          ],
          onChanged: (val) {
            print('onChanged: ${val}');
          },
        );
      },
    );
  }
}
