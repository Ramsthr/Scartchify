import 'package:flutter/material.dart';
import 'package:scratchify/scratchify.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  late final ScratchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScratchController(
      config: const ScratchConfig(
        revealFullAtPercent: 0.3,
        gridResolution: 100,
        brushSize: 30.0,
        revealAnimationType: RevealAnimationType.slideLeft,
        brushShape: BrushShape.heart,
        enableProgressAnimation: true,
      ),
    );
  }

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
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: ScratchCard(
                controller: _controller,
                child: Container(
                  color: Colors.yellow,
                  child: const Center(
                    child: Text(
                      '🎉 You Won! 🎉',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                overlay: Container(
                  color: Colors.grey,
                  child: const Center(
                    child: Text(
                      'Scratch Here sdfdf!',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _controller.reveal,
                  child: const Text('Reveal'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _controller.reset,
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Text(
                  'Progress: ${(_controller.progress * 100).toInt()}%',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
