import 'package:flutter/material.dart';

class Badge {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final int requiredCount;
  final int rewardCrystals;
  bool isCompleted;

  Badge({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.requiredCount,
    required this.rewardCrystals,
    this.isCompleted = false,
  });

  static List<Badge> getPredefinedBadges() {
    return [
      Badge(
        id: 'first_task',
        title: 'First Step',
        description: 'Create your first task',
        icon: Icons.flag,
        requiredCount: 1,
        rewardCrystals: 10,
      ),
      Badge(
        id: 'task_master',
        title: 'Task Master',
        description: 'Create 10 tasks',
        icon: Icons.task_alt,
        requiredCount: 10,
        rewardCrystals: 20,
      ),
      Badge(
        id: 'completionist',
        title: 'Completionist',
        description: 'Complete 5 tasks',
        icon: Icons.check_circle,
        requiredCount: 5,
        rewardCrystals: 15,
      ),
      Badge(
        id: 'early_bird',
        title: 'Early Bird',
        description: 'Complete a task before 9 AM',
        icon: Icons.wb_sunny,
        requiredCount: 1,
        rewardCrystals: 10,
      ),
      Badge(
        id: 'night_owl',
        title: 'Night Owl',
        description: 'Complete a task after 10 PM',
        icon: Icons.nightlight_round,
        requiredCount: 1,
        rewardCrystals: 10,
      ),
      Badge(
        id: 'streak_master',
        title: 'Streak Master',
        description: 'Complete tasks for 3 days in a row',
        icon: Icons.local_fire_department,
        requiredCount: 3,
        rewardCrystals: 25,
      ),
      Badge(
        id: 'weekend_warrior',
        title: 'Weekend Warrior',
        description: 'Complete tasks on both weekend days',
        icon: Icons.weekend,
        requiredCount: 2,
        rewardCrystals: 20,
      ),
      Badge(
        id: 'crystal_collector',
        title: 'Crystal Collector',
        description: 'Earn 100 crystals',
        icon: Icons.diamond,
        requiredCount: 100,
        rewardCrystals: 50,
      ),
      Badge(
        id: 'productivity_guru',
        title: 'Productivity Guru',
        description: 'Complete 20 tasks in a week',
        icon: Icons.rocket_launch,
        requiredCount: 20,
        rewardCrystals: 30,
      ),
    ];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'requiredCount': requiredCount,
      'rewardCrystals': rewardCrystals,
      'isCompleted': isCompleted,
      'icon': icon,
    };
  }

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      icon: json['icon'],
      requiredCount: json['requiredCount'],
      rewardCrystals: json['rewardCrystals'],
      isCompleted: json['isCompleted'],
    );
  }

  Badge copyWith({
    String? id,
    String? title,
    String? description,
    IconData? icon,
    int? requiredCount,
    int? rewardCrystals,
    bool? isCompleted,
  }) {
    return Badge(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      requiredCount: requiredCount ?? this.requiredCount,
      rewardCrystals: rewardCrystals ?? this.rewardCrystals,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
