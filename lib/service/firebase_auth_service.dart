import 'package:firebase_auth/firebase_auth.dart';

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
      rethrow; // relança para ser tratado no SignUpPage
    } catch (e) {
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
      rethrow; // ✅ relança a exceção original
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
