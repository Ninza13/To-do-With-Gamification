import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart' as provider;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/app/models/todo.dart';
import 'package:to_do_app/app/provider/badge_provider.dart';
import 'package:to_do_app/app/provider/provider.dart';
import 'package:uuid/uuid.dart';

class TodoProvider extends BaseProvider {
  TodoProvider() {
    _loadTodos();
  }

  final List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  // Private methods
  Future<void> _loadTodos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = prefs.getString('todos');
      if (todosJson != null) {
        final List<dynamic> todosList = json.decode(todosJson);
        _todos.clear();
        _todos.addAll(todosList.map((todo) => Todo.fromJson(todo)));
        notifyListeners();
      }
    } catch (e) {
      print('Error loading todos: $e');
    }
  }

  Future<void> _saveTodos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = json.encode(
        _todos.map((todo) => todo.toJson()).toList(),
      );
      await prefs.setString('todos', todosJson);
    } catch (e) {
      print('Error saving todos: $e');
    }
  }

  Future<void> _checkBadges(BuildContext context) async {
    try {
      final badgeProvider = provider.Provider.of<BadgeProvider>(
        context,
        listen: false,
      );
      await badgeProvider.checkBadgeProgress(_todos);
    } catch (e) {
      print('Error checking badges: $e');
    }
  }

  // Public methods
  Future<void> addTodo(String title, String description) async {
    try {
      final todo = Todo(
        id: const Uuid().v4(),
        title: title,
        description: description,
        isCompleted: false,
        createdAt: DateTime.now(),
      );
      _todos.add(todo);
      await _saveTodos();
      notifyListeners();
    } catch (e) {
      print('Error adding todo: $e');
      rethrow;
    }
  }

  Future<void> removeTodo(String id, BuildContext context) async {
    try {
      _todos.removeWhere((todo) => todo.id == id);
      await _saveTodos();
      notifyListeners();
      await _checkBadges(context);
    } catch (e) {
      print('Error removing todo: $e');
      rethrow;
    }
  }

  Future<void> updateTodo(Todo updatedTodo) async {
    try {
      final index = _todos.indexWhere((todo) => todo.id == updatedTodo.id);
      if (index != -1) {
        _todos[index] = updatedTodo;
        await _saveTodos();
        notifyListeners();
      }
    } catch (e) {
      print('Error updating todo: $e');
      rethrow;
    }
  }

  Future<void> toggleTodoStatus(String id, BuildContext context) async {
    try {
      final index = _todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        _todos[index] = _todos[index].copyWith(
          isCompleted: !_todos[index].isCompleted,
        );
        await _saveTodos();
        notifyListeners();
        await _checkBadges(context);
      }
    } catch (e) {
      print('Error toggling todo status: $e');
      rethrow;
    }
  }

  // Helper methods
  List<Todo> getCompletedTodos() {
    return _todos.where((todo) => todo.isCompleted).toList();
  }

  List<Todo> getPendingTodos() {
    return _todos.where((todo) => !todo.isCompleted).toList();
  }

  int getCompletedCount() {
    return _todos.where((todo) => todo.isCompleted).length;
  }

  int getTotalCount() {
    return _todos.length;
  }

  @override
  Widget wrapChild(Widget child) {
    return TodoProviderScope(provider: this, child: child);
  }
}

class TodoProviderScope extends InheritedWidget {
  const TodoProviderScope({
    required this.provider,
    required super.child,
    super.key,
  });

  final TodoProvider provider;

  static TodoProvider of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<TodoProviderScope>();
    assert(scope != null, 'No TodoProviderScope found in context');
    return scope!.provider;
  }

  @override
  bool updateShouldNotify(TodoProviderScope oldWidget) => false;
}
