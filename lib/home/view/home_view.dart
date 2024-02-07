import 'package:dragbuilder_demo/home/model/week_model.dart';
import 'package:dragbuilder_demo/home/widget/calender_card.dart';
import 'package:dragbuilder_demo/utils.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static DateTime currentDate = DateTime.now();
  static List<WeekModel> weekDays =
      Utils.returnNextWeekDates(from: currentDate);
  static List<int> tasks = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Week Planner',
          style: const TextStyle().copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: weekDays.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  WeekModel weekModel = weekDays[index];
                  return CalenderCard(
                    weekModel: weekModel,
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Incomplete Tasks',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Draggable<int>(
                      data: tasks[index],
                      feedback: Material(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black.withOpacity(0.1),
                          ),
                          child: ListTile(
                            title: Text('Task ${tasks[index]}'),
                            trailing: const Icon(Icons.drag_handle),
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade200,
                        ),
                        child: ListTile(
                          title: Text('Task ${tasks[index]}'),
                          trailing: const Icon(Icons.drag_handle),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
