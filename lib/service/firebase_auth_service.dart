import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<User?> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Atualiza o displayName e recarrega o usuário
      await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.reload();

      // Retorna o usuário ATUALIZADO
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      rethrow;
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

      // Recarrega os dados do usuário para garantir que vem o displayName
      await userCredential.user?.reload();
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
