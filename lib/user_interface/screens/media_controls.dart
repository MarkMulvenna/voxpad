import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MediaController extends StatelessWidget {
  const MediaController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, 
        children: [
          Positioned.fill(
            child: Image.asset(
              "lib/res/background.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset(
                      'lib/res/CelesteAlbum.jpg',
                      scale: 1.3,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Marquee(
                          text: 'Celeste: Farewell (Original Soundtrack) - Fear of the Unknown',
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 32),
                          scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          blankSpace: 20.0,
                          velocity: 100.0,
                          pauseAfterRound: const Duration(seconds: 1),
                          startPadding: 10.0,
                          accelerationDuration: const Duration(seconds: 1),
                          accelerationCurve: Curves.linear,
                          decelerationDuration: const Duration(milliseconds: 500),
                          decelerationCurve: Curves.easeOut,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 60, 
                            icon: const Icon(Icons.skip_previous),
                            onPressed: () {
                              // Add functionality for previous button
                            },
                          ),
                          IconButton(
                            iconSize: 60, 
                            icon: const Icon(Icons.play_arrow),
                            onPressed: () {
                              // Add functionality for play/pause button
                            },
                          ),
                          IconButton(
                            iconSize: 60,
                            icon: const Icon(Icons.skip_next),
                            onPressed: () {
                              // Add functionality for next button
                            },
                          ),
                          IconButton(
                            iconSize: 60,
                            icon: const Icon(Icons.stop),
                            onPressed: () {
                              // Add functionality for stop button
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MediaController(),
  ));
}
