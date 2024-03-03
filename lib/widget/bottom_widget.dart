import 'package:flutter/material.dart';
import 'package:google_tasks/data/dummy_data.dart';
import 'package:google_tasks/model/tasks.dart';

class BottomContainer extends StatefulWidget {
  final VoidCallback? ontaskadded;
  BottomContainer({
    super.key,
    required this.ontaskadded,
  });
  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  bool isstar = false;
  DateTime selecteddate = DateTime.now();
  final DateTime datetime = DateTime.now();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).colorScheme.background,
      ),
      padding: EdgeInsets.all(15),
      height: 260,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter a new task',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${selecteddate.day} / ${selecteddate.month} / ${selecteddate.year}",
                style: const TextStyle(
                  fontSize: 19,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.subtitles),
              ),
              IconButton(
                onPressed: () async {
                  final DateTime? dateTime = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025));
                  if (dateTime != null) {
                    setState(() {
                      selecteddate = dateTime;
                    });
                  }
                },
                icon: const Icon(Icons.alarm_add),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (isstar) {
                      isstar = false;
                    } else if (!isstar) {
                      isstar = true;
                    }
                  });
                },
                icon: isstar ? Icon(Icons.star) : Icon(Icons.star_border),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  taskdata.add(TasksModel(
                    id: selecteddate.toString(),
                    title: controller.text,
                    subtitle: "",
                    star: isstar,
                    ischecked: false,
                  ));
                  if (widget.ontaskadded != null) {
                    widget.ontaskadded!();
                  }
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              )
            ],
          )
        ],
      ),
    );
  }
}
