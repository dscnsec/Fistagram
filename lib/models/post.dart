import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String postUrl;
  final String username;
  final String profImage;
  final String postId;
  final datePublished;
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.postUrl,
    required this.username,
    required this.profImage,
    required this.datePublished,
    required this.likes,
    required this.postId,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "description": description,
        "postUrl": postUrl,
        "profImage": profImage,
        "datePublished": datePublished,
        "likes": likes,
        "postId": postId
      };

  //returns current user information from snapshot
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        username: snapshot['username'],
        profImage: snapshot['profImage'],
        uid: snapshot['uid'],
        description: snapshot['description'],
        postUrl: snapshot['postUrl'],
        datePublished: snapshot['datePublished'],
        likes: snapshot['likes'],
        postId: snapshot['postId']);
  }
}
