import 'package:intl/intl.dart';
import 'package:admin/generated/google/protobuf/timestamp.pb.dart' as pb;
import 'package:fixnum/fixnum.dart';

/// Converts a protobuf Timestamp to a formatted date string (e.g. '2025-05-06 14:30')
String formatTimestamp(pb.Timestamp? ts, {String format = 'yyyy-MM-dd HH:mm'}) {
  if (ts == null || ts.seconds == Int64(0)) return '-';
  final date = DateTime.fromMillisecondsSinceEpoch(ts.seconds.toInt() * 1000,
          isUtc: true)
      .toLocal();
  return DateFormat(format).format(date);
}

/// Converts a DateTime to a protobuf Timestamp
pb.Timestamp dateTimeToTimestamp(DateTime dateTime) {
  return pb.Timestamp()
    ..seconds = Int64(dateTime.toUtc().millisecondsSinceEpoch ~/ 1000)
    ..nanos = ((dateTime.toUtc().microsecondsSinceEpoch % 1000000) * 1000);
}

/// Formats a DateTime as a string (e.g. '2025-05-06')
String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
  return DateFormat(format).format(date);
}
