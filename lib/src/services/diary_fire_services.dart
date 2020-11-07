import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meno_app/src/models/diary.dart';

class DiaryFirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get Entries

  Stream<List<Diary>> getEntries() {
    return _db.collection('diary').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Diary.fromJson(doc.data())).toList());
  }

  //Upsert - insert and update

  Future<void> setEntry(Diary entry) {
    var options = SetOptions(merge: true);

    return _db
        .collection('diary')
        .doc(entry.entryId)
        .set(entry.toMap(), options);
  }

  //Delete

  Future<void> removeEntry(String entryId) {
    return _db.collection('diary').doc(entryId).delete();
  }
}
