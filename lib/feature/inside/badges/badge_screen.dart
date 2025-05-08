import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as base;
import 'package:to_do_app/app/components/default_app_bar.dart';
import 'package:to_do_app/app/provider/badge_provider.dart';

@RoutePage()
class BadgeScreen extends StatelessWidget {
  const BadgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Your Badges',
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
      body: base.Consumer<BadgeProvider>(
        builder: (context, badgeProvider, child) {
          final achievements = badgeProvider.taskAchievements;

          if (achievements.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.emoji_events, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No achievements yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children:
                    achievements.map((achievement) {
                      final Color baseColor =
                          achievement.isCompleted
                              ? Colors.blueAccent
                              : Colors.grey.shade300;

                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color:
                              achievement.isCompleted
                                  ? baseColor.withOpacity(0.15)
                                  : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color:
                                achievement.isCompleted
                                    ? baseColor
                                    : Colors.grey.shade300,
                            width: 1.5,
                          ),
                          boxShadow: [
                            if (achievement.isCompleted)
                              BoxShadow(
                                color: baseColor.withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    achievement.isCompleted
                                        ? baseColor.withOpacity(0.8)
                                        : Colors.grey.shade300,
                              ),
                              child: Center(
                                child: Icon(
                                  achievement.isCompleted
                                      ? Icons.check_circle
                                      : Icons.emoji_events_outlined,
                                  color:
                                      achievement.isCompleted
                                          ? Colors.white
                                          : Colors.grey.shade600,
                                  size: 30,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    achievement.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    achievement.description,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.diamond,
                                      color: Colors.blueAccent,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      achievement.rewardCrystals.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
