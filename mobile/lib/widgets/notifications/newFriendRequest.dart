import 'package:flutter/material.dart';
import 'package:mobile/model/user.dart';

class NewFriendRequest extends StatelessWidget {
  final User user;

  NewFriendRequest(this.user);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('${this.user.firstname[0]}${this.user.lastname[0]}'),
      ),
      title: Text('${this.user.firstname} ${this.user.lastname}'),
      subtitle: Text('@${this.user.username}'),
    );
  }
}
