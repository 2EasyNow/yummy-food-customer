import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseUtils {
  static Future<String> uploadFileOnFirebaseStorage(File file, String filePath, [Function? whenComplete]) async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child(filePath);
    UploadTask uploadingTask = imageRef.putFile(file);
    await uploadingTask.whenComplete(whenComplete != null ? whenComplete() : () {});
    return (await imageRef.getDownloadURL());
  }

  static List<String> createSearchList(String value) {
    List<String> searchList = [];
    for (int i = 0; i < value.length; i++) {
      searchList.add(value.substring(0, i + 1));
    }
    return searchList;
  }
}
