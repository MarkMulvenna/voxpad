import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    if (Platform.isWindows) {
      _initializeWindowsVideo();
    } else {
      _initializeChewie();
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  void _initializeWindowsVideo() {
    String filePath = 'lib/res/voXPAD.mp4'; // Update with your correct file path

    if (File(filePath).existsSync()) {
      _videoPlayerController = VideoPlayerController.file(File(filePath));
    } else {
      return;
    }

    _videoPlayerController.initialize().then((_) {
      setState(() {});
      _videoPlayerController.setLooping(true); // Enable looping
      _videoPlayerController.play(); // Auto-play the video
    }).catchError((error) {
      print('Failed to initialize video: $error');
    });

    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.isCompleted) {
        // Handle completion if needed
      }
    });
  }

  void _initializeChewie() {
    String videoPath = 'lib/res/voXPAD.mp4'; // Update with your correct asset path
    _videoPlayerController = VideoPlayerController.asset(videoPath);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      showControls: false,
      allowFullScreen: false,
    );

    _videoPlayerController.initialize().then((_) {
      setState(() {});
    }).catchError((error) {
    });

    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.isCompleted) {
        // Handle completion if needed
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Platform.isWindows
            ? _videoPlayerController.value.isInitialized
            ? AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: VideoPlayer(_videoPlayerController),
        )
            : const CircularProgressIndicator()
            : _chewieController.videoPlayerController.value.isInitialized
            ? Chewie(
          controller: _chewieController,
        )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
