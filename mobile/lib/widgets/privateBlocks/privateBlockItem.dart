import 'package:flutter/material.dart';

// Models
import 'package:mobile/model/block.dart';
import 'package:mobile/model/privateBlock.dart';
import 'package:mobile/widgets/privateBlocks/privateBlockPreview.dart';

class PrivateBlockItem extends StatelessWidget {
  final PrivateBlock _privateBlockItem;

  PrivateBlockItem(this._privateBlockItem);

  void _displayBlockPreview(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return PrivateBlockPreview(this._privateBlockItem);
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        this._privateBlockItem.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: <Widget>[
          Text(
            '@${this._privateBlockItem.owner}',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 4,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 2,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            this._privateBlockItem.date,
          )
        ],
      ),
      trailing: this._privateBlockItem.status == Status.active
          ? CircleAvatar(
              radius: 6,
              backgroundColor: Colors.yellow,
            )
          : this._privateBlockItem.status == Status.expired
              ? CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.red,
                )
              : CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.green,
                ),
      onTap: () => _displayBlockPreview(context),
    );
  }
}
