import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "timecreated" field.
  DateTime? _timecreated;
  DateTime? get timecreated => _timecreated;
  bool hasTimecreated() => _timecreated != null;

  // "users_assigned" field.
  List<DocumentReference>? _usersAssigned;
  List<DocumentReference> get usersAssigned => _usersAssigned ?? const [];
  bool hasUsersAssigned() => _usersAssigned != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "project_reference" field.
  DocumentReference? _projectReference;
  DocumentReference? get projectReference => _projectReference;
  bool hasProjectReference() => _projectReference != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _completed = snapshotData['completed'] as bool?;
    _timecreated = snapshotData['timecreated'] as DateTime?;
    _usersAssigned = getDataList(snapshotData['users_assigned']);
    _owner = snapshotData['owner'] as DocumentReference?;
    _projectReference = snapshotData['project_reference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? name,
  bool? completed,
  DateTime? timecreated,
  DocumentReference? owner,
  DocumentReference? projectReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'completed': completed,
      'timecreated': timecreated,
      'owner': owner,
      'project_reference': projectReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.completed == e2?.completed &&
        e1?.timecreated == e2?.timecreated &&
        listEquality.equals(e1?.usersAssigned, e2?.usersAssigned) &&
        e1?.owner == e2?.owner &&
        e1?.projectReference == e2?.projectReference;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.name,
        e?.completed,
        e?.timecreated,
        e?.usersAssigned,
        e?.owner,
        e?.projectReference
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
