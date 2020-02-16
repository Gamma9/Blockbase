import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Models
import 'package:mobile/model/publicBlock.dart';
import 'package:mobile/widgets/misc/noPublicBlocks.dart';
import 'package:mobile/widgets/publicBlocks/publicBlocksList.dart';

class PublicBlocksScreen extends StatelessWidget {
  final List<PublicBlock> _publicBlocksList = [
    PublicBlock(
      id: DateTime.now().toString(),
      title: '500,000 retweets about Dallas Mavericks',
      owner: 'Mark Cuban',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.sports,
      reward: 5000,
      type: Type.online,
      status: Status.active,
    ),
    PublicBlock(
      id: DateTime.now().toString(),
      title: 'Gain 5,000 Facebook friends within 2 hours',
      owner: 'Mark Zuckerburg',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.random,
      type: Type.online,
      reward: 4556,
      status: Status.active,
    ),
    PublicBlock(
      id: DateTime.now().toString(),
      title: '500,000 favorites on a tweet about cats',
      owner: 'Twitter Co.',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.random,
      type: Type.online,
      reward: 467,
      status: Status.active,
    ),
    PublicBlock(
      id: DateTime.now().toString(),
      title: 'Hold a successful lesson about computer science',
      owner: 'LISD',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.educational,
      reward: 65,
      type: Type.offline,
      status: Status.active,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return this._publicBlocksList.length <= 0
        ? NoPublicBlocks()
        : PublicBlocksList(this._publicBlocksList);
  }
}
