import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const [
          SignInForm(),
        ],
      ),
    );
  }
}

class SignInFormType {
  SignInFormType(
    this.email,
    this.password,
  );

  final String email;
  final String password;
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final formKey2 = GlobalKey<FormState>();
    final formKey3 = GlobalKey<FormState>();
    final formKey4 = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(),
          TextFormField(),
          TextFormField(),
          TextButton(
            child: const Text('submit'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
