import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            const ListTile(
              title: Text('mySnkr', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const Divider(),
            _DrawerItem(title: 'Home', icon: Icons.home),
            _DrawerItem(title: 'About', icon: Icons.info),
            _DrawerItem(title: 'Collection', icon: Icons.grid_view),
            _DrawerItem(title: 'Features', icon: Icons.star),
            const Divider(),
            _DrawerItem(title: 'Loved', icon: Icons.favorite),
            _DrawerItem(title: 'Cart', icon: Icons.shopping_cart),
            _DrawerItem(title: 'Profile', icon: Icons.person),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const _DrawerItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF374151)),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Tutup drawer
        // TODO: Tambahkan navigasi sesuai menu
      },
    );
  }
}