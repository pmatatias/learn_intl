import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/services.dart';

// void changeIcon(String aliasName) async {
//   const platform = MethodChannel('com.example.learn_intl/changeIcon');
//   await platform.invokeMethod('changeIcon', {'aliasName': aliasName});
// }

Future<void> changeIcon(String aliasName) async {
  const platform = MethodChannel('com.example.learn_intl/changeIcon');

  try {
    await platform.invokeMethod('changeIcon', {'aliasName': aliasName});
  } on PlatformException catch (e) {
    print("Failed to change icon: '${e.message}'.");
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            onPressed: () async {
              await changeIcon('Alias1');
            },
            child: const Text('alias 1'),
          ),
          ElevatedButton(
            onPressed: () async {
              await changeIcon('Alias2');
            },
            child: const Text('alias 2'),
          ),
          ElevatedButton(
            onPressed: () async {
              Platform.isAndroid
                  ? await changeIcon('MainActivity')
                  : await changeIcon('AppIcon');
            },
            child: const Text('Default'),
          ),
        ],
      )),
    );
  }
}
