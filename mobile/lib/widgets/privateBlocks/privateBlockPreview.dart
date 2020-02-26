import 'package:flutter/material.dart';

// Models
import 'package:mobile/model/privateBlock.dart';
import 'package:mobile/model/block.dart';

// Widgets
import 'package:mobile/widgets/privateBlocks/editPrivateBlockScreen.dart';
import 'package:mobile/widgets/privateBlocks/detailScreen/privateBlockDetailScreen.dart';

class PrivateBlockPreview extends StatefulWidget {
  final PrivateBlock privateBlock;

  PrivateBlockPreview(this.privateBlock);

  @override
  _PrivateBlockPreviewState createState() => _PrivateBlockPreviewState();
}

class _PrivateBlockPreviewState extends State<PrivateBlockPreview> {
  bool editMode = false;

  void _startEditMode(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return EditPrivateBlockScreen(this.widget.privateBlock);
      }),
    );
  }

  void _openPrivateBlockDetailScreen(BuildContext ctx) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return PrivateBlockDetail(this.widget.privateBlock);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      this.widget.privateBlock.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    this.widget.privateBlock.status == Status.active
                        ? CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.green,
                          )
                        : this.widget.privateBlock.status == Status.completed
                            ? CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.green,
                              )
                            : CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.red,
                              )
                  ],
                ),
                InkWell(
                  splashColor: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.deepOrange,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                  onTap: () => _startEditMode(context),
                )
              ],
            ),
            onTap: () => _openPrivateBlockDetailScreen(context),
          ),
          GestureDetector(
            child: Text(
              this.widget.privateBlock.description,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () => _openPrivateBlockDetailScreen(context),
          ),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Text(
                    '${this.widget.privateBlock.startDate} - ${this.widget.privateBlock.endDate}'),
                SizedBox(
                  width: 8,
                ),
                Text('{Remaining Time}'),
              ],
            ),
            onTap: () => _openPrivateBlockDetailScreen(context),
          ),
          Divider(
            thickness: 1,
          ),
          Container(
            height: 250,
            child: this.widget.privateBlock.watchList.length <= 0
                ? Center(
                    child: Text(
                      'No users watching',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(
                              '${this.widget.privateBlock.watchList[index].firstname[0]}${this.widget.privateBlock.watchList[index].lastname[0]}'),
                        ),
                        title: Text(
                          '${this.widget.privateBlock.watchList[index].firstname} ${this.widget.privateBlock.watchList[index].lastname}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                            '@${this.widget.privateBlock.watchList[index].username}'),
                      );
                    },
                    itemCount: this.widget.privateBlock.watchList.length,
                  ),
          ),
        ],
      ),
    );
  }
}
