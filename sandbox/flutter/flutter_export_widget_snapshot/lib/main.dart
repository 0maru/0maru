import 'dart:ui' as ui show Image, ImageByteFormat;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final globalKey = GlobalKey();

class _MyHomePageState extends State<MyHomePage> {
  /// 書き出す画像のサイズを変更する
  ///
  /// ただし書き出したいサイズになるのではなく、書き出したいサイズに近いサイズになるだけ
  /// 書き出したいサイズと同じ比率にしたければ書き出しもとのWidget を書き出したいサイズの比率にしておく必要がある
  Future<void> exportImage(Size? exportSize) async {
    final context = globalKey.currentContext;
    if (context == null) {
      print('context is null');
      return;
    }

    var pixelRatio = 1.0;
    if (exportSize != null) {
      pixelRatio = (exportSize.width * exportSize.height) /
          (context.size!.width * context.size!.height);
    }

    final boundary = context.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      print('boundary is null');
      return;
    }

    //RenderObject をui.Imageに変換する
    ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final imageBytes = byteData?.buffer.asUint8List();
    if (imageBytes == null) {
      return;
    }

    // 端末に画像を保存する
    await ImageGallerySaver.saveImage(imageBytes, quality: 100);
    print('exported');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RepaintBoundary(
        key: globalKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('width: ${MediaQuery.of(context).size.width}'),
              Text('height: ${MediaQuery.of(context).size.height}'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final exportSize = const Size(600, 800);
          await exportImage(exportSize);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
