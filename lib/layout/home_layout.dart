import 'package:flutter/material.dart';
import 'package:todo_task/screens/settings/settings_tab.dart';
import 'package:todo_task/screens/tasks/add_task_bottom_sheet.dart';
import 'package:todo_task/screens/tasks/tasks_tab.dart';
import 'package:todo_task/shared/styles/colors.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "homeLayout";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;

  List<Widget> tabs = [const TasksTab(), const SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mintGreen,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: MediaQuery.of(context).size.height * .12,
        title: const Text(
          "TO DO LIST",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          elevation: 2,
          onPressed: () {
            showAddTaskBottomSheet();
          },
          child: const Icon(Icons.add, size: 30),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: MediaQuery.of(context).size.height*.107,
        notchMargin: 8,
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: index,
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tasks"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
      body: tabs[index],
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddTAskBottomSheet(),
        );
      },
    );
  }
}
