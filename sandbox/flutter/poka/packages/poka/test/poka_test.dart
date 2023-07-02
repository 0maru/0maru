import 'package:flutter_test/flutter_test.dart';

import 'package:poka/poka.dart';

void main() {
  test('adds one to input values', () async {
    final response = await usePokemon('Pikachu');
    print(response.body);
  });
}
