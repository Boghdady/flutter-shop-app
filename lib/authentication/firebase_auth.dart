import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> register(String email, String password) async {
    AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult.user;
  }

  Future<FirebaseUser> signIn(String email, String password) async {
    AuthResult authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return authResult.user;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    print('user : $user');
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    print('Signout successfully');
  }
}
