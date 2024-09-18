import 'package:flutter/material.dart' as fm;

class MainMenu extends fm.StatefulWidget {
  const MainMenu({super.key});

  @override
  fm.State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends fm.State<MainMenu> {
  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.Scaffold(
      appBar: fm.AppBar(
        title: const fm.Text('RestauranTour'),
      ),
      body: const fm.Center(
        child: fm.Column(
          mainAxisAlignment: fm.MainAxisAlignment.center,
          children: [
            fm.Text(
              'Welcome to RestauranTour!',
            ),
          ],
        ),
      ),
    );
  }
}
