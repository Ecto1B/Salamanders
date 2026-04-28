import 'package:flutter/material.dart';
import '../widgets/forge_mode.dart';

class BattleScreen extends StatefulWidget {
  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  int turn = 1;
  int phase = 0;

  final phases = ["Command", "Movement", "Shooting", "Charge", "Fight"];

  void next() {
    setState(() {
      if (phase < phases.length - 1) {
        phase++;
      } else {
        phase = 0;
        turn++;
      }
    });
  }

  String tip() {
    if (phases[phase] == "Shooting") return "🔥 Maximize flame weapon output";
    if (phases[phase] == "Fight") return "⚔️ Commit re-rolls strategically";
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return ForgeModeBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text("Turn $turn")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(phases[phase], style: TextStyle(fontSize: 28)),
              SizedBox(height: 10),
              Text(tip()),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: next,
                child: Text("Next Phase"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
