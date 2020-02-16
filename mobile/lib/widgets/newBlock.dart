import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum BlockType { public, private }

class NewBlock extends StatefulWidget {
  @override
  _NewBlockState createState() => _NewBlockState();
}

class _NewBlockState extends State<NewBlock> {
  var blockType = 'public';
  var blockInput;
  var selectedDate = DateFormat.yMMMd().format(DateTime.now());
  void _changeType(BlockType result) {
    setState(() {
      if (result == BlockType.public) {
        this.blockType = 'public';
      } else if (result == BlockType.private) {
        this.blockType = 'private';
      }
    });
    print(this.blockType);
  }

  void _displayDatePicker(BuildContext ctx) {
    Future<DateTime> selectedDate = showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    selectedDate.then(
      (date) => setState(() {
        this.selectedDate = DateFormat.yMMMd().format(date);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'New Block',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              PopupMenuButton<BlockType>(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.deepOrangeAccent,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    this.blockType,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onSelected: (BlockType result) => _changeType(result),
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<BlockType>>[
                  const PopupMenuItem(
                    child: Text('Public'),
                    value: BlockType.public,
                  ),
                  const PopupMenuItem(
                    child: Text('Private'),
                    value: BlockType.private,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            onChanged: (input) {
              this.blockInput = input;
            },
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Choose Date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              OutlineButton(
                textColor: Colors.deepOrangeAccent,
                child: Text(this.selectedDate),
                onPressed: () => _displayDatePicker(context),
              ),
            ],
          ),
          FlatButton(
            textColor: Colors.white,
            color: Colors.deepOrangeAccent,
            child: Text('Submit'),
            onPressed: () {
              print('Submit new block');
            },
          )
        ],
      ),
    );
  }
}
