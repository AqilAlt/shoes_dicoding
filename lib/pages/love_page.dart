import 'package:flutter/material.dart';
import 'package:shoes_dicoding/data/data_shoes.dart';
import 'package:shoes_dicoding/widget/shoes_card.dart';

class LovePage extends StatelessWidget {
  const LovePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 1000;
    final crossAxis = isWide ? 3 : (size.width > 700 ? 2 : 1);

    final lovedSneakers = sneakers.where((s) => s.isLoved).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loved Sneakers'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isWide ? 32.0 : 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sneakers yang kamu suka', style: theme.textTheme.headlineSmall),
              const SizedBox(height: 16),

              Expanded(
                child: lovedSneakers.isEmpty
                    ? const Center(child: Text('Belum ada sneakers yang kamu love.'))
                    : GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxis,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: lovedSneakers.length,
                        itemBuilder: (context, index) {
                          final item = lovedSneakers[index];
                          return SneakerCard(item: item, onTap: () {  },);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}