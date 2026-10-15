import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ROS',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  DocumentReference<Map<String, dynamic>> get _doc =>
      FirebaseFirestore.instance.collection('demo').doc('counter');

  Future<void> _increment() =>
      _doc.set({'value': FieldValue.increment(1)}, SetOptions(merge: true));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase counter')),
      body: Center(
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: _doc.snapshots(),
          builder: (context, snap) {
            if (snap.hasError) return Text('Ошибка: ${snap.error}');
            if (!snap.hasData) return const CircularProgressIndicator();
            final value = snap.data!.data()?['value'] ?? 0;
            return Text('$value',
                style: Theme.of(context).textTheme.displayLarge);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}