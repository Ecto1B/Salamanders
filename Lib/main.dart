import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/army_screen.dart';
import 'screens/battle_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SalamandersApp());
}

class SalamandersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forge Command',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF1B5E20),
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF2E7D32),
          secondary: Color(0xFFFF6F00),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      home: ArmyScreen(),
      routes: {
        '/battle': (_) => BattleScreen(),
      },
    );
  }
}
