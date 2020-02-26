import 'package:flutter/material.dart';
import 'package:mobile/model/privateBlock.dart';
import 'package:mobile/widgets/privateBlocks/editPrivateBlockScreen.dart';

class PrivateBlockBioScreen extends StatelessWidget {
  final PrivateBlock privateBlock;

  PrivateBlockBioScreen(this.privateBlock);

  void _openEditPrivateBlockScreen(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return EditPrivateBlockScreen(this.privateBlock);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 3,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(this.privateBlock.title),
                        InkWell(
                          splashColor: Theme.of(context).accentColor,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).accentColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          onTap: () => _openEditPrivateBlockScreen(context),
                        )
                      ],
                    )
                  ],
                ),
                width: double.infinity,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                        'Statistical insights about your private block and how it matches up with other private blocks progress'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
