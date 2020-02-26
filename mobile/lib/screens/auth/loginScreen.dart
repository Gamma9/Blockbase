import 'package:flutter/material.dart';
import 'package:mobile/screens/auth/signupScreen.dart';

class LoginScreen extends StatelessWidget {
  void _navigateToSignupScreen(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return SignupScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blockbase'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Icon(Icons.title),
          TextField(),
          TextField(),
          Row(
            children: <Widget>[
              Text('Not a member?'),
              GestureDetector(
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
                onTap: () => _navigateToSignupScreen(context),
              )
            ],
          )
        ],
      ),
    );
  }
}
