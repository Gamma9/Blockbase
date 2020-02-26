import 'package:flutter/material.dart';
import 'package:mobile/model/user.dart';

class CurrentUsersList extends StatelessWidget {
  final List<User> _currentUsersList;

  CurrentUsersList(this._currentUsersList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                  '${this._currentUsersList[index].firstname[0]}${this._currentUsersList[index].lastname[0]}'),
            ),
            title: Text(
              '${this._currentUsersList[index].firstname} ${this._currentUsersList[index].lastname}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('@${this._currentUsersList[index].username}'),
          );
        },
        itemCount: this._currentUsersList.length,
      ),
    );
  }
}
