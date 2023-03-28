import 'package:drift/drift.dart';
import 'package:flutter_drift_sample/database/schema.dart';
import 'package:flutter_drift_sample/main.dart';

Future<void> insertTodo(int count) async {
  print('start insertTodo: ${count} --- ${DateTime.now()}');
  // API通信をシミュレート
  await Future.delayed(const Duration(seconds: 1));
  await database.batch((batch) {
    batch.insertAllOnConflictUpdate(
      database.todos,
      [
        for (var i = 0; i < 100; i++)
          TodosCompanion(
            title: Value('title$i'),
            content: Value('jfkl;jas;dklfjiaowejfonasdo;inaio'),
            category: Value(null),
          ),
      ],
    );
    print('[insertTodo]batch insert complete ${DateTime.now()}');
  });
  print('end insertTodo: ${DateTime.now()}');
}

Future<void> insertCategory(int count) async {
  print('start insertCategory: ${count} ---  ${DateTime.now()}');
  // API通信をシミュレート
  await Future.delayed(const Duration(milliseconds: 100));
  await database.batch((batch) {
    batch.insertAllOnConflictUpdate(
      database.categories,
      [
        for (var i = 0; i < 100; i++)
          CategoriesCompanion(
            description: Value('fasldkfj9$i'),
          ),
      ],
    );
    print('[insertCategory]batch insert complete ${DateTime.now()}');
  });
  print('end insertCategory: ${DateTime.now()}');
}
