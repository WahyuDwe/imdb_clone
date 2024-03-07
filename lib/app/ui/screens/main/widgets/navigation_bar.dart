import 'package:flutter/material.dart';
import 'package:imdb_localization/strings.g.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentPageIndex,
      onDestinationSelected: (index) {
        // widget.pageController.jumpToPage(index);
        widget.pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        setState(() {
          currentPageIndex = index;
        });
      },
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home),
          label: context.t.main.tabs.home,
        ),
        NavigationDestination(
          icon: const Icon(Icons.search),
          label: context.t.main.tabs.search,
        ),
        NavigationDestination(
          icon: const Icon(Icons.movie_creation_rounded),
          label: context.t.main.tabs.video,
        ),
        NavigationDestination(
          icon: const Icon(Icons.person_pin),
          label: context.t.main.tabs.profile,
        ),
      ],
    );
  }
}
