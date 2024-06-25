import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:provider/provider.dart';
import 'package:vox_pad/logic/data/objects/StateManager.dart';
import 'package:vox_pad/logic/services/ServerConfigurationService.dart';
import 'package:vox_pad/logic/services/InitialisationService.dart';
import 'package:vox_pad/user_interface/screens/connection_screen.dart';
import 'package:vox_pad/user_interface/screens/main_menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late InitialisationService _initialisationService;

  @override
  void initState() {
    super.initState();
    final stateManager = Provider.of<StateManager>(context, listen: false);
    _initialisationService = InitialisationService(
      ServerConfigurationService(),
      stateManager,
    );

    if (Platform.isWindows) {
      _initializeWindowsVideo();
    } else {
      _initializeChewie();
    }
  }

  Future<void> _initializeApp() async {
    bool initialised = await _initialisationService.initialise();
    if (mounted) {
      if (initialised) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainMenu()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ConnectionScreen()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Settings could not be loaded.')),
        );
      }
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  void _initializeWindowsVideo() {
    String filePath = 'lib/res/voXPAD.mp4';

    if (File(filePath).existsSync()) {
      _videoPlayerController = VideoPlayerController.file(File(filePath));
    } else {
      return;
    }

    _videoPlayerController.initialize().then((_) {
      setState(() {});
      _videoPlayerController.setLooping(false);
      _videoPlayerController.play();

      _videoPlayerController.addListener(() {
        if (_videoPlayerController.value.position == _videoPlayerController.value.duration) {
          _videoPlayerController.setLooping(true);
          _videoPlayerController.play();
          _initializeApp();
        }
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Failed to initialize video: $error');
      }
    });
  }

  void _initializeChewie() {
    String videoPath = 'lib/res/voXPAD.mp4';
    _videoPlayerController = VideoPlayerController.asset(videoPath);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      showControls: false,
      allowFullScreen: false,
    );

    _videoPlayerController.initialize().then((_) {
      setState(() {});

      _videoPlayerController.addListener(() {
        if (_videoPlayerController.value.position == _videoPlayerController.value.duration) {
          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController,
            autoPlay: true,
            looping: true,
            showControls: false,
            allowFullScreen: false,
          );
          _initializeApp();
        }
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Failed to initialize video: $error');
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
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _videoPlayerController.value.size.width,
              height: _videoPlayerController.value.size.height,
              child: VideoPlayer(_videoPlayerController),
            ),
          ),
        )
            : const CircularProgressIndicator()
            : _chewieController.videoPlayerController.value.isInitialized
            ? FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _chewieController.videoPlayerController.value.size.width,
            height: _chewieController.videoPlayerController.value.size.height,
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
