parseDate(DateTime dateToParse) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final aDate = DateTime(dateToParse.year, dateToParse.month, dateToParse.day);

  if (aDate == today) {
    return "Hoje";
  } else if (aDate == yesterday) {
    return "Ontem";
  } else if (aDate == tomorrow) {
    return "Amanhã";
  } else {
    return "${aDate.day.toString().padLeft(2, '0')}/${aDate.month.toString().padLeft(2, '0')}/${aDate.year}";
  }
}
