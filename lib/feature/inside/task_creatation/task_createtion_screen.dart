import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as base;
import 'package:to_do_app/app/models/todo.dart';
import 'package:to_do_app/app/provider/todo_provider.dart';
import 'package:to_do_app/common/colors.dart';

@RoutePage()
class TaskCreatetionScreen extends StatefulWidget {
  const TaskCreatetionScreen({super.key, this.todo});

  final Todo? todo;

  @override
  State<TaskCreatetionScreen> createState() => _TaskCreatetionScreenState();
}

class _TaskCreatetionScreenState extends State<TaskCreatetionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _titleController.text = widget.todo!.title;
      _descriptionController.text = widget.todo!.description;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        validator:
                            (value) =>
                                value == null || value.isEmpty
                                    ? 'Please enter a title'
                                    : null,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _descriptionController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        validator:
                            (value) =>
                                value == null || value.isEmpty
                                    ? 'Please enter a description'
                                    : null,
                      ),
                    ),
                    const SizedBox(height: 30),
                    base.Consumer<TodoProvider>(
                      builder: (context, todoProvider, child) {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: AppColors.orange200,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final navigator = context.router;
                                try {
                                  if (widget.todo == null) {
                                    await todoProvider.addTodo(
                                      _titleController.text,
                                      _descriptionController.text,
                                    );
                                  } else {
                                    await todoProvider.updateTodo(
                                      widget.todo!.copyWith(
                                        title: _titleController.text,
                                        description:
                                            _descriptionController.text,
                                      ),
                                    );
                                  }
                                  if (mounted) {
                                    navigator.back();
                                  }
                                } catch (e) {
                                  if (mounted) {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Error: $e')),
                                    );
                                  }
                                }
                              }
                            },
                            child: Text(
                              widget.todo == null ? 'Add Task' : 'Update Task',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
