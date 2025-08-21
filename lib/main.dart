import 'package:flutter/material.dart';

void main() {
  runApp(const BrxApp());
}

class BrxApp extends StatelessWidget {
  const BrxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BRX Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('BRX Mobile App'),
        ),
      ),
    );
  }
}
