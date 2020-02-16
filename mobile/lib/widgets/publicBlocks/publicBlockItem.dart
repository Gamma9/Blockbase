import 'package:flutter/material.dart';
import 'package:mobile/model/publicBlock.dart';

class PublicBlockItem extends StatelessWidget {
  final PublicBlock _publicBlockItem;

  PublicBlockItem(this._publicBlockItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: <Widget>[
          Card(
            color: Colors.deepOrangeAccent[100],
            child: Container(
              height: 100,
              width: 100,
              child: Center(child: Icon(Icons.cloud_off)),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this._publicBlockItem.owner,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text('Public Block Item Title'),
              // Text(this._publicBlockItem.title)
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 2,
                    backgroundColor: Colors.green,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
