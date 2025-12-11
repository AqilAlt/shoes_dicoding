import 'package:flutter/material.dart';
import 'package:shoes_dicoding/model/shoes.dart';

class SneakerCard extends StatelessWidget {
  final Sneaker item;
  final VoidCallback? onTap;
  const SneakerCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: item.isAsset
                    ? Image.asset(item.image, fit: BoxFit.cover, width: double.infinity)
                    : Image.network(item.image, fit: BoxFit.cover, width: double.infinity),
              ),
            ),

            // Info
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$${item.price.toStringAsFixed(0)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF2563EB),
                        fontSize: 16,
                      )),
                  const SizedBox(height: 4),
                  Text(item.name,
                      style: theme.textTheme.titleMedium?.copyWith(fontSize: 15)),
                  const SizedBox(height: 2),
                  Text(item.brand,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 13,
                        color: const Color(0xFF6B7280),
                      )),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),

            // Loved icon
            if (item.isLoved)
              const Padding(
                padding: EdgeInsets.only(right: 12.0, bottom: 8),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.favorite, color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}