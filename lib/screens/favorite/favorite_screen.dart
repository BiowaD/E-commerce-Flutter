import 'package:flutter/material.dart';
import '../home/custom_bottom_nav_bar.dart';
import '/enums.dart';

import 'body.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = "/favorite";

  const FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
