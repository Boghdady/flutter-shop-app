import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop_app/authentication/firebase_auth.dart';

class FirebaseAuthTest extends StatefulWidget {
  @override
  _FirebaseAuthTestState createState() => _FirebaseAuthTestState();
}

class _FirebaseAuthTestState extends State<FirebaseAuthTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Test'),
        centerTitle: true,
      ),
      body: SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  FirebaseAuthentication _firebaseAuthentication = FirebaseAuthentication();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firebaseAuthentication.getCurrentUser();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 24.0,
          top: MediaQuery.of(context).size.height * 0.25,
          right: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            RaisedButton(
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;

                FirebaseUser user =
                    await _firebaseAuthentication.register(email, password);
                print(user);
              },
              child: Text('Register'),
            ),
            SizedBox(
              height: 8.0,
            ),
            RaisedButton(
              onPressed: () async {
                _firebaseAuthentication.signOut();
              },
              child: Text('Signout'),
            ),
            SizedBox(
              height: 8.0,
            ),
            RaisedButton(
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;

                FirebaseUser user =
                    await _firebaseAuthentication.signIn(email, password);
                print(user);
              },
              child: Text('Signin'),
            ),
          ],
        ),
      ),
    );
  }
}
