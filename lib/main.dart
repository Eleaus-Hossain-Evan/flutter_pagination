import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/home_screen.dart';
import 'network_util/network_handler.dart';

void main() {
   NetworkHandler.instance
    ..setup(baseUrl: "https://api.courier.b2gsoft.xyz/", showLogs: false)
    ..setToken('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Il9pZCI6IjY0YzRkMjcxY2VjNWIzNjU3ODViODk4OSIsIm5hbWUiOiJmb3JoYWQiLCJwaG9uZSI6IjAxNzI4ODk3MjU1IiwiZW1haWwiOiJhYmRAZ21haWwuY29tIiwiaHViSWQiOiI2NGFkMTdhMzQ1ZTM4OTJlMzQyMjVhNTgiLCJodWJOYW1lIjoibmlrdW5qYSIsInJvbGUiOiJtZXJjaGFudCJ9LCJpYXQiOjE2OTA4OTAxNzMsImV4cCI6MTcyMjQyNjE3M30.EXQ-PT_uiGDYSiKcgtd8tLVR9uVq-V63sbGreqrN9u0');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
