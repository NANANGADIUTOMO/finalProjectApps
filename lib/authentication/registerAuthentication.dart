import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUser {
  static Future<User?> registerUser({
    required String name,
    required String email,
    required String password,
    required String date,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'password salah') {
        print('the password provider is to weak');
      } else if (e.code == 'email-already-in0use') {
        print('the account is already');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
