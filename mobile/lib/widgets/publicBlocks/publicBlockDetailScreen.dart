import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:mobile/providers/publicBlocks.dart';

// Models
import 'package:mobile/model/publicBlock.dart';

// Widgets
import 'package:mobile/widgets/publicBlocks/publicBlockBio.dart';
import 'package:mobile/widgets/publicBlocks/currentUsersList.dart';

class PublicBlockDetailScreen extends StatefulWidget {
  final PublicBlock publicBlockItem;

  PublicBlockDetailScreen(this.publicBlockItem);

  @override
  _PublicBlockDetailScreenState createState() =>
      _PublicBlockDetailScreenState();
}

class _PublicBlockDetailScreenState extends State<PublicBlockDetailScreen> {
  // Add a statistics card tile in between the "User watching -> Date" bar and the users list

  void toggleWatchingStatus() {
    setState(() {
      this.widget.publicBlockItem.toggleWatchingStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.publicBlockItem.title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PublicBlockBio(
                this.widget.publicBlockItem, this.toggleWatchingStatus),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${this.widget.publicBlockItem.usersList.length} users competing',
                    style: TextStyle(color: Colors.deepOrangeAccent[400]),
                  ),
                  Text(
                    DateFormat.yMd().format(DateTime.now()),
                    style: TextStyle(color: Colors.deepOrangeAccent[400]),
                  ),
                ],
              ),
            ),
            CurrentUsersList(this.widget.publicBlockItem.usersList),
          ],
        ),
      ),
    );
  }
}
