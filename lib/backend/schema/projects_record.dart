import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectsRecord extends FirestoreRecord {
  ProjectsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "users_assigned" field.
  List<DocumentReference>? _usersAssigned;
  List<DocumentReference> get usersAssigned => _usersAssigned ?? const [];
  bool hasUsersAssigned() => _usersAssigned != null;

  // "project_name" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  bool hasProjectName() => _projectName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "number_tasks" field.
  int? _numberTasks;
  int get numberTasks => _numberTasks ?? 0;
  bool hasNumberTasks() => _numberTasks != null;

  // "completed_tasks" field.
  int? _completedTasks;
  int get completedTasks => _completedTasks ?? 0;
  bool hasCompletedTasks() => _completedTasks != null;

  // "last_edited" field.
  DateTime? _lastEdited;
  DateTime? get lastEdited => _lastEdited;
  bool hasLastEdited() => _lastEdited != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "estimated_time" field.
  DateTime? _estimatedTime;
  DateTime? get estimatedTime => _estimatedTime;
  bool hasEstimatedTime() => _estimatedTime != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "projectcompleted" field.
  bool? _projectcompleted;
  bool get projectcompleted => _projectcompleted ?? false;
  bool hasProjectcompleted() => _projectcompleted != null;

  // "projectongoing" field.
  bool? _projectongoing;
  bool get projectongoing => _projectongoing ?? false;
  bool hasProjectongoing() => _projectongoing != null;

  // "projectcancelled" field.
  bool? _projectcancelled;
  bool get projectcancelled => _projectcancelled ?? false;
  bool hasProjectcancelled() => _projectcancelled != null;

  // "tasks" field.
  List<DocumentReference>? _tasks;
  List<DocumentReference> get tasks => _tasks ?? const [];
  bool hasTasks() => _tasks != null;

  // "project_id" field.
  String? _projectId;
  String get projectId => _projectId ?? '';
  bool hasProjectId() => _projectId != null;

  // "is_project" field.
  bool? _isProject;
  bool get isProject => _isProject ?? false;
  bool hasIsProject() => _isProject != null;

  // "is_task" field.
  bool? _isTask;
  bool get isTask => _isTask ?? false;
  bool hasIsTask() => _isTask != null;

  // "is_file" field.
  bool? _isFile;
  bool get isFile => _isFile ?? false;
  bool hasIsFile() => _isFile != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _usersAssigned = getDataList(snapshotData['users_assigned']);
    _projectName = snapshotData['project_name'] as String?;
    _description = snapshotData['description'] as String?;
    _numberTasks = castToType<int>(snapshotData['number_tasks']);
    _completedTasks = castToType<int>(snapshotData['completed_tasks']);
    _lastEdited = snapshotData['last_edited'] as DateTime?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _estimatedTime = snapshotData['estimated_time'] as DateTime?;
    _status = snapshotData['status'] as bool?;
    _projectcompleted = snapshotData['projectcompleted'] as bool?;
    _projectongoing = snapshotData['projectongoing'] as bool?;
    _projectcancelled = snapshotData['projectcancelled'] as bool?;
    _tasks = getDataList(snapshotData['tasks']);
    _projectId = snapshotData['project_id'] as String?;
    _isProject = snapshotData['is_project'] as bool?;
    _isTask = snapshotData['is_task'] as bool?;
    _isFile = snapshotData['is_file'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projects');

  static Stream<ProjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectsRecord.fromSnapshot(s));

  static Future<ProjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectsRecord.fromSnapshot(s));

  static ProjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectsRecordData({
  DocumentReference? owner,
  String? projectName,
  String? description,
  int? numberTasks,
  int? completedTasks,
  DateTime? lastEdited,
  DateTime? timeCreated,
  DateTime? estimatedTime,
  bool? status,
  bool? projectcompleted,
  bool? projectongoing,
  bool? projectcancelled,
  String? projectId,
  bool? isProject,
  bool? isTask,
  bool? isFile,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'project_name': projectName,
      'description': description,
      'number_tasks': numberTasks,
      'completed_tasks': completedTasks,
      'last_edited': lastEdited,
      'time_created': timeCreated,
      'estimated_time': estimatedTime,
      'status': status,
      'projectcompleted': projectcompleted,
      'projectongoing': projectongoing,
      'projectcancelled': projectcancelled,
      'project_id': projectId,
      'is_project': isProject,
      'is_task': isTask,
      'is_file': isFile,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectsRecordDocumentEquality implements Equality<ProjectsRecord> {
  const ProjectsRecordDocumentEquality();

  @override
  bool equals(ProjectsRecord? e1, ProjectsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.owner == e2?.owner &&
        listEquality.equals(e1?.usersAssigned, e2?.usersAssigned) &&
        e1?.projectName == e2?.projectName &&
        e1?.description == e2?.description &&
        e1?.numberTasks == e2?.numberTasks &&
        e1?.completedTasks == e2?.completedTasks &&
        e1?.lastEdited == e2?.lastEdited &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.estimatedTime == e2?.estimatedTime &&
        e1?.status == e2?.status &&
        e1?.projectcompleted == e2?.projectcompleted &&
        e1?.projectongoing == e2?.projectongoing &&
        e1?.projectcancelled == e2?.projectcancelled &&
        listEquality.equals(e1?.tasks, e2?.tasks) &&
        e1?.projectId == e2?.projectId &&
        e1?.isProject == e2?.isProject &&
        e1?.isTask == e2?.isTask &&
        e1?.isFile == e2?.isFile;
  }

  @override
  int hash(ProjectsRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.usersAssigned,
        e?.projectName,
        e?.description,
        e?.numberTasks,
        e?.completedTasks,
        e?.lastEdited,
        e?.timeCreated,
        e?.estimatedTime,
        e?.status,
        e?.projectcompleted,
        e?.projectongoing,
        e?.projectcancelled,
        e?.tasks,
        e?.projectId,
        e?.isProject,
        e?.isTask,
        e?.isFile
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectsRecord;
}
