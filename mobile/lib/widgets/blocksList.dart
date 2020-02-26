import 'package:flutter/material.dart';
import 'package:mobile/model/block.dart';
import 'package:mobile/model/privateBlock.dart';
import 'package:mobile/model/publicBlock.dart';
import 'package:mobile/providers/blocks.dart';
import 'package:mobile/widgets/blockItem.dart';
import 'package:provider/provider.dart';

class BlocksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocksProvider = Provider.of<Blocks>(context);
    final blocksList = blocksProvider.getBlocks;
    return ListView.builder(
      itemBuilder: (ctx, index) {
        if (blocksList[index] == PublicBlock) {
          return BlockItem(blocksList[index]);
        } else if (blocksList[index] == PrivateBlock) {
          return BlockItem(blocksList[index]);
        } else {
          return SizedBox(
            width: 0,
          );
        }
      },
      itemCount: blocksList.length,
    );
  }
}
