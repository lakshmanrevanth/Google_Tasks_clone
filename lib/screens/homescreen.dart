import 'package:flutter/material.dart';
import 'package:google_tasks/data/dummy_data.dart';
import 'package:google_tasks/widget/bottom_widget.dart';
import 'package:google_tasks/widget/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void refreshData() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
            const Duration(milliseconds: 50),
          );
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: taskdata.length,
            itemBuilder: (context, index) {
              return TaskWidget(
                index: index,
                refreshData: refreshData,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: BottomContainer(ontaskadded: () {
                  setState(() {});
                }),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
