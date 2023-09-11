import 'package:flutter/material.dart';

import 'task/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HNGiXTask2App());
}

class HNGiXTask2App extends StatelessWidget {
  const HNGiXTask2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainPage.route,
      routes: {
        MainPage.route: (context) => const MainPage(),
      },
      title: 'HNGi-X Task 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
        useMaterial3: true,
      ),
    );
  }
}
