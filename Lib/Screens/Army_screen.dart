import 'package:flutter/material.dart';
import '../models/unit.dart';
import '../services/db_helper.dart';
import '../services/cloud_sync.dart';
import '../widgets/forge_mode.dart';

class ArmyScreen extends StatefulWidget {
  @override
  State<ArmyScreen> createState() => _ArmyScreenState();
}

class _ArmyScreenState extends State<ArmyScreen> {
  List<Unit> units = [];

  Future<void> addUnit(Unit unit) async {
    final db = await DBHelper.initDB();
    await db.insert('units', unit.toMap());
    await CloudSync.syncUnit(unit);
    loadUnits();
  }

  Future<void> loadUnits() async {
    final db = await DBHelper.initDB();
    final data = await db.query('units');
    setState(() {
      units = data.map((e) => Unit.fromMap(e)).toList();
    });
  }

  void openAddDialog() {
    String name = "";
    int points = 0;
    String notes = "";

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Add Unit"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(onChanged: (v) => name = v),
            TextField(onChanged: (v) => points = int.tryParse(v) ?? 0),
            TextField(onChanged: (v) => notes = v),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              addUnit(Unit(name: name, points: points, notes: notes));
              Navigator.pop(context);
            },
            child: Text("Add"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ForgeModeBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Forge Command"),
          actions: [
            IconButton(
              icon: Icon(Icons.bolt),
              onPressed: () => Navigator.pushNamed(context, '/battle'),
            )
          ],
        ),
        body: ListView(
          children: units
              .map((u) => ListTile(
                    title: Text(u.name),
                    subtitle: Text("${u.points} pts"),
                  ))
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: openAddDialog,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
