import 'package:flutter/material.dart';
import 'package:mobile/screens/auth/loginScreen.dart';

class SignupScreen extends StatelessWidget {
  void _navigateToLoginScreen(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return LoginScreen();
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
          Icon(
            Icons.title,
            size: 36,
          ),
          TextField(),
          TextField(),
          Row(
            children: <Widget>[
              Text('Already a member?'),
              GestureDetector(
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
                onTap: () => _navigateToLoginScreen(context),
              )
            ],
          )
        ],
      ),
    );
  }
}
