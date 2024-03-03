import 'package:flutter/material.dart';
import 'package:google_tasks/data/dummy_data.dart';
import 'package:google_tasks/screens/task_screen.dart';
import 'package:google_tasks/widget/style/font.dart';
class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
    required this.index,
    required this.refreshData,
  });
  final int index;
  final Function refreshData;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}
class _TaskWidgetState extends State<TaskWidget> {
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskScreen(
                index: widget.index,
                refreshData: widget.refreshData,
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  taskdata[widget.index].ischecked =
                      !taskdata[widget.index].ischecked;
                });
              },
              icon: taskdata[widget.index].ischecked
                  ? const Icon(Icons.check_box)
                  : const Icon(Icons.check_box_outline_blank),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                taskdata[widget.index].title,
                style: taskdata[widget.index].ischecked
                    ? TextStyle(
                        fontSize: Font().homescreentext,
                        decoration: TextDecoration.lineThrough,
                      )
                    : TextStyle(
                        fontSize: Font().homescreentext,
                        decoration: TextDecoration.none),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
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
          ],
        ),
      ),
    );
  }
}
