import 'package:dharavikabhoot/presentation/home%20page/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late HomePageController controller;

  @override
  void initState() {
    super.initState();
    controller = HomePageController();
    controller.scrollController.addListener(() {
      double screenHeight = MediaQuery.of(context).size.height;
      // Delegate scroll logic to the controller
      controller.handleScroll(screenHeight);
      // Trigger UI update for animations
      setState(() {});
    });

    // Add listener for audio position updates
    controller.highlightedLyricStream.stream.listen((highlightedIndex) {
      // Force UI update when highlighted lyric changes
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
    // Calculate if header animation is complete
    bool isHeaderAnimationComplete = scrollPosition >= maxScroll;

    return Scaffold(
      backgroundColor: const Color(0xFFC9C1C1),
      body: Stack(
        children: [
          // The scrollable area with all content
          ListView(
            controller: controller.scrollController,
            children: [
              // Initial space for header animation
              SizedBox(height: screenHeight * 0.5),
              // Empty container that only becomes visible after header animation completes
              // This ensures we can scroll past the header
              Container(
                height: isHeaderAnimationComplete ? 0 : screenHeight * 0.5,
              ),
              // Verse groups - each taking up a full screen height
              ...controller.lyricGroups.asMap().entries.map((entry) {
                List<Map<String, dynamic>> group = entry.value;
                return Container(
                  height: screenHeight -
                      headerHeight -
                      40, // Full screen minus header and padding
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: group.map((lyric) {
                        // Find the index of this lyric in the original lyricsData
                        int lyricIndex = controller.lyricsData.indexWhere(
                            (item) =>
                                item["lyrics"] == lyric["lyrics"] &&
                                item["timestamp"] == lyric["timestamp"]);

                        // Check if this lyric is currently highlighted
                        bool isHighlighted =
                            controller.currentLyricIndex == lyricIndex;

                        ValueNotifier<bool> isHovered = ValueNotifier(false);
                        return MouseRegion(
                          onEnter: (_) => isHovered.value = true,
                          onExit: (_) => isHovered.value = false,
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () async {
                              await controller.stopMusic();
                              controller
                                  .playMusicFromPosition(lyric["timestamp"]);
                            },
                            child: ValueListenableBuilder<bool>(
                              valueListenable: isHovered,
                              builder: (context, hovered, child) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    decoration: BoxDecoration(
                                      color: isHighlighted
                                          ? Colors.blue.withOpacity(0.3)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      lyric["lyrics"]!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Consolas',
                                        fontSize: (lyric.containsKey("type") &&
                                                    lyric["type"] ==
                                                        "clickable") &&
                                                (hovered || isHighlighted)
                                            ? 40
                                            : 30,
                                        fontWeight:
                                            ((lyric.containsKey("type") &&
                                                        lyric["type"] ==
                                                            "clickable") ||
                                                    isHighlighted)
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                        fontStyle: (lyric.containsKey("type") &&
                                                lyric["type"] == "clickable")
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
              // Add extra space at the end to ensure scrolling works for the last verse
              SizedBox(height: 100),
            ],
          ),
          // Header animation (stays at top after animation)
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
          // Optional: Display current timestamp for debugging
          if (isHeaderAnimationComplete && controller.isPlaying)
            Positioned(
              top: headerHeight + 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: StreamBuilder<double>(
                  stream: controller.timestampStream.stream,
                  initialData: 0.0,
                  builder: (context, snapshot) {
                    return Text(
                      "Time: ${snapshot.data?.toStringAsFixed(1)}s",
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
