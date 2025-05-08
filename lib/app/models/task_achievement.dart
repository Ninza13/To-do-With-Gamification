class TaskAchievement {
  final String title;
  final String description;
  final int requiredTasks;
  final int rewardCrystals;
  final bool isCompleted;

  TaskAchievement({
    required this.title,
    required this.description,
    required this.requiredTasks,
    required this.rewardCrystals,
    this.isCompleted = false,
  });

  TaskAchievement copyWith({
    String? title,
    String? description,
    int? requiredTasks,
    int? rewardCrystals,
    bool? isCompleted,
  }) {
    return TaskAchievement(
      title: title ?? this.title,
      description: description ?? this.description,
      requiredTasks: requiredTasks ?? this.requiredTasks,
      rewardCrystals: rewardCrystals ?? this.rewardCrystals,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
