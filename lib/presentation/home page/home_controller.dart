import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePageController {
  final AudioPlayer audioPlayer = AudioPlayer();
  final ScrollController scrollController = ScrollController();
  bool isPlaying = false;

  // Animation constants
  final double initialHeaderHeight = 400;
  final double finalHeaderHeight = 200;
  final double topPadding = 1;

  // Animation state calculations
  double calculateHeaderHeight(double scrollPosition, double maxScroll) {
    double progress = (scrollPosition / maxScroll).clamp(0.0, 1.0);
    return initialHeaderHeight -
        ((initialHeaderHeight - finalHeaderHeight) * progress);
  }

  double calculateHeaderTop(
      double scrollPosition, double maxScroll, double screenHeight) {
    double progress = (scrollPosition / maxScroll).clamp(0.0, 1.0);
    double initialTop = (screenHeight - initialHeaderHeight) / 2;
    double finalTop = topPadding;
    return initialTop + (finalTop - initialTop) * progress;
  }

// Alternative approach - seek first then play
  Future<void> playMusicFromPosition(int seconds) async {
    await audioPlayer.setSource(AssetSource('dharavikabhoot.mp3'));
    await audioPlayer.seek(Duration(seconds: seconds));
    await audioPlayer.resume();
    isPlaying = true;
  }

  Future<void> stopMusic() async {
    await audioPlayer.stop();
    isPlaying = false;
  }

  void dispose() {
    scrollController.dispose();
    audioPlayer.dispose();
  }
}
