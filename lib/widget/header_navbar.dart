import 'package:flutter/material.dart';

class HeaderNavbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onOpenLoved;
  const HeaderNavbar({super.key, this.onOpenLoved});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      titleSpacing: 24,
      title: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Versi mobile
            return Row(
              children: [
                const Text(
                  'mySnkr',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),
              ],
            );
          } else {
            // Versi desktop/laptop
            return Row(
              children: [
                const Text(
                  'mySnkr',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF111827),
                  ),
                ),
                const Spacer(),
                _NavItem(title: 'Home'),
                _NavItem(title: 'About'),
                _NavItem(title: 'Collection'),
                _NavItem(title: 'Features'),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.favorite_outline, color: Color(0xFF111827)),
                  tooltip: 'Loved',
                  onPressed: onOpenLoved,
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined, color: Color(0xFF111827)),
                  tooltip: 'Cart',
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline, color: Color(0xFF111827)),
                  tooltip: 'Profile',
                  onPressed: () {},
                ),
              ],
            );
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _NavItem extends StatelessWidget {
  final String title;
  const _NavItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF374151),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}