import 'package:flashcard/core/routes/links.dart';
import 'package:flashcard/core/routes/navigator.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Add Langauge'),
            onTap: () {
              AppRoute.toRoute(AppLink.addLanguage);
            },
          ),
          ListTile(
            title: const Text('Add Card'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
