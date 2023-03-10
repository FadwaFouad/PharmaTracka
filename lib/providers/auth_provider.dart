import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  final FirebaseAuth firebaseAuth;
  //FirebaseAuth instance
  AuthProvider(this.firebaseAuth);
  //Constuctor to initalize the FirebaseAuth instance

  //Using Stream to listen to Authentication State
  Stream<User?> get authState => firebaseAuth.idTokenChanges();
  User? get curruentUser => firebaseAuth.currentUser;

  //............RUDIMENTARY METHODS FOR AUTHENTICATION................

  //SIGN UP METHOD
  Future<String?> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      print(name);
      UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      // update name
      User? user = result.user;
      print(user?.email);
      print(user?.displayName);
      await user?.updateDisplayName(name);
      await user?.reload();
      User? latestUser = FirebaseAuth.instance.currentUser;
      print(latestUser?.displayName);
      return "Signed";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future<bool?> signIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    print('signout start');
    await firebaseAuth.signOut();
    print('signout finish');
  }
}
