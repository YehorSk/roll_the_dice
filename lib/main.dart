
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roll the Dice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Roll the Dice'),
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
  final Random random = Random();

  int diceNumber = 1;

  void _rollDice() {
    setState(() {
      diceNumber = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Roll the Dice!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            Image.asset(
              'assets/images/dice-$diceNumber.png',
              width: 180,
              height: 180,
            ),

            const SizedBox(height: 16),

            Text(
              'Result: $diceNumber',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: _rollDice,
              icon: const Icon(Icons.casino),
              label: const Text('Roll'),
            ),
          ],
        ),
      ),
    );
  }
}
