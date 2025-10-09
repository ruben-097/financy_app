import 'package:firebase_auth/firebase_auth.dart';
//import 'package:test_api/hooks_testing.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUpWithEmail({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (name != null && name.isNotEmpty) {
        await userCredential.user?.updateDisplayName(name);
      }

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      throw Exception('Failed to sign up: ${e.message}');
    } catch (e) {
      // Handle other errors
      throw Exception('An unknown error occurred: $e');
    }
  }

  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      throw Exception('Failed to sign in: ${e.message}');
    } catch (e) {
      // Handle other errors
      throw Exception('An unknown error occurred: $e');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
