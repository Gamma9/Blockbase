import 'package:flutter/material.dart';

// Models
import 'package:mobile/model/user.dart';

class UserBio extends StatelessWidget {
  final User user;

  UserBio(this.user);

  void _startEditBio() {
    print('Start edit bio');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 32,
              child: Text(
                '${this.user.firstname[0]}${this.user.lastname[0]}',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '${this.user.firstname} ${this.user.lastname}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '@${this.user.username}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  this.user.completedBlocks.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text('Blocks'),
                SizedBox(
                  width: 8,
                ),
                Text(
                  this.user.dob,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 4,
                ),
                // Text('1st Block')
              ],
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                ),
                child: Text(
                  'Edit',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              onTap: () => _startEditBio(),
            ),
          ],
        ),
      ),
    );
  }
}
