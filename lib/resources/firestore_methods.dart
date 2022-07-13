import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fistagram/models/post.dart';
import 'package:fistagram/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String description, Uint8List file, String uid,
      String username, String profImage) async {
    String res = "some error occurred";

    try {
      String photoUrl =
          await StorageMethods().uploadImageStorage('posts', file, true);

      String postId = const Uuid().v1();
      Post post = Post(
          description: description,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profImage,
          likes: []);

      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
