import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // Other authentication functions...

  // Create a user profile in Firestore
  Future<void> createUserProfile(
      String uid, String firstName, String lastName) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'firstName': firstName,
        'lastName': lastName,
      });
    } catch (e) {
      print('Error creating user profile: $e');
    }
  }

  Future<UserCredential> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      createUserProfile(result.user?.uid ?? "", firstNameController.text,
          lastNameController.text);
      return result;
      // Get.snackbar('Success', 'Sign up successful');
    } catch (e) {
      rethrow;
    }
  }

  // Sign In with Email and Password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print('Error during login: $e');
      rethrow;
    }
  }
}
