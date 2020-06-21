import 'package:flutter/material.dart';
import 'package:mobile/model/user.dart';

class NewSponsor extends StatelessWidget {
  final User sponsor;

  NewSponsor(this.sponsor);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('${this.sponsor.firstname[0]}${this.sponsor.lastname[0]}'),
      ),
      title: Row(
        children: <Widget>[
          Text(
            '${this.sponsor.firstname} ${this.sponsor.lastname}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 8,
          ),
          Text('just started sponsoring your block!')
        ],
      ),
      // trailing: PopupMenuButton(
      //   icon: Icon(Icons.more_horiz),
      //   itemBuilder: (_) => <PopupMenuEntry>[
      //     const PopupMenuItem(child:Text(''),value: ,),
      //     const PopupMenuItem(child: null),
      //   ],
      //   onSelected: (newValue) {},
      // ),
    );
  }
}
