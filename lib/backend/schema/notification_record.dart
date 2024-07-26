import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "project_id" field.
  DocumentReference? _projectId;
  DocumentReference? get projectId => _projectId;
  bool hasProjectId() => _projectId != null;

  // "task_id" field.
  DocumentReference? _taskId;
  DocumentReference? get taskId => _taskId;
  bool hasTaskId() => _taskId != null;

  // "file_id" field.
  DocumentReference? _fileId;
  DocumentReference? get fileId => _fileId;
  bool hasFileId() => _fileId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _projectId = snapshotData['project_id'] as DocumentReference?;
    _taskId = snapshotData['task_id'] as DocumentReference?;
    _fileId = snapshotData['file_id'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _action = snapshotData['action'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DocumentReference? userId,
  DocumentReference? projectId,
  DocumentReference? taskId,
  DocumentReference? fileId,
  DateTime? timestamp,
  String? type,
  String? action,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'project_id': projectId,
      'task_id': taskId,
      'file_id': fileId,
      'timestamp': timestamp,
      'type': type,
      'action': action,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.projectId == e2?.projectId &&
        e1?.taskId == e2?.taskId &&
        e1?.fileId == e2?.fileId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.type == e2?.type &&
        e1?.action == e2?.action;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.projectId,
        e?.taskId,
        e?.fileId,
        e?.timestamp,
        e?.type,
        e?.action
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
