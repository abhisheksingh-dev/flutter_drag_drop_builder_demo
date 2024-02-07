import 'package:dragbuilder_demo/home/model/week_model.dart';
import 'package:dragbuilder_demo/utils.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';

class CalenderCard extends StatelessWidget {
  const CalenderCard({super.key, required this.weekModel});
  final WeekModel weekModel;

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      onAccept: (int data) {
        weekModel.taskIds.add(data);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: weekModel.dayType == DayType.weekday
                ? Colors.transparent
                : Colors.red,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: weekModel.dayType == DayType.weekday
                  ? Colors.black
                  : Colors.red,
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Text(
                  Utils.returnDate(weekModel.date),
                  style: const TextStyle().copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: weekModel.dayType == DayType.weekday
                    ? RichText(
                        text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Tasks:     ',
                            style: const TextStyle().copyWith(
                              color: weekModel.dayType == DayType.weekday
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: weekModel.taskIds.length.toString(),
                            style: const TextStyle().copyWith(
                              color: weekModel.dayType == DayType.weekday
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 36,
                            ),
                          ),
                        ],
                      ))
                    : Text(
                        'Holiday',
                        style: const TextStyle().copyWith(
                          color: weekModel.dayType == DayType.weekday
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
