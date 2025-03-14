import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final firebase_auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password, String name) async {
    try {
      UserCredential userCredential = await firebase_auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.updateDisplayName(name);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return null;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebase_auth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("Erreur lors de la connection: $e");
      return null;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await firebase_auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print("Erreur lors de la réinitialisation du mot de passe : $e");
      return false;
    }
  }

  Future<void> logout() async {
    await firebase_auth.signOut();
  }

  User? getCurrentUser() {
    return firebase_auth.currentUser;
  }
}
