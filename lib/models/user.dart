class User {
  final String email;
  final String uid;
  final String profileUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  const User({
    required this.email,
    required this.uid,
    required this.profileUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "profileUrl": profileUrl,
        "bio": bio,
        "followers": followers,
        "following": following
      };

}
