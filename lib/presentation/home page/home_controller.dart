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
  int seconds = 0;
  int milliseconds = 0;

  final List<Map<String, dynamic>> lyricsData = [
    {"lyrics": "Aree sun be bhidu, ye hai Dharavi ka bhoot", "timestamp": 9},
    {
      "lyrics": "Yahan koi nahi phokat ka, sab hai khud ka root!",
      "timestamp": 12
    },
    {
      "lyrics": "Halka leke baitha, toh life dega jhatka,",
      "timestamp": 14.661000
    },
    {
      "lyrics": "Raste pe gir gaya toh, koi nahi uthane wala patka!",
      "timestamp": 16.9
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
    {
      "lyrics": "Maa machine pe silai, baap ka haath me chhalla,",
      "timestamp": 19.715000
    },
    {
      "lyrics": "Bachpan ka sapna, cricket ya chhoti galli ka dhanda?",
      "timestamp": 22.310000
    },
    {"lyrics": "Bhai bole, 'Beta safe खेल',", "timestamp": 24.866000},
    {"lyrics": "Par sapne heavy, toh dil kaise fail?", "timestamp": 26.662000},
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
    {
      "lyrics": "Rap likhne baithe, toh gharwale bole, 'Yeh kya hai?'",
      "timestamp": 29.510000
    },
    {
      "lyrics": "'Bhaag school ja, nahi toh kal koi naukri na hai!'",
      "timestamp": 32.3
    },
    {
      "lyrics": "Bollywood wale bole, 'Hip-hop toh faltu hai,'",
      "timestamp": 34.63
    },
    {
      "lyrics": "Par yahi beat jab trending gayi, tab sab ka jadoo hai!",
      "timestamp": 36.864000
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
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
      "timestamp": 44.166000
    },
    {
      "lyrics": "Par hum galiyo se aaye, aur beat pe laaye bhai!",
      "timestamp": 46.718000
    },
    {
      "lyrics": "",
      "timestamp": -1,
      "type": "spacer",
      "height": 40,
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
    },
    {
      "lyrics": "",
      "timestamp": -1,
      "type": "spacer",
      "height": 40,
    },
    {
      "lyrics": "'Maa ke aansu kisi ko dikhe naa bhale!'",
      "timestamp": 56.732000
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
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
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
    {
      "lyrics": "Magar mic uthaye, toh duniya lagi judge karne,",
      "timestamp": 68.651000
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
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
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
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
    {"lyrics": "'Suno suno, saara system hi mute,'", "timestamp": 88.703000},
    {"lyrics": "'Andar se chillaye, par koi nahi sunt!'", "timestamp": 91},
    {"lyrics": "'Paisa bolega, tabhi milega loot,'", "timestamp": 93.517},
    {"lyrics": "'Duniya chhoti, Dharavi ka bhoot!'", "timestamp": 96.267},
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
    {"lyrics": "Arrey neta aaye, promise ki barsaat,", "timestamp": 98.165},
    {
      "lyrics": "Phir gayab jaise chhatt se barsi sau chhat!",
      "timestamp": 100.264000
    },
    {"lyrics": "Gutter ka paani, sadkon pe kheech,", "timestamp": 102.885000},
    {
      "lyrics": "Par Dharavi bole, 'Hum todenge ye deewar ke beech!'",
      "timestamp": 104.864
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
    {
      "lyrics": "Par jab mic uthaye, toh log judge karte,",
      "timestamp": 107.573000
    },
    {
      "lyrics": "'Hip-hop toh sadak pe hai, yeh kaun sunta bhai?'",
      "timestamp": 109.816000
    },
    {
      "lyrics": "Par bhai ka verse jab trending ho jaye,",
      "timestamp": 112.429000
    },
    {
      "lyrics": "Tabhi wahi log bolte, 'Bhai collab kab aaye?'",
      "timestamp": 114.800000
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
    {
      "lyrics": "Ghar chhota, par aukaat badi,",
      "timestamp": 117.665000,
    },
    {
      "lyrics": "Ek din TV pe naam likhwayenge, ghadi ghadi!",
      "timestamp": 119.697000
    },
    {
      "lyrics": "Poverty ka system, par mentality rich,",
      "timestamp": 122.381000
    },
    {
      "lyrics": "Kaam se badlenge game, no time for snitch!",
      "timestamp": 124.479000
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
    {
      "lyrics": "'Yeh Dharavi ka bhoot, sapne hai tezz,'",
      "timestamp": 127.098000
    },
    {
      "lyrics": "'Ek din name hoga, pura shahar dega craze!'",
      "timestamp": 129.832000
    },
    {"lyrics": "", "timestamp": -1, "type": "spacer", "height": 40},
    {
      "lyrics": "'Yeh Dharavi ka bhoot, sapne hai tezz,'",
      "timestamp": 151,
    },
    {
      "lyrics": "'Ek din name hoga, pura shahar dega craze!'",
      "timestamp": 154.28000
    },
  ];

  // Initialize lyricGroups in constructor to ensure it's ready when view is created
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

  // Plays music from a given position (in seconds)
  Future<void> playMusicFromPosition(double timeStamp) async {
    seconds = timeStamp.floor();
    milliseconds = ((timeStamp - seconds) * 1000).round();

    await audioPlayer.setSource(AssetSource('dharavikabhoot.mp3'));
    await audioPlayer
        .seek(Duration(seconds: seconds, milliseconds: milliseconds));
    await audioPlayer.resume();
    isPlaying = true;
  }

  // Stops the music playback
  Future<void> stopMusic() async {
    await audioPlayer.stop();
    isPlaying = false;
  }

  void dispose() {
    scrollController.dispose();
    audioPlayer.dispose();
  }
}
