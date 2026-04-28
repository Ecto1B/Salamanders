import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/unit.dart';

class CloudSync {
  static Future<void> syncUnit(Unit unit) async {
    await FirebaseFirestore.instance
        .collection('units')
        .add(unit.toMap());
  }
}
