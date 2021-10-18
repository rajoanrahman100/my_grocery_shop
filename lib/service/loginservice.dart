import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_grocery_shop/model/longinusermodel.dart';

class LogInService{
  LogInService(){
    Firebase.initializeApp();
  }

  late LogInUserModel logInUserModel;

  LogInUserModel get userModel=>logInUserModel;

  //will return boolean type value
  Future<bool> signInWithGoogle()async{
    GoogleSignIn googleSignIn=GoogleSignIn();
    final GoogleSignInAccount? googleUser=await googleSignIn.signIn();

    if(googleUser==null){
      return false;
    }

    //obtain google sign in authentication from request
    final GoogleSignInAuthentication? googleSignInAuthentication=await googleUser.authentication;

    //authentication provider
    final OAuthCredential credential=GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication!.idToken,
      accessToken: googleSignInAuthentication.accessToken
    );

    //Once signed in, return the credential
    UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);

    if(userCredential!= null){
      logInUserModel=LogInUserModel(
        displayName: userCredential.user!.displayName,
        email: userCredential.user!.email,
        photoUrl: userCredential.user!.photoURL
      );
      //collect user info here
    }

    return true;
  }

  void signOut()async{
    await GoogleSignIn().signOut();
    // logInUserModel=null;
  }
}