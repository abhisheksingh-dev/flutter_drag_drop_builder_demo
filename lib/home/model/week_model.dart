import 'package:dragbuilder_demo/enums.dart';
import 'package:equatable/equatable.dart';

class WeekModel extends Equatable {
  final DateTime date;
  final DayType dayType;
  final List<int> taskIds;

  const WeekModel({
    required this.date,
    required this.dayType,
    required this.taskIds,
  });

  @override
  List<Object?> get props => [date];

  @override
  String toString() =>
      'WeekModel(date: $date, dayType: $dayType, taskIds: $taskIds)';
}
