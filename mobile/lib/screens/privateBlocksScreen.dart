import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/providers/privateBlocks.dart';

// Providers
import 'package:provider/provider.dart';

// Models
import 'package:mobile/model/block.dart';
import 'package:mobile/model/privateBlock.dart';
import 'package:mobile/model/user.dart';

// Widgets
import 'package:mobile/widgets/misc/noPrivateBlocks.dart';
import 'package:mobile/widgets/privateBlocks/privateBlocksList.dart';
import 'package:mobile/widgets/userBio.dart';

class PrivateBlocksScreen extends StatelessWidget {
  final user = User(
    id: DateTime.now().toString(),
    imageUrl: '',
    firstname: 'Cameron',
    lastname: 'Gamble',
    username: 'Gamma9',
    dob: DateFormat.yMMMd().format(DateTime.now()),
    initialBlock: null,
    privateBlocksList: [
      PrivateBlock(
        id: DateTime.now().toString(),
        imageUrl: '',
        description: 'Visit Stamford Bridge',
        title: 'Chelsea Dream',
        owner: 'Gamma9',
        date: DateFormat.yMMMd().format(DateTime.now()),
        status: Status.active,
        watchList: [
          User(
            firstname: 'Cameron',
            lastname: 'Gamble',
            username: 'Gamma9',
          ),
        ],
      ),
      PrivateBlock(
        id: DateTime.now().toString(),
        imageUrl: '',
        description: 'Live in Japan for at least 2 years',
        title: 'Konnichiwa',
        owner: 'Gamma9',
        date: DateFormat.yMMMd().format(DateTime.now()),
        status: Status.active,
        watchList: [],
      ),
      PrivateBlock(
        id: DateTime.now().toString(),
        imageUrl: '',
        description: 'Leave behind an empire',
        title: 'My entrepreunership dream',
        owner: 'Gamma9',
        date: DateFormat.yMMMd().format(DateTime.now()),
        status: Status.completed,
        watchList: [],
      ),
      PrivateBlock(
        id: DateTime.now().toString(),
        imageUrl: '',
        description: 'Go get it',
        title: 'Create a successful application',
        owner: 'Gamma9',
        date: DateFormat.yMMMd().format(DateTime.now()),
        status: Status.expired,
        watchList: [],
      )
    ],
    completedBlocks: 0,
  );

  @override
  Widget build(BuildContext context) {
    final privateBlocksProvider = Provider.of<PrivateBlocks>(context);
    final privateBlocksList = privateBlocksProvider.privateBlocksList;
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
