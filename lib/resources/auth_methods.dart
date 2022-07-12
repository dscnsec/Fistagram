import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fistagram/resources/storage_methods.dart';
import 'package:flutter/material.dart';
import 'package:fistagram/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    //this User is from firebase auth and not model user
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('user').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file.isNotEmpty) {
        //register user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print("user uid" + credential.user!.uid);

        String profilePicUrl = await StorageMethods()
            .uploadImageStorage('profilePics', file, false);

        //add usr to our database
        model.User user = model.User(
            username: username,
            uid: credential.user!.uid,
            email: email,
            bio: bio,
            followers: [],
            following: [],
            profilePicUrl: profilePicUrl);

        _firestore
            .collection('user')
            .doc(credential.user!.uid)
            .set(user.toJson());

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
