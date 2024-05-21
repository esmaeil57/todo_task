import 'package:flutter/material.dart';
import 'package:todo_task/models/task_model.dart';
import 'package:todo_task/shared/network/firebase/firebase_manager.dart';
import 'package:todo_task/shared/styles/colors.dart';

class AddTAskBottomSheet extends StatefulWidget {
  const AddTAskBottomSheet({super.key});

  @override
  State<AddTAskBottomSheet> createState() => _AddTAskBottomSheetState();
}

class _AddTAskBottomSheetState extends State<AddTAskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Add New Task",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              label: const Text("Task Title"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: primary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: primary,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              label: const Text("Task Description"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: primary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: primary,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            "Select Date",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 9),
          InkWell(
            onTap: () {
              selectDate();
            },
            child: Text(
              selectedDate.toString().substring(0, 10),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          ElevatedButton(
              onPressed: () {
                TaskModel task = TaskModel(title:titleController.text,
                    description: descriptionController.text,
                    date: selectedDate.millisecondsSinceEpoch) ;
                FirebaseManager.addTasks(task).then((value){
                  Navigator.pop(context);
                });
              },
              child: const Text(
                "Add Task",
              )),
        ],
      ),
    );
  }

  selectDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (chosenDate == null) return;
    selectedDate = chosenDate;
    setState(() {});
  }
}
