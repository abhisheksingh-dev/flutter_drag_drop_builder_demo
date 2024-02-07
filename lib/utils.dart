import 'package:dragbuilder_demo/enums.dart';
import 'package:dragbuilder_demo/home/model/week_model.dart';

class Utils {
  static String returnStringMonth(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  static String returnDate(DateTime date) =>
      '${date.day}th ${returnStringMonth(date.month).substring(0, 3).toUpperCase()}';

  static bool checkIfWeekEnd(DateTime date) =>
      date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;

  static List<WeekModel> returnNextWeekDates({required DateTime from}) {
    List<WeekModel> dates = [];
    for (int i = 0; i < 7; i++) {
      var date = from.add(Duration(days: i));
      dates.add(
        WeekModel(
          date: date,
          dayType: checkIfWeekEnd(date) ? DayType.holiday : DayType.weekday,
          taskIds: [],
        ),
      );
    }
    return dates;
  }
}
