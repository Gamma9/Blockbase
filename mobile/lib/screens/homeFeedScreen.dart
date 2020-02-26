import 'package:flutter/material.dart';
import 'package:mobile/providers/blocks.dart';

// Providers
import 'package:provider/provider.dart';

// Models
import 'package:mobile/model/block.dart';

// Widgets
import 'package:mobile/widgets/blocksList.dart';
import 'package:mobile/widgets/misc/noBlocks.dart';

class HomeFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocksProvider = Provider.of<Blocks>(context);
    final blocksList = blocksProvider.getBlocks;
    return blocksList.length <= 0 ? NoBlocks() : BlocksList();
  }
}
