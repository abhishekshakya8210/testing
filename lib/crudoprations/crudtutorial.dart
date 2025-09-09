import 'package:cloud_firestore/cloud_firestore.dart';

class CrudTutorial {
  final CollectionReference obj =
      FirebaseFirestore.instance.collection('Successfull');

  /// Add new document in Firestore
  Future<void> create({
    required String name,
    required String age,
    required String address,
  }) async {
    try {
      await obj.add({
        "NameAttribute": name,
        "AgeAttribute": age,
        "AddressAttribute": address,
        "CreatedAt": FieldValue.serverTimestamp(), // extra (for sorting)
      });
      print("✅ Data added successfully!");
    } catch (e) {
      print("❌ Error while adding data: $e");
    }
  }


  ////Reading
  
Stream<QuerySnapshot> reading() {
  return obj.snapshots();
}

// update
Future<void> updateData({
  required String id,
  required String name,
  required String age,
  required String address,
}) {
  return obj.doc(id).update({
    "NameAttribute": name,
    "AgeAttribute": age,
    "AddressAttribute": address,
  });
}


/// DELETE
/// 
/// 
   Future<void> Delete(String id){
    return obj.doc(id).delete();
   }
}
