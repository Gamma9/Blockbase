import 'package:flutter/material.dart';

// Models
import 'package:mobile/model/privateBlock.dart';
import 'package:mobile/widgets/misc/noWatchers.dart';

// Widgets
import 'package:mobile/widgets/privateBlocks/detailScreen/sponsorItem.dart';

class PrivateBlockSponsorsScreen extends StatelessWidget {
  final PrivateBlock privateBlock;

  PrivateBlockSponsorsScreen(this.privateBlock);

  // Sponsors at the top in the Grid View? Watchers underneath in a regular list tile?

  @override
  Widget build(BuildContext context) {
    return this.privateBlock.watchList.length <= 0
        ? NoWatchers()
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (ctx, index) {
              return SponsorGridItem(this.privateBlock.watchList[index]);
            },
            itemCount: this.privateBlock.watchList.length,
          );
  }
}
