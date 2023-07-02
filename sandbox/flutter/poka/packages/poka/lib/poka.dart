library poka;

import 'package:http/http.dart' as http;

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

// https://graphql-pokemon2.vercel.app/
class Poka {}

Future<http.Response> fetchQuery() async {
  final client = http.Client();
  final response = await client.post(
    Uri.parse('https://graphql-pokemon2.vercel.app/'),
    body: {
      'query': r'''
        query GetPokemon {
          pokemon(name: "Pikachu") {
            id
            number
            name
            attacks {
              special {
                name
                type
                damage
              }
            }
          }
        }
      '''
    },
  );
  return response;
}

Future<http.Response> usePokemon(String name) async {
  final client = http.Client();
  return await client.post(
    Uri.parse('https://graphql-pokemon2.vercel.app/'),
    body: {
      'query':
          'query GetPokemon {\n  pokemon(name: "%s") { \n  id\n  number\n  name\n  attacks {\n  special {\n  name\n  type\n  damage\n  }\n}\n}\n}'
              .replaceAll('%s', name)
    },
  );
}
