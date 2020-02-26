import 'package:flutter/material.dart';

// Models
import 'package:mobile/model/user.dart';

class SponsorGridItem extends StatelessWidget {
  final User user;

  SponsorGridItem(this.user);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Container(
        color: Colors.black54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.person),
            Text('User name'),
            Icon(Icons.star),
          ],
        ),
      ),
      child: Container(
        child: Center(
          child: Text('User pic'),
        ),
      ),
    );
  }
}
