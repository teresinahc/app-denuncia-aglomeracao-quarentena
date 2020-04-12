parseHorary(DateTime dateToParse) {
  return "${dateToParse.hour.toString().padLeft(2, "0")}:${dateToParse.minute.toString().padLeft(2, "0")} ${dateToParse.hour >= 12 ? "PM" : "AM"}";
}
