import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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

      await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.reload();

      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception('Erro desconhecido: $e');
    }
  }

  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      await userCredential.user?.reload();
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> signOut({
    required Function() onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      await _firebaseAuth.signOut();
      debugPrint('✅ Usuário deslogado com sucesso');
      onSuccess(); // chama callback de sucesso
    } catch (e) {
      debugPrint('❌ Erro ao deslogar: $e');
      onError(e); // chama callback de erro
    }
  }
}
