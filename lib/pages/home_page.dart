import 'package:flutter/material.dart';
import 'package:shoes_dicoding/data/data_shoes.dart';
import 'package:shoes_dicoding/pages/shoes_detail_page.dart';
import 'package:shoes_dicoding/widget/shoes_card.dart';
import '../widget/header_navbar.dart';
import '../widget/app_drawer.dart';
import 'love_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';
  final TextEditingController _searchController = TextEditingController();

  List filteredSneakers() {
    if (query.isEmpty) return sneakers;
    final q = query.toLowerCase();
    return sneakers.where((s) =>
        s.name.toLowerCase().contains(q) ||
        s.brand.toLowerCase().contains(q) ||
        s.price.toString().contains(q)
    ).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 1000;
    final crossAxis = isWide ? 3 : (size.width > 700 ? 2 : 1);

    final items = filteredSneakers();

    return Scaffold(
      // Navbar responsif
      appBar: HeaderNavbar(
        onOpenLoved: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const LovePage()));
        },
      ),

      // Drawer menu untuk mobile
      drawer: const AppDrawer(),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isWide ? 32.0 : 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Row(
                children: [
                  Text('2022 Collection', style: theme.textTheme.headlineSmall),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 16),

              // Search bar
              TextField(
                controller: _searchController,
                onChanged: (val) => setState(() => query = val),
                decoration: InputDecoration(
                  hintText: 'Search by name, brand, or price...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => query = '');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Grid sneakers
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxis,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return SneakerCard(
                      item: item,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SneakerDetailPage(sneaker: item),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Loved button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const LovePage()));
        },
        icon: const Icon(Icons.favorite),
        label: const Text('Loved'),
      ),
    );
  }
}