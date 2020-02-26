import 'package:flutter/material.dart';

// Models
import 'package:mobile/model/block.dart';
import 'package:mobile/model/publicBlock.dart';

class PublicBlockBio extends StatelessWidget {
  final PublicBlock publicBlock;
  final Function toggleFunction;

  PublicBlockBio(this.publicBlock, this.toggleFunction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 28,
                  child: Text(
                    '${this.publicBlock.title[0]}${this.publicBlock.title[1]}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                this.publicBlock.isWatching == true
                    ? InkWell(
                        splashColor: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              border: Border.all(
                                color: Colors.deepOrangeAccent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            'watching',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onTap: () => this.toggleFunction(),
                      )
                    : InkWell(
                        splashColor: Colors.deepOrangeAccent[100],
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.deepOrangeAccent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            'watch',
                            style: TextStyle(color: Colors.deepOrangeAccent),
                          ),
                        ),
                        onTap: () => this.toggleFunction(),
                      ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  this.publicBlock.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${this.publicBlock.reward.toString()} eth',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  this.publicBlock.owner,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 4,
                ),
                CircleAvatar(
                  radius: 2,
                  backgroundColor: Colors.deepOrangeAccent[100],
                ),
                SizedBox(
                  width: 4,
                ),
                this.publicBlock.status == Status.active
                    ? Text(
                        'Active',
                        style: TextStyle(color: Colors.green),
                      )
                    : this.publicBlock.status == Status.completed
                        ? Text(
                            'Completed',
                            style: TextStyle(color: Colors.green),
                          )
                        : Text(
                            'Expired',
                            style: TextStyle(color: Colors.red),
                          )
              ],
            ),
            Text(this.publicBlock.description),
            Row(
              children: <Widget>[
                Text(
                  this.publicBlock.startDate,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '-',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  this.publicBlock.endDate,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            // Divider(),
            // Row(
            //   children: <Widget>[
            //     Text(this.publicBlockItem.runtimeType),
            //     Text('${this.publicBlockItem.type}'),
            //     Text('${}'),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
