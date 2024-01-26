import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Image.asset(
          "images/logo.png",
        ),
        toolbarHeight: 60.0,
        title: const Center(
          child: Text(
            "DISASTER MANAGEMENT INCIDENT ASSESSMENT",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              //TODO hook up
              child: Selection(
                onTap1: () => navigateToPage(0),
                onTap2: () => navigateToPage(1),
                onTap3: () => navigateToPage(2),
                onTap4: () => navigateToPage(3),
                onTap5: () => navigateToPage(4),
                onTap6: () => navigateToPage(5),
                onTap7: () => navigateToPage(6),
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
                    changer: (index) {
                      setState(() {
                        visit = index;
                        (context as Element).markNeedsBuild();
                      });
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
