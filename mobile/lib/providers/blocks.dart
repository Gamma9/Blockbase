import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Models
import 'package:mobile/model/block.dart';
import 'package:mobile/model/privateBlock.dart';
import 'package:mobile/model/publicBlock.dart';
import 'package:mobile/model/user.dart';

class Blocks with ChangeNotifier {
  List<Block> blocksList = [
    PublicBlock(
      id: DateTime.now().toString(),
      imageUrl: '',
      title: 'Mavericks Marvel',
      description: '500,000 retweets about Dallas Mavericks',
      owner: 'Mark Cuban',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.sports,
      reward: 5000,
      type: Type.online,
      status: Status.active,
      usersList: [
        User(
          id: DateTime.now().toString(),
          imageUrl: '',
          firstname: 'Cameron',
          lastname: 'Gamble',
          username: 'Gamma9',
        )
      ],
    ),
    PublicBlock(
      id: DateTime.now().toString(),
      imageUrl: '',
      title: 'FB Friends Frenzy',
      description: 'Gain 5,000 Facebook friends within 2 hours',
      owner: 'Mark Zuckerburg',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.random,
      type: Type.online,
      reward: 4556,
      status: Status.active,
      usersList: [],
    ),
    PublicBlock(
      id: DateTime.now().toString(),
      imageUrl: '',
      title: 'Don\'t FW Cats',
      description: '500,000 favorites on a tweet about cats',
      owner: 'Twitter Co.',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.random,
      type: Type.online,
      reward: 467,
      status: Status.active,
      usersList: [],
    ),
    PublicBlock(
      id: DateTime.now().toString(),
      imageUrl: '',
      title: 'Coding Circuit',
      description: 'Hold a successful lesson about computer science',
      owner: 'LISD',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.educational,
      reward: 65,
      type: Type.offline,
      status: Status.active,
      usersList: [],
    ),
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
    ),
  ];

  // Get Blocks List
  List<Block> get getBlocks {
    return [...this.blocksList];
  }
}
