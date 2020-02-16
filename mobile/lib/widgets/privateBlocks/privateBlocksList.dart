import 'package:flutter/material.dart';

// Models
import 'package:mobile/model/privateBlock.dart';

// Widgets
import 'package:mobile/widgets/privateBlocks/privateBlockItem.dart';

class PrivateBlocksList extends StatelessWidget {
  final List<PrivateBlock> privateBlocksList;

  PrivateBlocksList(this.privateBlocksList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return PrivateBlockItem(this.privateBlocksList[index]);
        },
        itemCount: this.privateBlocksList.length,
      ),
    );
  }
}
