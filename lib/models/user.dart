import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String imageUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  User({
    required this.email,
    required this.uid,
    required this.imageUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "uid": uid,
      "email": email,
      "imageUrl": imageUrl,
      "bio": bio,
      "followers": followers,
      "following": following,
    };
  }

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot["email"],
      uid: snapshot["uid"],
      imageUrl: snapshot["imageUrl"],
      username: snapshot["username"],
      bio: snapshot["bio"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }
}
