import 'package:app_todo_xd/service/todo_service.dart';
import 'package:app_todo_xd/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';

class AddToDoPage extends StatefulWidget {
  final Map? todo;
  const AddToDoPage({
    super.key,
    this.todo,
  });

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Todo' : 'Add ToDo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          SizedBox(height: 20),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: isEdit ? upDateData : submitData,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                isEdit ? 'Update' : 'Submit',
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> upDateData() async {
    // Get the data from form
    final todo = widget.todo;
    if (todo == null) {
      print("You can not call updated without todo data");
      return;
    }
    final id = todo['_id'];

    // Submit updated data to the server
    final isSuccess = await TodoService.updateTodo(id, body);

    // Show success or fail message based on status
    if (isSuccess) {
      showSuccessMessage(context, message: 'Updated Success');
    } else {
      showErrorMessage(context, message: 'Updated Failed');
    }
  }

  Future<void> submitData() async {
    // Submit data to the server
    final isSuccess = await TodoService.addTodo(body);

    // Show success or fail message based on status
    if (isSuccess) {
      titleController.text = '';
      descriptionController.text = '';
      showSuccessMessage(context, message: 'Create Success');
    } else {
      showErrorMessage(context, message: 'Create Failed');
    }
  }

  Map get body {
    // Get the data from form
    final title = titleController.text;
    final description = descriptionController.text;
    return {
      "title": title,
      "description": description,
      "is_completed": false,
    };
  }
}
