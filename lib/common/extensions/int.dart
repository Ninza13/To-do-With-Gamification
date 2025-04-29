import 'dart:math';

extension IntExtensions on int {
  String format() {
    const numericSuffixes = ['K', 'M', 'B', 'T'];

    if (this < 1000) {
      return toString();
    }

    final exp = (log(this) / log(1000)).floor();
    final suffix = numericSuffixes[exp - 1];
    final formattedValue = (this / pow(1000, exp)).round();

    return formattedValue.toString() + suffix;
  }

  String toDateString() {
    String getMonthName(int month) {
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return months[month - 1];
    }

    String formatMonthDay(DateTime date) {
      final month = getMonthName(date.month);
      return '$month ${date.day}';
    }

    final inputDate = DateTime.fromMillisecondsSinceEpoch(this);
    final now = DateTime.now();

    final difference = now.difference(inputDate);

    if (difference.inHours < 12) {
      return '${difference.inHours} hrs ago';
    } else if (inputDate.year == now.year) {
      return formatMonthDay(inputDate);
    } else {
      return '${inputDate.day} ${getMonthName(inputDate.month)} ${inputDate.year}';
    }
  }
}
