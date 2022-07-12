import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String profilePicUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  const User({
    required this.email,
    required this.uid,
    required this.profilePicUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "profilePicUrl": profilePicUrl,
        "bio": bio,
        "followers": followers,
        "following": following
      };

  //returns current user information from snapshot
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      bio: snapshot['bio'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      profilePicUrl: snapshot['profilePicUrl'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
