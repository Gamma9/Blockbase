import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Models
import 'package:mobile/model/privateBlock.dart';
import 'package:mobile/model/user.dart';

// Widgets
import 'package:mobile/widgets/misc/noPrivateBlocks.dart';
import 'package:mobile/widgets/privateBlocks/privateBlocksList.dart';
import 'package:mobile/widgets/userBio.dart';

class PrivateBlocksScreen extends StatelessWidget {
  final user = User(
    id: DateTime.now().toString(),
    firstname: 'Cameron',
    lastname: 'Gamble',
    username: 'Gamma9',
    dob: DateFormat.yMMMd().format(DateTime.now()),
    initialBlock: null,
    privateBlocksList: [
      PrivateBlock(
        id: DateTime.now().toString(),
        title: 'Visit Stamford Bridge',
        owner: 'Gamma9',
        date: DateFormat.yMMMd().format(DateTime.now()),
        status: Status.active,
      ),
      PrivateBlock(
        id: DateTime.now().toString(),
        title: 'Live in Japan for at least 2 years',
        owner: 'Gamma9',
        date: DateFormat.yMMMd().format(DateTime.now()),
        status: Status.active,
      ),
      PrivateBlock(
        id: DateTime.now().toString(),
        title: 'Leave behind an empire',
        owner: 'Gamma9',
        date: DateFormat.yMMMd().format(DateTime.now()),
        status: Status.completed,
      ),
      PrivateBlock(
        id: DateTime.now().toString(),
        title: 'Leave behind an empire',
        owner: 'Gamma9',
        date: DateFormat.yMMMd().format(DateTime.now()),
        status: Status.expired,
      ),
    ],
    completedBlocks: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: <Widget>[
          UserBio(this.user),
          this.user.privateBlocksList.length <= 0
              ? NoPrivateBlocks()
              : PrivateBlocksList(this.user.privateBlocksList)
        ],
      ),
    );
  }
}
