import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as base;
import 'package:to_do_app/app/components/default_app_bar.dart';
import 'package:to_do_app/app/provider/badge_provider.dart';
import 'package:to_do_app/ui/constants/images.dart';

@RoutePage()
class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'What can you buy it',
        centerTitle: true,
        actions: [
          base.Consumer<BadgeProvider>(
            builder: (context, badgeProvider, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.diamond, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(
                      badgeProvider.crystals.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          _ShopItem(
            title: 'Premium Theme',
            description: 'Unlock beautiful premium themes',
            price: 100,
            icon: Icons.palette,
            onPurchase: () {
              // Handle purchase
            },
          ),
          _ShopItem(
            title: 'Custom Icons',
            description: 'Get access to custom icons',
            price: 50,
            icon: Icons.emoji_emotions,
            onPurchase: () {
              // Handle purchase
            },
          ),
          _ShopItem(
            title: 'Priority Support',
            description: 'Get priority support for 1 month',
            price: 200,
            icon: Icons.support_agent,
            onPurchase: () {
              // Handle purchase
            },
          ),
        ],
      ),
    );
  }
}

Color getRandomPastelColor() {
  final Random random = Random();
  int red = (random.nextInt(156) + 100); // 100–255
  int green = (random.nextInt(156) + 100);
  int blue = (random.nextInt(156) + 100);
  return Color.fromRGBO(red, green, blue, 1);
}

extension ColorExtension on Color {
  Color darken([double amount = .1]) {
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}

class _ShopItem extends StatelessWidget {
  const _ShopItem({
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
    required this.onPurchase,
  });

  final String title;
  final String description;
  final int price;
  final IconData icon;
  final VoidCallback onPurchase;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color baseColor = getRandomPastelColor();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [baseColor.withOpacity(0.9), baseColor.withOpacity(0.6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: baseColor.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.3),
            ),
            padding: const EdgeInsets.all(12),
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              Text(
                '$price 💎',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              base.Consumer<BadgeProvider>(
                builder: (context, badgeProvider, _) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: baseColor.darken(),
                      minimumSize: const Size(70, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed:
                        badgeProvider.crystals >= price
                            ? () {
                              badgeProvider.spendCrystals(price);
                              onPurchase();
                            }
                            : null,
                    child: const Text('Buy', style: TextStyle(fontSize: 12)),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
