import 'package:flutter/material.dart';
import 'package:google_tasks/data/dummy_data.dart';
class TaskScreen extends StatefulWidget {
  final int index;
  final Function refreshData;
  const TaskScreen({
    super.key,
    required this.index,
    required this.refreshData,
  });
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}
class _TaskScreenState extends State<TaskScreen> {
  String value = "Delete";
  DateTime selecteddate = DateTime.now();
  void handleclick(int value, int index) {
    switch (value) {
      case 0:
        setState(() {
          Navigator.pop(context);
          Future.delayed(const Duration(seconds: 1), () {
            taskdata.removeAt(index);
            widget.refreshData();
          });
        });
        break;
    }
  }
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          primary: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  taskdata[widget.index].star = !taskdata[widget.index].star;
                });
              },
              icon: taskdata[widget.index].star
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border),
            ),
            PopupMenuButton(
              onSelected: (value) => handleclick(value, widget.index),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Text(value),
                ),
              ],
            )
          ],
        ),
        body: Container(
          height: 250,
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller,
                onSubmitted: (value) {
                  setState(() {
                    taskdata[widget.index].title = value;
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: taskdata[widget.index].title,
                ),
                style: taskdata[widget.index].ischecked
                    ? const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 28,
                      )
                    : const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 28,
                      ),
              ),
              TextButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selecteddate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
                  );
                  if (pickedDate != null && pickedDate != selecteddate) {
                    setState(() {
                      selecteddate = pickedDate;
                    });
                  }
                },
                child: SizedBox(
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.alarm),
                      Text(
                          "${selecteddate.day} / ${selecteddate.month} / ${selecteddate.year}"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
