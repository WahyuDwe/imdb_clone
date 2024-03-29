import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdb_clone/app/ui/screens/main/home/home_screen.dart';
import 'package:imdb_clone/app/ui/screens/main/main_screen_view_model.dart';
import 'package:imdb_clone/app/ui/screens/main/profile/profile_screen.dart';
import 'package:imdb_clone/app/ui/screens/main/search/search_screen.dart';
import 'package:imdb_clone/app/ui/screens/main/video/video_screen.dart';
import 'package:imdb_clone/app/ui/screens/main/widgets/navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.viewModel,
    super.key,
  });

  final MainScreenViewModel viewModel;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomeScreen(),
          SearchScreen(),
          VideoScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBarWidget(
        pageController: _pageController,
      ),
    );
  }
}
