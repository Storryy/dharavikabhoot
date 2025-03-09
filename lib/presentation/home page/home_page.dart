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
                      children: group
                          .map((lyric) => GestureDetector(
                                onTap: () async {
                                  await controller.stopMusic();
                                  controller.playMusicFromPosition(
                                      lyric["timestamp"]);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    lyric["lyrics"]!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontFamily: 'Consolas',
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                );
              }).toList(),

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
        ],
      ),
    );
  }
}
