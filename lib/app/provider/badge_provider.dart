import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/app/models/badge.dart' as app_badge;
import 'package:to_do_app/app/models/todo.dart';
import 'package:to_do_app/app/provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

class BadgeProvider extends BaseProvider {
  BadgeProvider() {
    _loadBadges();
  }

  final List<app_badge.Badge> _badges = [];
  List<app_badge.Badge> get badges => _badges;

  int _crystals = 0;
  int get crystals => _crystals;

  void addCrystals(int amount) {
    _crystals += amount;
    notifyListeners();
  }

  void completeBadge(String badgeId) {
    final badgeIndex = _badges.indexWhere((badge) => badge.id == badgeId);
    if (badgeIndex != -1 && !_badges[badgeIndex].isCompleted) {
      _badges[badgeIndex] = _badges[badgeIndex].copyWith(isCompleted: true);
      addCrystals(_badges[badgeIndex].rewardCrystals);
      notifyListeners();
    }
  }

  void checkAndUpdateBadges({
    required int totalTasks,
    required int completedTasks,
    required DateTime completionTime,
  }) {
    // First Step badge
    if (totalTasks >= 1) {
      completeBadge('first_task');
    }

    // Task Master badge
    if (totalTasks >= 10) {
      completeBadge('task_master');
    }

    // Completionist badge
    if (completedTasks >= 5) {
      completeBadge('completionist');
    }

    // Early Bird badge
    if (completionTime.hour < 9) {
      completeBadge('early_bird');
    }

    // Night Owl badge
    if (completionTime.hour >= 22) {
      completeBadge('night_owl');
    }

    // Crystal Collector badge
    if (_crystals >= 100) {
      completeBadge('crystal_collector');
    }
  }

  Future<void> _loadBadges() async {
    // Load badges from storage or initialize with predefined badges
    _badges.addAll(app_badge.Badge.getPredefinedBadges());
    notifyListeners();
  }

  Future<void> _saveBadges() async {
    // Save badges to storage
  }

  Future<void> checkBadgeProgress(List<Todo> todos) async {
    // Check Task Master badge
    final completedTasks = todos.where((todo) => todo.isCompleted).length;
    try {
      final taskMasterBadge = _badges.firstWhere(
        (badge) => badge.title == 'Task Master',
      );

      if (completedTasks >= taskMasterBadge.requiredCount &&
          !taskMasterBadge.isCompleted) {
        final index = _badges.indexOf(taskMasterBadge);
        _badges[index] = taskMasterBadge.copyWith(isCompleted: true);
        _crystals += taskMasterBadge.rewardCrystals;
        await _saveBadges();
        notifyListeners();
      }
    } catch (e) {
      print('Task Master badge not found or error: $e');
    }

    // Check Task Collector badge
    try {
      final taskCollectorBadge = _badges.firstWhere(
        (badge) => badge.title == 'Task Collector',
      );

      if (todos.length >= taskCollectorBadge.requiredCount &&
          !taskCollectorBadge.isCompleted) {
        final index = _badges.indexOf(taskCollectorBadge);
        _badges[index] = taskCollectorBadge.copyWith(isCompleted: true);
        _crystals += taskCollectorBadge.rewardCrystals;
        await _saveBadges();
        notifyListeners();
      }
    } catch (e) {
      print('Task Collector badge not found or error: $e');
    }

    // Check Early Bird badge
    try {
      final earlyBirdBadge = _badges.firstWhere(
        (badge) => badge.title == 'Early Bird',
      );

      final earlyMorningTasks =
          todos.where((todo) {
            final hour = todo.createdAt.hour;
            return todo.isCompleted && hour < 9;
          }).length;

      if (earlyMorningTasks >= earlyBirdBadge.requiredCount &&
          !earlyBirdBadge.isCompleted) {
        final index = _badges.indexOf(earlyBirdBadge);
        _badges[index] = earlyBirdBadge.copyWith(isCompleted: true);
        _crystals += earlyBirdBadge.rewardCrystals;
        await _saveBadges();
        notifyListeners();
      }
    } catch (e) {
      print('Early Bird badge not found or error: $e');
    }

    // Check Streak Master badge
    try {
      final streakMasterBadge = _badges.firstWhere(
        (badge) => badge.title == 'Streak Master',
      );

      // Group completed tasks by date
      final completedTasksByDate = <DateTime, int>{};
      for (final todo in todos.where((t) => t.isCompleted)) {
        final date = DateTime(
          todo.createdAt.year,
          todo.createdAt.month,
          todo.createdAt.day,
        );
        completedTasksByDate[date] = (completedTasksByDate[date] ?? 0) + 1;
      }

      // Check for 7 consecutive days
      final dates = completedTasksByDate.keys.toList()..sort();
      int currentStreak = 0;
      int maxStreak = 0;

      for (int i = 0; i < dates.length - 1; i++) {
        final currentDate = dates[i];
        final nextDate = dates[i + 1];
        final difference = nextDate.difference(currentDate).inDays;

        if (difference == 1) {
          currentStreak++;
          maxStreak = currentStreak > maxStreak ? currentStreak : maxStreak;
        } else {
          currentStreak = 0;
        }
      }

      if (maxStreak >= streakMasterBadge.requiredCount &&
          !streakMasterBadge.isCompleted) {
        final index = _badges.indexOf(streakMasterBadge);
        _badges[index] = streakMasterBadge.copyWith(isCompleted: true);
        _crystals += streakMasterBadge.rewardCrystals;
        await _saveBadges();
        notifyListeners();
      }
    } catch (e) {
      print('Streak Master badge not found or error: $e');
    }
  }

  Future<void> spendCrystals(int amount) async {
    if (_crystals >= amount) {
      _crystals -= amount;
      await _saveBadges();
      notifyListeners();
    }
  }

  @override
  Widget wrapChild(Widget child) {
    return BadgeProviderScope(provider: this, child: child);
  }
}

class BadgeProviderScope extends InheritedWidget {
  const BadgeProviderScope({
    required this.provider,
    required super.child,
    super.key,
  });

  final BadgeProvider provider;

  static BadgeProvider of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<BadgeProviderScope>();
    assert(scope != null, 'No BadgeProviderScope found in context');
    return scope!.provider;
  }

  @override
  bool updateShouldNotify(BadgeProviderScope oldWidget) => false;
}
