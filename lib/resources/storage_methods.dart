import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/v4.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(
    String childName,
    Uint8List file,
    bool isPost,
  ) async {
    Reference storageRef = _storage
        .ref()
        .child(childName)
        .child(_auth.currentUser!.uid);

    if (isPost) {
      String id = UuidV4().generate();
      storageRef = storageRef.child(id);
    }
    UploadTask uploadTask = storageRef.putData(file);
    TaskSnapshot snap = await uploadTask;
    String imageUrl = await snap.ref.getDownloadURL();
    return imageUrl;
  }
}
