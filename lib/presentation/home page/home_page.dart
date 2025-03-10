import 'package:flutter/material.dart';
import 'package:dharavikabhoot/presentation/home%20page/home_controller.dart';
import 'package:dharavikabhoot/split%20screen/split_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late HomePageController controller;
  final ValueNotifier<String> currentHintText = ValueNotifier<String>('');

  // State variables
  bool isSplitScreen = false;
  Widget? rightSideContent;

  @override
  void initState() {
    super.initState();
    controller = HomePageController();

    controller.scrollController.addListener(() {
      double screenHeight = MediaQuery.of(context).size.height;
      controller.handleScroll(screenHeight);
      setState(() {});
    });

    controller.highlightedLyricStream.stream.listen((highlightedIndex) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    currentHintText.dispose();
    controller.dispose();
    super.dispose();
  }

  void openSplitScreen(Widget newContent) {
    setState(() {
      isSplitScreen = true;
      rightSideContent = newContent;
    });
  }

  void closeSplitScreen() {
    setState(() {
      isSplitScreen = false;
      rightSideContent = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double maxScroll = screenHeight * 0.3;
    double scrollPosition = controller.scrollController.hasClients
        ? controller.scrollController.position.pixels
        : 0;
    double headerHeight =
        controller.calculateHeaderHeight(scrollPosition, maxScroll);
    double headerTop =
        controller.calculateHeaderTop(scrollPosition, maxScroll, screenHeight);
    bool isHeaderAnimationComplete = scrollPosition >= maxScroll;

    return Scaffold(
      backgroundColor: const Color(0xFFC9C1C1),
      body: Row(
        children: [
          // Left side: Main Content
          Expanded(
            flex: isSplitScreen ? 1 : 2,
            child: Stack(
              children: [
                ListView(
                  controller: controller.scrollController,
                  children: [
                    SizedBox(height: screenHeight * 0.5),
                    Container(
                      height:
                          isHeaderAnimationComplete ? 0 : screenHeight * 0.5,
                    ),
                    ...controller.lyricGroups.asMap().entries.map((entry) {
                      List<Map<String, dynamic>> group = entry.value;
                      return Container(
                        height: 500,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: group.map((lyric) {
                              int lyricIndex = controller.lyricsData.indexWhere(
                                  (item) =>
                                      item["lyrics"] == lyric["lyrics"] &&
                                      item["timestamp"] == lyric["timestamp"]);

                              bool isHighlighted =
                                  controller.currentLyricIndex == lyricIndex;
                              bool isClickable = lyric.containsKey("type") &&
                                  lyric["type"] == "clickable";

                              ValueNotifier<bool> isHovered =
                                  ValueNotifier(false);

                              return MouseRegion(
                                onEnter: (_) {
                                  isHovered.value = true;
                                  if (isClickable) {
                                    currentHintText.value = "walk the lanes";
                                  }
                                },
                                onExit: (_) {
                                  isHovered.value = false;
                                  if (isClickable) {
                                    currentHintText.value = '';
                                  }
                                },
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    if (isClickable) {
                                      print(lyric["number"]);
                                      openSplitScreen(SplitScreen(
                                          lyricsNumber: lyric["number"]));
                                    }
                                    controller.playMusicFromPosition(
                                        lyric["timestamp"]);
                                  },
                                  child: ValueListenableBuilder<bool>(
                                    valueListenable: isHovered,
                                    builder: (context, hovered, child) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          decoration: BoxDecoration(
                                            color: isHighlighted
                                                ? Colors.blue.withOpacity(0.3)
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            lyric["lyrics"]!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Consolas',
                                              fontSize: isClickable &&
                                                      (hovered || isHighlighted)
                                                  ? 40
                                                  : 30,
                                              fontWeight:
                                                  (isClickable || isHighlighted)
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                              fontStyle: isClickable
                                                  ? FontStyle.italic
                                                  : FontStyle.normal,
                                              color: isHighlighted
                                                  ? Colors.blue.shade700
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 100),
                  ],
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 100),
                  top: headerTop,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: AnimatedContainer(
                      width: double.infinity,
                      color: const Color(0xFFC9C1C1),
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
          ),

          // Right side: Split Screen Content (Only when a lyric is clicked)
          if (isSplitScreen)
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xFFC9C1C1),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.close, size: 30),
                        onPressed: closeSplitScreen,
                      ),
                    ),
                    Expanded(child: rightSideContent ?? Container()),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
