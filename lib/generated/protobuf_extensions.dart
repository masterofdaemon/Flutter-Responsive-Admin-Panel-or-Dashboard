import 'dart:core' as core;
import 'dart:core'; // Added for direct access to 'dynamic' type
import 'package:protobuf/protobuf.dart';
import 'google/protobuf/struct.pb.dart';
import 'google/protobuf/timestamp.pb.dart';

/// Extension methods to provide missing protobuf functionality
extension ProtobufExtensions on GeneratedMessage {
  void $_clearField(core.int tagNumber) => clearField(tagNumber);

  void $_setField(core.int tagNumber, dynamic value) =>
      setField(tagNumber, value);

  T $_getN<T>(core.int index) => getField(index) as T;

  core.String $_getSZ(core.int index) => getField(index) as core.String;

  core.int $_getIZ(core.int index) => getField(index) as core.int;

  core.bool $_getBF(core.int index) => getField(index) as core.bool;

  core.bool $_has(core.int index) => hasField(index);

  T $_ensure<T>(core.int index) {
    if (!hasField(index)) {
      final type = T;
      if (type == Value) {
        final value = Value();
        setField(index, value);
        return value as T;
      } else if (type == Timestamp) {
        final value = Timestamp();
        setField(index, value);
        return value as T;
      }
    }
    return getField(index) as T;
  }
}
