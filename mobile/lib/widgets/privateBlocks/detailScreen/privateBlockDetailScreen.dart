import 'package:flutter/material.dart';
import 'package:mobile/model/privateBlock.dart';
import 'package:mobile/widgets/privateBlocks/detailScreen/privateBlockBioScreen.dart';
import 'package:mobile/widgets/privateBlocks/detailScreen/privateBlockSponsorsScreen.dart';

class PrivateBlockDetail extends StatefulWidget {
  final PrivateBlock privateBlock;

  PrivateBlockDetail(this.privateBlock);

  @override
  _PrivateBlockDetailState createState() => _PrivateBlockDetailState();
}

class _PrivateBlockDetailState extends State<PrivateBlockDetail> {
  final tabBarTabs = <Widget>[
    Tab(
      icon: Icon(Icons.home),
    ),
    Tab(
      icon: Icon(Icons.star),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.widget.privateBlock.title),
          bottom: TabBar(
            tabs: this.tabBarTabs,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            PrivateBlockBioScreen(this.widget.privateBlock),
            PrivateBlockSponsorsScreen(this.widget.privateBlock),
          ],
        ),
      ),
    );
  }
}
