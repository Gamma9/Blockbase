import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:mobile/providers/publicBlocks.dart';

// Models
import 'package:mobile/model/block.dart';
import 'package:mobile/model/publicBlock.dart';

// Widgets
import 'package:mobile/widgets/publicBlocks/publicBlockDetailScreen.dart';

class PublicBlockItem extends StatelessWidget {
  final PublicBlock _publicBlockItem;

  PublicBlockItem(this._publicBlockItem);

  void _selectPublicBlockItem(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return PublicBlockDetailScreen(this._publicBlockItem);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final publicBlocksProvider = Provider.of<PublicBlocks>(context);
    final loadedPublicBlockItem =
        publicBlocksProvider.findById(this._publicBlockItem.id);
    return Container(
      margin: EdgeInsets.all(8),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            GestureDetector(
              child: Card(
                elevation: 6,
                color: Colors.deepOrangeAccent[100],
                child: Container(
                  height: 100,
                  width: 100,
                  child: Center(child: Icon(Icons.cloud_off)),
                ),
              ),
              onTap: () => _selectPublicBlockItem(context),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  loadedPublicBlockItem.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                loadedPublicBlockItem.description.length >= 30
                    ? Text(
                        '${loadedPublicBlockItem.description.substring(0, 30)}...')
                    : Text(this._publicBlockItem.description),
                Row(
                  children: <Widget>[
                    loadedPublicBlockItem.category == Category.sports
                        ? Text('sports')
                        : loadedPublicBlockItem.category == Category.educational
                            ? Text('educational')
                            : loadedPublicBlockItem.category == Category.random
                                ? Text('random')
                                : Text('custom'),
                    SizedBox(
                      width: 4,
                    ),
                    CircleAvatar(backgroundColor: Colors.grey, radius: 2),
                    SizedBox(
                      width: 4,
                    ),
                    loadedPublicBlockItem.type == Type.active
                        ? Text('active')
                        : loadedPublicBlockItem.type == Type.passive
                            ? Text('passive')
                            : loadedPublicBlockItem.type == Type.competitive
                                ? Text('competitve')
                                : loadedPublicBlockItem.type ==
                                        Type.recreational
                                    ? Text('recreational')
                                    : loadedPublicBlockItem.type == Type.team
                                        ? Text('team')
                                        : loadedPublicBlockItem.type ==
                                                Type.solo
                                            ? Text('solo')
                                            : loadedPublicBlockItem.type ==
                                                    Type.online
                                                ? Text('online')
                                                : Text('offline'),
                  ],
                ),
                Text(loadedPublicBlockItem.owner),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('${loadedPublicBlockItem.reward.toString()} eth'),
                Row(
                  children: <Widget>[
                    CircleAvatar(backgroundColor: Colors.green, radius: 4),
                    SizedBox(
                      width: 4,
                    ),
                    Text('2 days')
                  ],
                ),
              ],
            ),
          ],
        ),
        onTap: () => _selectPublicBlockItem(context),
      ),
    );
  }
}
