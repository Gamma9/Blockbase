import 'package:flutter/material.dart';
import 'package:mobile/model/publicBlock.dart';
import 'package:mobile/widgets/publicBlocks/publicBlockItem.dart';
import 'package:provider/provider.dart';

class PublicBlocksList extends StatelessWidget {
  final List<PublicBlock> publicBlocksList;

  PublicBlocksList(this.publicBlocksList);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: this.publicBlocksList[index],
        child: PublicBlockItem(this.publicBlocksList[index]),
      ),
      itemCount: this.publicBlocksList.length,
    );
  }
}
