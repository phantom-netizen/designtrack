import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDetailsRecord extends FirestoreRecord {
  UserDetailsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "client" field.
  bool? _client;
  bool get client => _client ?? false;
  bool hasClient() => _client != null;

  // "designer" field.
  bool? _designer;
  bool get designer => _designer ?? false;
  bool hasDesigner() => _designer != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _client = snapshotData['client'] as bool?;
    _designer = snapshotData['designer'] as bool?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userDetails');

  static Stream<UserDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDetailsRecord.fromSnapshot(s));

  static Future<UserDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDetailsRecord.fromSnapshot(s));

  static UserDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserDetailsRecordData({
  bool? client,
  bool? designer,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'client': client,
      'designer': designer,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDetailsRecordDocumentEquality implements Equality<UserDetailsRecord> {
  const UserDetailsRecordDocumentEquality();

  @override
  bool equals(UserDetailsRecord? e1, UserDetailsRecord? e2) {
    return e1?.client == e2?.client &&
        e1?.designer == e2?.designer &&
        e1?.email == e2?.email;
  }

  @override
  int hash(UserDetailsRecord? e) =>
      const ListEquality().hash([e?.client, e?.designer, e?.email]);

  @override
  bool isValidKey(Object? o) => o is UserDetailsRecord;
}
