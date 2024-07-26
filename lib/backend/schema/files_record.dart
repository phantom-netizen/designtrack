import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilesRecord extends FirestoreRecord {
  FilesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "file_title" field.
  String? _fileTitle;
  String get fileTitle => _fileTitle ?? '';
  bool hasFileTitle() => _fileTitle != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "download_url" field.
  String? _downloadUrl;
  String get downloadUrl => _downloadUrl ?? '';
  bool hasDownloadUrl() => _downloadUrl != null;

  // "parent_path" field.
  String? _parentPath;
  String get parentPath => _parentPath ?? '';
  bool hasParentPath() => _parentPath != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "is_deleted_at" field.
  DateTime? _isDeletedAt;
  DateTime? get isDeletedAt => _isDeletedAt;
  bool hasIsDeletedAt() => _isDeletedAt != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "agreement" field.
  bool? _agreement;
  bool get agreement => _agreement ?? false;
  bool hasAgreement() => _agreement != null;

  // "design" field.
  bool? _design;
  bool get design => _design ?? false;
  bool hasDesign() => _design != null;

  // "invoice" field.
  bool? _invoice;
  bool get invoice => _invoice ?? false;
  bool hasInvoice() => _invoice != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _fileTitle = snapshotData['file_title'] as String?;
    _type = snapshotData['type'] as String?;
    _downloadUrl = snapshotData['download_url'] as String?;
    _parentPath = snapshotData['parent_path'] as String?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _isDeletedAt = snapshotData['is_deleted_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _agreement = snapshotData['agreement'] as bool?;
    _design = snapshotData['design'] as bool?;
    _invoice = snapshotData['invoice'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('files');

  static Stream<FilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FilesRecord.fromSnapshot(s));

  static Future<FilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FilesRecord.fromSnapshot(s));

  static FilesRecord fromSnapshot(DocumentSnapshot snapshot) => FilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFilesRecordData({
  DateTime? createdAt,
  String? fileTitle,
  String? type,
  String? downloadUrl,
  String? parentPath,
  bool? isDeleted,
  DateTime? isDeletedAt,
  DocumentReference? userRef,
  bool? agreement,
  bool? design,
  bool? invoice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'file_title': fileTitle,
      'type': type,
      'download_url': downloadUrl,
      'parent_path': parentPath,
      'is_deleted': isDeleted,
      'is_deleted_at': isDeletedAt,
      'user_ref': userRef,
      'agreement': agreement,
      'design': design,
      'invoice': invoice,
    }.withoutNulls,
  );

  return firestoreData;
}

class FilesRecordDocumentEquality implements Equality<FilesRecord> {
  const FilesRecordDocumentEquality();

  @override
  bool equals(FilesRecord? e1, FilesRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.fileTitle == e2?.fileTitle &&
        e1?.type == e2?.type &&
        e1?.downloadUrl == e2?.downloadUrl &&
        e1?.parentPath == e2?.parentPath &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.isDeletedAt == e2?.isDeletedAt &&
        e1?.userRef == e2?.userRef &&
        e1?.agreement == e2?.agreement &&
        e1?.design == e2?.design &&
        e1?.invoice == e2?.invoice;
  }

  @override
  int hash(FilesRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.fileTitle,
        e?.type,
        e?.downloadUrl,
        e?.parentPath,
        e?.isDeleted,
        e?.isDeletedAt,
        e?.userRef,
        e?.agreement,
        e?.design,
        e?.invoice
      ]);

  @override
  bool isValidKey(Object? o) => o is FilesRecord;
}
