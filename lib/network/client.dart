import 'package:async/async.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = new GoogleSignIn();

//验证是否登录
Future<Null> _ensureLoggedIn() async {
  GoogleSignInAccount user = googleSignIn.currentUser;
  if (user == null)
    user = await googleSignIn.signInSilently();
  if (user == null) {
    await googleSignIn.signIn();
  }
}

//消息是否发送成功
