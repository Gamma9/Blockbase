import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import '../providers/publicBlocks.dart';

// Models
import 'package:mobile/widgets/misc/noPublicBlocks.dart';
import 'package:mobile/widgets/publicBlocks/publicBlocksList.dart';

class PublicBlocksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final publicBlocksProvider = Provider.of<PublicBlocks>(context);
    final publicBlocksList = publicBlocksProvider.publicBlocks;
    return publicBlocksList.length <= 0
        ? NoPublicBlocks()
        : PublicBlocksList(publicBlocksList);
  }
}
