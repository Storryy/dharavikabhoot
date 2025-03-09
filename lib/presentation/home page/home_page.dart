import 'package:dharavikabhoot/presentation/home%20page/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late HomePageController controller;
  bool _hasStartedMusic = false;

  List<Map<String, dynamic>> lyricsData = [
    {"lyrics": "Aree sun be bhidu, ye hai Dharavi ka bhoot", "timestamp": 9},
    {
      "lyrics": "Yahan koi nahi phokat ka, sab hai khud ka root!",
      "timestamp": 11
    },
    {"lyrics": "Halka leke baitha, toh life dega jhatka,", "timestamp": 14},
    {
      "lyrics": "Raste pe gir gaya toh, koi nahi uthane wala patka!",
      "timestamp": 16
    },
    {
      "lyrics": "Maa machine pe silai, baap ka haath me chhalla,",
      "timestamp": 19
    },
    {
      "lyrics": "Bachpan ka sapna, cricket ya chhoti galli ka dhanda?",
      "timestamp": 22
    },
    {"lyrics": "Bhai bole, 'Beta safe खेल',", "timestamp": 24},
    {"lyrics": "Par sapne heavy, toh dil kaise fail?", "timestamp": 26},
    {
      "lyrics": "Rap likhne baithe, toh gharwale bole, 'Yeh kya hai?'",
      "timestamp": 30
    },
    {
      "lyrics": "'Bhaag school ja, nahi toh kal koi naukri na hai!'",
      "timestamp": 32
    },
    {
      "lyrics": "Bollywood wale bole, 'Hip-hop toh faltu hai,'",
      "timestamp": 34
    },
    {
      "lyrics": "Par yahi beat jab trending gayi, tab sab ka jadoo hai!",
      "timestamp": 36
    },
    {"lyrics": "Scene बना underground, par budget hai zero,", "timestamp": 39},
    {
      "lyrics": "Maa ke phone pe record, studio door ka sapna hero!",
      "timestamp": 41
    },
    {
      "lyrics": "Class privilege ke wajah se gatekeepers high,",
      "timestamp": 43
    },
    {
      "lyrics": "Par hum galiyo se aaye, aur beat pe laaye bhai!",
      "timestamp": 46
    },
    {"lyrics": "'Raat ka time, galiyon ka crime,'", "timestamp": 49},
    {"lyrics": "'Andar ke dukh bhi, beat pe rhyme!'", "timestamp": 51},
    {"lyrics": "'Ghar ke andar chillam chale,'", "timestamp": 54},
    {"lyrics": "'Maa ke aansu kisi ko dikhe naa bhale!'", "timestamp": 56},
    {"lyrics": "Galli ka ladka ball fake bohot tight,", "timestamp": 58},
    {
      "lyrics": "Par school ki kitaab bole, 'Beta future bright!'",
      "timestamp": 61
    },
    {"lyrics": "Maa bole, 'Bheja mat garam kar,'", "timestamp": 63},
    {
      "lyrics": "Baap bole, 'Zindagi ye hai, koi nahi hero yaar!'",
      "timestamp": 65
    },
    {
      "lyrics": "Magar mic uthaye, toh duniya lagi judge karne,",
      "timestamp": 68
    },
    {
      "lyrics": "'Yeh kya be faltu hai, koi job dhang ka कर ले?'",
      "timestamp": 70
    },
    {
      "lyrics": "Rap ka matlab struggle hai, par yeh nahi samjhe,",
      "timestamp": 73
    },
    {
      "lyrics": "Bhai padh likh ke bhi naukri nahi mile, toh kaun jhant ले?",
      "timestamp": 75
    },
    {"lyrics": "Hip-hop wale bolte, 'Game toh maara hi hai,'", "timestamp": 78},
    {
      "lyrics": "Par privilege walo ke saamne, hum niche se aaye hai!",
      "timestamp": 80
    },
    {
      "lyrics": "YouTube views pe chalega, par brands nahi denge,",
      "timestamp": 83
    },
    {"lyrics": "Ek din yahi beat pe stadium bhar denge!", "timestamp": 86},
    {"lyrics": "'Suno suno, saara system hi mute,'", "timestamp": 88},
    {"lyrics": "'Andar se chillaye, par koi nahi sunt!'", "timestamp": 91},
    {"lyrics": "'Paisa bolega, tabhi milega loot,'", "timestamp": 93},
    {"lyrics": "'Duniya chhoti, Dharavi ka bhoot!'", "timestamp": 95},
    {"lyrics": "Arrey neta aaye, promise ki barsaat,", "timestamp": 97},
    {"lyrics": "Phir gayab jaise chhatt se barsi sau chhat!", "timestamp": 100},
    {"lyrics": "Gutter ka paani, sadkon pe kheech,", "timestamp": 102},
    {
      "lyrics": "Par Dharavi bole, 'Hum todenge ye deewar ke beech!'",
      "timestamp": 104
    },
    {"lyrics": "Par jab mic uthaye, toh log judge karte,", "timestamp": 107},
    {
      "lyrics": "'Hip-hop toh sadak pe hai, yeh kaun sunta bhai?'",
      "timestamp": 109
    },
    {"lyrics": "Par bhai ka verse jab trending ho jaye,", "timestamp": 112},
    {
      "lyrics": "Tabhi wahi log bolte, 'Bhai collab kab aaye?'",
      "timestamp": 114
    },
    {"lyrics": "Ghar chhota, par aukaat badi,", "timestamp": 117},
    {"lyrics": "Ek din TV pe naam likhwayenge, ghadi ghadi!", "timestamp": 119},
    {"lyrics": "Poverty ka system, par mentality rich,", "timestamp": 122},
    {"lyrics": "Kaam se badlenge game, no time for snitch!", "timestamp": 124},
    {"lyrics": "'Yeh Dharavi ka bhoot, sapne hai tezz,'", "timestamp": 127},
    {"lyrics": "'Ek din name hoga, pura shahar dega craze!'", "timestamp": 129},
    {"lyrics": "Music", "timestamp": 132},
    {"lyrics": "'Yeh Dharavi ka bhoot, sapne hai tezz,'", "timestamp": 151},
    {"lyrics": "'Ek din name hoga, pura shahar dega craze!'", "timestamp": 154},
  ];
  @override
  void initState() {
    super.initState();
    controller = HomePageController();
    // Listen to scroll events to trigger UI rebuilds and check for music playback
    controller.scrollController.addListener(() {
      // Check if music should start playing
      double screenHeight = MediaQuery.of(context).size.height;
      double maxScroll = screenHeight * 0.3;
      double scrollPosition = controller.scrollController.hasClients
          ? controller.scrollController.position.pixels
          : 0;

      if (scrollPosition >= maxScroll && !_hasStartedMusic) {
        controller.playMusicFromPosition(0);
        setState(() {
          _hasStartedMusic = true;
        });
      }

      // Trigger UI rebuild
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double maxScroll = screenHeight * 0.3;
    double scrollPosition = controller.scrollController.hasClients
        ? controller.scrollController.position.pixels
        : 0;

    double headerHeight =
        controller.calculateHeaderHeight(scrollPosition, maxScroll);
    double headerTop =
        controller.calculateHeaderTop(scrollPosition, maxScroll, screenHeight);

    return Scaffold(
      backgroundColor: const Color(0xFFC9C1C1),
      body: Stack(
        children: [
          ListView(
            controller: controller.scrollController,
            children: [
              // Some extra spacing to allow for scrolling
              SizedBox(height: screenHeight * 0.5),

              // Wrap the lyrics container in AnimatedOpacity
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: scrollPosition >= maxScroll ? 1.0 : 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    color: const Color(0xFFC9C1C1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16),
                        ...lyricsData.map((item) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 16.0),
                              child: GestureDetector(
                                onTap: () {
                                  controller.stopMusic();
                                  // Handle the click event
                                  print(item["timestamp"]);
                                  controller
                                      .playMusicFromPosition(item["timestamp"]);
                                  print('Clicked on: ${item["lyrics"]}');
                                },
                                child: Text(
                                  item["lyrics"]!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontFamily: 'Consolas',
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            top: headerTop,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: headerHeight,
                child: Image.asset(
                  'assets/header.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
