import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as base;
import 'package:to_do_app/app/components/default_app_bar.dart';
import 'package:to_do_app/app/provider/todo_provider.dart';
import 'package:to_do_app/app/router/router.gr.dart';
import 'package:to_do_app/common/colors.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "Hi!, Welcome, Ziya"),
      body: base.Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          final todos = todoProvider.todos;

          if (todos.isEmpty) {
            return const Center(child: Text('No todos yet. Add one!'));
          }

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:
                        todo.isCompleted
                            ? AppColors.black100
                            : AppColors.gray100,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: AppColors.black100,
                        activeColor: AppColors.gray100,
                        value: todo.isCompleted,
                        onChanged: (value) {
                          todoProvider.toggleTodoStatus(todo.id, context);
                        },
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              todo.title,
                              style: TextStyle(
                                color:
                                    todo.isCompleted
                                        ? AppColors.white
                                        : AppColors.black100,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              todo.description,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.gray300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.goldPrimary,
                        ),
                        onPressed: () {
                          context.pushRoute(TaskCreatetionRoute(todo: todo));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () {
                          todoProvider.removeTodo(todo.id, context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


/*
Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (value) {
                        todoProvider.toggleTodoStatus(todo.id, context);
                      },
                    ),
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration:
                            todo.isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                      ),
                    ),
                    subtitle: Text(todo.description),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        context.router.push(TaskCreatetionRoute(todo: todo));
                      },
                    ),
                  ),
                ),
*/