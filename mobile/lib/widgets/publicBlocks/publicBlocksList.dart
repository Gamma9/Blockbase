import 'package:flutter/material.dart';
import 'package:mobile/model/publicBlock.dart';
import 'package:mobile/widgets/publicBlocks/publicBlockItem.dart';

class PublicBlocksList extends StatelessWidget {
  final List<PublicBlock> publicBlocksList;

  PublicBlocksList(this.publicBlocksList);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return PublicBlockItem(this.publicBlocksList[index]);
      },
      itemCount: this.publicBlocksList.length,
    );
  }
}
