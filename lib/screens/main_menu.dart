import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/app_screen.dart' as screen;

class MainMenu extends fm.StatelessWidget {
  const MainMenu(
    this.onIconPress, {
    super.key,
  });

  final void Function(fm.BuildContext, screen.AppScreen) onIconPress;

  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.Scaffold(
      appBar: fm.AppBar(
        title: const fm.Text('RestauranTour'),
      ),
      body: fm.Center(
        child: fm.Column(
          mainAxisAlignment: fm.MainAxisAlignment.center,
          children: [
            fm.IconButton(
              onPressed: () =>
                  onIconPress(context, screen.AppScreen.restaurantList),
              icon: const fm.Icon(fm.Icons.restaurant),
            ),
            fm.IconButton(
              onPressed: () =>
                  onIconPress(context, screen.AppScreen.restaurantMap),
              icon: const fm.Icon(fm.Icons.map),
            ),
          ],
        ),
      ),
    );
  }
}
