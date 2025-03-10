import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePageController {
  final AudioPlayer audioPlayer = AudioPlayer();
  final ScrollController scrollController = ScrollController();
  bool isPlaying = false;

  // Animation constants
  final double initialHeaderHeight = 300;
  final double finalHeaderHeight = 200;
  final double topPadding = 1;
  int seconds = 0;
  int milliseconds = 0;

  // Audio position tracking
  Timer? _positionTimer;
  double currentTimestamp = 0;
  int currentLyricIndex = -1;
  final StreamController<double> timestampStream =
      StreamController<double>.broadcast();
  final StreamController<int> highlightedLyricStream =
      StreamController<int>.broadcast();
  final List<Map<String, dynamic>> lyricsData = [
    {"lyrics": "Aree sun be bhidu, ye hai Dharavi ka bhoot", "timestamp": 9},
    {
      "lyrics": "Yahan koi nahi phokat ka, sab hai khud ka root!",
      "timestamp": 12
    },
    {
      "lyrics": "Halka leke baitha, toh life dega jhatka,",
      "timestamp": 14.661000,
      "type": "clickable",
      "number": 1,
    },
    {
      "lyrics": "Raste pe gir gaya toh, koi nahi uthane wala patka!",
      "timestamp": 16.9
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 20},
    {
      "lyrics": "Maa machine pe silai, baap ka haath me chhalla,",
      "timestamp": 19.715000,
      "type": "clickable",
      "number": 2
    },
    {
      "lyrics": "Bachpan ka sapna, cricket ya chhoti galli ka dhanda?",
      "timestamp": 22.310000,
      "type": "clickable",
      "number": 2
    },
    {"lyrics": "Bhai bole, 'Beta safe खेल',", "timestamp": 24.866000},
    {"lyrics": "Par sapne heavy, toh dil kaise fail?", "timestamp": 26.662000},
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 20},
    {
      "lyrics": "Rap likhne baithe, toh gharwale bole, 'Yeh kya hai?'",
      "timestamp": 29.510000
    },
    {
      "lyrics": "'Bhaag school ja, nahi toh kal koi naukri na hai!'",
      "timestamp": 32.3,
      "type": "clickable",
      "number": 3
    },
    {
      "lyrics": "Bollywood wale bole, 'Hip-hop toh faltu hai,'",
      "timestamp": 34.63
    },
    {
      "lyrics": "Par yahi beat jab trending gayi, tab sab ka jadoo hai!",
      "timestamp": 36.862000
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 20},
    {
      "lyrics": "Scene बना underground, par budget hai zero,",
      "timestamp": 39.338000
    },
    {
      "lyrics": "Maa ke phone pe record, studio door ka sapna hero!",
      "timestamp": 41.35
    },
    {
      "lyrics": "Class privilege ke wajah se gatekeepers high,",
      "timestamp": 44.166000,
      "type": "clickable",
      "number": 4,
    },
    {
      "lyrics": "Par hum galiyo se aaye, aur beat pe laaye bhai!",
      "timestamp": 46.718000
    },
    {
      "lyrics": "",
      "timestamp": -1,
      "type": "spacer",
      "height": 20,
    },
    {
      "lyrics": "'Raat ka time, galiyon ka crime,'",
      "timestamp": 49.613000,
    },
    {
      "lyrics": "'Andar ke dukh bhi, beat pe rhyme!'",
      "timestamp": 52.247000,
    },
    {
      "lyrics": "'Ghar ke andar chillam chale,'",
      "timestamp": 54.338000,
      "type": "clickable",
      "number": 5
    },
    {
      "lyrics": "'Maa ke aansu kisi ko dikhe naa bhale!'",
      "timestamp": 56.732000,
      "type": "clickable",
      "number": 5
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 20},
    {"lyrics": "Galli ka ladka ball fake bohot tight,", "timestamp": 58.917000},
    {
      "lyrics": "Par school ki kitaab bole, 'Beta future bright!'",
      "timestamp": 61
    },
    {"lyrics": "Maa bole, 'Bheja mat garam kar,'", "timestamp": 63.848000},
    {
      "lyrics": "Baap bole, 'Zindagi ye hai, koi nahi hero yaar!'",
      "timestamp": 65.901000
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 20},
    {
      "lyrics": "Magar mic uthaye, toh duniya lagi judge karne,",
      "timestamp": 68.651000,
      "type": "clickable",
      "number": 6,
    },
    {
      "lyrics": "'Yeh kya be faltu hai, koi job dhang ka कर ले?'",
      "timestamp": 71.333000
    },
    {
      "lyrics": "Rap ka matlab struggle hai, par yeh nahi samjhe,",
      "timestamp": 73.768
    },
    {
      "lyrics": "Bhai padh likh ke bhi naukri nahi mile, toh kaun jhant ले?",
      "timestamp": 75.762
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 20},
    {
      "lyrics": "Hip-hop wale bolte, 'Game toh maara hi hai,'",
      "timestamp": 78.949000
    },
    {
      "lyrics": "Par privilege walo ke saamne, hum niche se aaye hai!",
      "timestamp": 81.037000
    },
    {
      "lyrics": "YouTube views pe chalega, par brands nahi denge,",
      "timestamp": 83.686000
    },
    {
      "lyrics": "Ek din yahi beat pe stadium bhar denge!",
      "timestamp": 86.13000
    },
    {
      "lyrics": "",
      "timestamp": -1,
      "type": "spacer",
      "height": 20,
    },
    {
      "lyrics": "'Suno suno, saara system hi mute,'",
      "timestamp": 88.703000,
    },
    {
      "lyrics": "'Andar se chillaye, par koi nahi sunt!'",
      "timestamp": 91,
    },
    {
      "lyrics": "'Paisa bolega, tabhi milega loot,'",
      "timestamp": 93.517,
    },
    {
      "lyrics": "'Duniya chhoti, Dharavi ka bhoot!'",
      "timestamp": 96.267,
    },
    {
      "lyrics": "",
      "timestamp": -1,
      "type": "spacer",
      "height": 20,
    },
    {
      "lyrics": "Arrey neta aaye, promise ki barsaat,",
      "timestamp": 98.165,
      "type": "clickable",
      "number": 7,
    },
    {
      "lyrics": "Phir gayab jaise chhatt se barsi sau chhat!",
      "timestamp": 100.262000
    },
    {"lyrics": "Gutter ka paani, sadkon pe kheech,", "timestamp": 102.885000},
    {
      "lyrics": "Par Dharavi bole, 'Hum todenge ye deewar ke beech!'",
      "timestamp": 104.864
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 20},
    {
      "lyrics": "Par jab mic uthaye, toh log judge karte,",
      "timestamp": 107.573000
    },
    {
      "lyrics": "'Hip-hop toh sadak pe hai, yeh kaun sunta bhai?'",
      "timestamp": 109.816000,
      "type": "clickable",
      "number": 8,
    },
    {
      "lyrics": "Par bhai ka verse jab trending ho jaye,",
      "timestamp": 112.429000
    },
    {
      "lyrics": "Tabhi wahi log bolte, 'Bhai collab kab aaye?'",
      "timestamp": 114.800000
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 20},
    {
      "lyrics": "Ghar chhota, par aukaat badi,",
      "timestamp": 117.665000,
      "type": "clickable",
      "number": 9,
    },
    {
      "lyrics": "Ek din TV pe naam likhwayenge, ghadi ghadi!",
      "timestamp": 119.697000,
      "type": "clickable",
      "number": 10,
    },
    {
      "lyrics": "Poverty ka system, par mentality rich,",
      "timestamp": 122.381000
    },
    {
      "lyrics": "Kaam se badlenge game, no time for snitch!",
      "timestamp": 124.479000
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 20},
    {
      "lyrics": "'Yeh Dharavi ka bhoot, sapne hai tezz,'",
      "timestamp": 127.098000
    },
    {
      "lyrics": "'Ek din name hoga, pura shahar dega craze!'",
      "timestamp": 129.832000
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 20},
    {
      "lyrics": "'Yeh Dharavi ka bhoot, sapne hai tezz,'",
      "timestamp": 151,
    },
    {
      "lyrics": "'Ek din name hoga, pura shahar dega craze!'",
      "timestamp": 154.28000
    },
  ];
  late final List<List<Map<String, dynamic>>> lyricGroups;

  HomePageController() {
    lyricGroups = _groupLyrics(lyricsData);
  }

  // Group lyrics by separating them at spacer markers
  List<List<Map<String, dynamic>>> _groupLyrics(
      List<Map<String, dynamic>> data) {
    List<List<Map<String, dynamic>>> groups = [];
    List<Map<String, dynamic>> currentGroup = [];

    for (var item in data) {
      if (item.containsKey("type") && item["type"] == "spacer") {
        if (currentGroup.isNotEmpty) {
          groups.add(List.from(currentGroup));
          currentGroup = [];
        }
      } else {
        currentGroup.add(item);
      }
    }

    if (currentGroup.isNotEmpty) {
      groups.add(List.from(currentGroup));
    }

    return groups;
  }

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

  /// Handles scroll events by determining if music should start or stop.
  void handleScroll(double screenHeight) {
    double maxScroll = screenHeight * 0.3;
    double scrollPosition =
        scrollController.hasClients ? scrollController.position.pixels : 0;

    if (scrollPosition >= maxScroll && !isPlaying) {
      playMusicFromPosition(0);
    } else if (scrollPosition < maxScroll && isPlaying) {
      stopMusic();
    }
  }

  // Start a timer to track audio position
  void startPositionTracking() {
    _positionTimer?.cancel();
    _positionTimer = Timer.periodic(Duration(milliseconds: 100), (timer) async {
      if (isPlaying) {
        Duration? position = await audioPlayer.getCurrentPosition();
        if (position != null) {
          currentTimestamp = position.inMilliseconds / 1000;
          timestampStream.add(currentTimestamp);

          // Find which lyric to highlight
          int newHighlightedIndex = findCurrentLyricIndex(currentTimestamp);
          if (newHighlightedIndex != currentLyricIndex) {
            currentLyricIndex = newHighlightedIndex;
            highlightedLyricStream.add(currentLyricIndex);
          }
        }
      }
    });
  }

  // Find which lyric corresponds to the current timestamp
  int findCurrentLyricIndex(double timestamp) {
    // Initialize with -1 (no lyrics highlighted)
    int currentIndex = -1;

    // Find the lyric that corresponds to the current timestamp
    for (int i = 0; i < lyricsData.length; i++) {
      var lyric = lyricsData[i];
      if (lyric["timestamp"] != -1 &&
          lyric["timestamp"] <= timestamp &&
          (i == lyricsData.length - 1 ||
              lyricsData[i + 1]["timestamp"] == -1 ||
              lyricsData[i + 1]["timestamp"] > timestamp)) {
        currentIndex = i;
      }
    }

    return currentIndex;
  }

  // Plays music from a given position (in seconds)
  Future<void> playMusicFromPosition(double timeStamp) async {
    seconds = timeStamp.floor();
    milliseconds = ((timeStamp - seconds) * 1000).round();
    await audioPlayer.setSource(AssetSource('dharavikabhoot.mp3'));
    await audioPlayer
        .seek(Duration(seconds: seconds, milliseconds: milliseconds));
    await audioPlayer.resume();
    isPlaying = true;

    // Start tracking position when playing
    startPositionTracking();
  }

  // Stops the music playback
  Future<void> stopMusic() async {
    await audioPlayer.stop();
    isPlaying = false;
    _positionTimer?.cancel();
    currentLyricIndex = -1;
    highlightedLyricStream.add(currentLyricIndex);
  }

  // Jumps to a specific lyric and timestamp
  Future<void> jumpToLyric(int index) async {
    if (index >= 0 && index < lyricsData.length) {
      var lyric = lyricsData[index];
      if (lyric["timestamp"] != -1) {
        await playMusicFromPosition(lyric["timestamp"]);
      }
    }
  }

  // For manually syncing lyrics if needed
  void updateHighlightedLyric(int index) {
    if (currentLyricIndex != index) {
      currentLyricIndex = index;
      highlightedLyricStream.add(index);
    }
  }

  void dispose() {
    scrollController.dispose();
    audioPlayer.dispose();
    _positionTimer?.cancel();
    timestampStream.close();
    highlightedLyricStream.close();
  }
}
