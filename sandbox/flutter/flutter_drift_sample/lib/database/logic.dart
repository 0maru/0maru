import 'package:drift/drift.dart';
import 'package:flutter_drift_sample/database/schema.dart';
import 'package:flutter_drift_sample/main.dart';

Future<void> insertTodo() async {
  await database.batch((batch) {
    print('start insertTodo: ${DateTime.now()}');
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
    print('end insertTodo: ${DateTime.now()}');
  });
}

Future<void> insertCategory() async {
  await database.batch((batch) {
    print('start insertCategory: ${DateTime.now()}');
    batch.insertAllOnConflictUpdate(
      database.categories,
      [
        for (var i = 0; i < 100; i++)
          CategoriesCompanion(
            description: Value('fasldkfj9$i'),
          ),
      ],
    );
    print('end insertCategory: ${DateTime.now()}');
  });
}
