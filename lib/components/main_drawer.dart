import 'package:flutter/material.dart';
import 'package:meals/utils/routes/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  Widget _createItem(IconData icon, String label, void Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              color: Theme.of(context).colorScheme.secondary,
              child: const Text(
                'Vamos cozinhar?',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            _createItem(
              Icons.restaurant,
              'Refeições',
              () => Navigator.of(context).pushNamed(AppRoutes.home_page),
            ),
            _createItem(
              Icons.settings,
              'Configurações',
              () => Navigator.of(context).pushNamed(AppRoutes.settings_page),
            ),
          ],
        ),
      ),
    );
  }
}
