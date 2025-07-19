import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khulekani_app/classes/alert.dart';
import 'selection.dart';
import 'view.dart';

class WorldView extends StatefulWidget {
  const WorldView({super.key});

  @override
  State<WorldView> createState() => _WorldViewState();
}

class _WorldViewState extends State<WorldView> {
  int visit = 0;
  final PageController controller = PageController();
  bool canChange = true;

  void navigateToPage(int pageIndex) {
    setState(() {
      visit = pageIndex;
      controller.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 900;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Hero(
          tag: "love",
          child: Image.asset(
            "images/logo.png",
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: IconButton(
              onPressed: () {
                if (visit > 0) {
                  navigateToPage(visit - 1);
                }
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 35.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Text(
                '${visit + 1}/12', // Update total if needed
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: IconButton(
              onPressed: () {
                if (visit < 11) {
                  navigateToPage(visit + 1);
                }
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 35.0,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
          //   child: IconButton(
          //     onPressed: () {
          //       const title = "Close App ?";

          //       AlertPop().alertExit(context, title, () {
          //         SystemNavigator.pop();
          //       });
          //     },
          //     icon: const Icon(
          //       Icons.power_settings_new_rounded,
          //       color: Colors.red,
          //       size: 35.0,
          //     ),
          //   ),
          // ),
        ],
        toolbarHeight: 60.0,
        title: const Center(
          child: Text(
            "DMI",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: isSmallScreen
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                //   child: Selection(
                //     onTap1: () => navigateToPage(0),
                //     color1: visit == 0 ? Colors.grey[300] : Colors.grey[100],
                //     onTap2: () => navigateToPage(1),
                //     color2: visit == 1 ? Colors.grey[300] : Colors.grey[100],
                //     onTap3: () => navigateToPage(2),
                //     color3: visit == 2 ? Colors.grey[300] : Colors.grey[100],
                //     onTap4: () => navigateToPage(3),
                //     color4: visit == 3 ? Colors.grey[300] : Colors.grey[100],
                //     onTap5: () => navigateToPage(4),
                //     color5: visit == 4 ? Colors.grey[300] : Colors.grey[100],
                //     onTap6: () => navigateToPage(5),
                //     color6: visit == 5 ? Colors.grey[300] : Colors.grey[100],
                //     onTap7: () => navigateToPage(6),
                //     color7: visit == 6 ? Colors.grey[300] : Colors.grey[100],
                //     onTap8: () => navigateToPage(7),
                //     color8: visit == 7 ? Colors.grey[300] : Colors.grey[100],
                //     onTap9: () => navigateToPage(8),
                //     color9: visit == 8 ? Colors.grey[300] : Colors.grey[100],
                //     onTap10: () => navigateToPage(9),
                //     color10: visit == 9 ? Colors.grey[300] : Colors.grey[100],
                //     onTap11: () => navigateToPage(10),
                //     color11:
                //         visit == 10 ? Colors.grey[300] : Colors.grey[100],
                //     onTap12: () => navigateToPage(11),
                //     color12:
                //         visit == 11 ? Colors.grey[300] : Colors.grey[100],
                //   ),
                // ),
                Expanded(
                  child: Container(
                      color: Colors.grey[50],
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        //TODO hook up
                        child: Viewx(
                          controller: controller,
                          changer: (int pageIndex) {
                            setState(() {
                              visit = pageIndex;
                              (context as Element).markNeedsBuild();
                            });
                          },
                        ),
                      )),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    //TODO hook up
                    // Colors.grey[100],

                    child: Selection(
                      onTap1: () => navigateToPage(0),
                      color1: visit == 0 ? Colors.grey[300] : Colors.grey[100],
                      onTap2: () => navigateToPage(1),
                      color2: visit == 1 ? Colors.grey[300] : Colors.grey[100],
                      onTap3: () => navigateToPage(2),
                      color3: visit == 2 ? Colors.grey[300] : Colors.grey[100],
                      onTap4: () => navigateToPage(3),
                      color4: visit == 3 ? Colors.grey[300] : Colors.grey[100],
                      onTap5: () => navigateToPage(4),
                      color5: visit == 4 ? Colors.grey[300] : Colors.grey[100],
                      onTap6: () => navigateToPage(5),
                      color6: visit == 5 ? Colors.grey[300] : Colors.grey[100],
                      onTap7: () => navigateToPage(6),
                      color7: visit == 6 ? Colors.grey[300] : Colors.grey[100],
                      onTap8: () => navigateToPage(7),
                      color8: visit == 7 ? Colors.grey[300] : Colors.grey[100],
                      onTap9: () => navigateToPage(8),
                      color9: visit == 8 ? Colors.grey[300] : Colors.grey[100],
                      onTap10: () => navigateToPage(9),
                      color10: visit == 9 ? Colors.grey[300] : Colors.grey[100],
                      onTap11: () => navigateToPage(10),
                      color11:
                          visit == 10 ? Colors.grey[300] : Colors.grey[100],
                      onTap12: () => navigateToPage(11),
                      color12:
                          visit == 11 ? Colors.grey[300] : Colors.grey[100],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.grey[50],
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      //TODO hook up
                      child: Viewx(
                        controller: controller,
                        changer: (int pageIndex) {
                          setState(() {
                            visit = pageIndex;
                            (context as Element).markNeedsBuild();
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
