import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:mobile/providers/privateBlocks.dart';
import 'package:mobile/providers/publicBlocks.dart';

// Models
import 'package:mobile/model/block.dart';
import 'package:mobile/model/privateBlock.dart';
import 'package:mobile/model/publicBlock.dart';

enum BlockType { public, private }

class NewBlock extends StatefulWidget {
  @override
  _NewBlockState createState() => _NewBlockState();
}

class _NewBlockState extends State<NewBlock> {
  final _ownerFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  var blockType = 'public';
  var blockDesc;
  var blockTitle;
  var owner;
  var reward;
  var startDate = 'Start Date';
  var endDate = 'End Date';
  var type = 'Type';
  var typeVal;
  var category = 'Category';
  var categoryVal;
  var isLoading = false;
  // var newPublicBlock = PublicBlock();
  // var newPrivateBlock = PrivateBlock();
  final _form = GlobalKey<FormState>();

  // Block Type options
  final typeOptions = <PopupMenuEntry<Type>>[
    const PopupMenuItem(
      child: Text('Active'),
      value: Type.active,
    ),
    const PopupMenuItem(
      child: Text('Passive'),
      value: Type.passive,
    ),
    const PopupMenuItem(
      child: Text('Team'),
      value: Type.team,
    ),
    const PopupMenuItem(
      child: Text('Solo'),
      value: Type.solo,
    ),
    const PopupMenuItem(
      child: Text('Competitive'),
      value: Type.competitive,
    ),
    const PopupMenuItem(
      child: Text('Recreational'),
      value: Type.recreational,
    ),
    const PopupMenuItem(
      child: Text('Online'),
      value: Type.online,
    ),
    const PopupMenuItem(
      child: Text('Offline'),
      value: Type.offline,
    ),
  ];

  // Block Category Options
  final categoryOptions = <PopupMenuEntry<Category>>[
    const PopupMenuItem(
      child: Text('Random'),
      value: Category.random,
    ),
    const PopupMenuItem(
      child: Text('Sports'),
      value: Category.sports,
    ),
    const PopupMenuItem(
      child: Text('Educational'),
      value: Category.educational,
    ),
    const PopupMenuItem(
      child: Text('Custom'),
      value: Category.custom,
    ),
  ];

  void _saveForm(blockType) {
    setState(() {
      this.isLoading = true;
    });
    this._form.currentState.save();
    if (blockType == 'public') {
      final newPublicBlock = PublicBlock(
        imageUrl: '',
        title: this.blockTitle,
        description: this.blockDesc,
        owner: this.owner,
        category: this.categoryVal,
        type: this.typeVal,
        reward: this.reward,
        startDate: this.startDate,
        endDate: this.endDate,
        usersList: [],
        status: Status.active,
        isWatching: false,
      );
      Provider.of<PublicBlocks>(context, listen: false)
          .addNewPublicBlock(newPublicBlock);
      this.isLoading = false;
    } else if (blockType == 'private') {
      setState(() {
        this.isLoading = true;
      });
      final newPrivateBlock = PrivateBlock(
        imageUrl: '',
        title: this.blockTitle,
        description: this.blockDesc,
        owner: this.owner,
        category: this.categoryVal,
        type: this.typeVal,
        status: Status.active,
        startDate: this.startDate,
        endDate: this.endDate,
        date: DateTime.now().toString(),
        watchList: [],
      );
      Provider.of<PrivateBlocks>(context, listen: false)
          .addNewPrivateBlock(newPrivateBlock);
      this.isLoading = false;
    }

    Navigator.of(context).pop();
  }

  // Change Block Category
  void _changeCategory(Category category) {
    setState(() {
      switch (category) {
        case Category.random:
          {
            this.category = 'Random';
            this.categoryVal = Category.random;
          }
          break;
        case Category.sports:
          {
            this.category = 'Sports';
            this.categoryVal = Category.sports;
          }
          break;
        case Category.educational:
          {
            this.category = 'Educational';
            this.categoryVal = Category.educational;
          }
          break;
        case Category.custom:
          {
            this.category = 'Custom';
            this.categoryVal = Category.custom;
          }
          break;

        default:
          {
            print('Invalid Choice');
          }
          break;
      }
    });
  }

  // Change Type
  void _changeType(Type type) {
    setState(() {
      switch (type) {
        case Type.active:
          {
            this.type = 'Active';
            this.typeVal = Type.active;
          }
          break;
        case Type.passive:
          {
            this.type = 'Passive';
            this.typeVal = Type.passive;
          }
          break;
        case Type.online:
          {
            this.type = 'Online';
            this.typeVal = Type.online;
          }
          break;
        case Type.offline:
          {
            this.type = 'Offline';
            this.typeVal = Type.offline;
          }
          break;
        case Type.team:
          {
            this.type = 'Team';
            this.typeVal = Type.team;
          }
          break;
        case Type.solo:
          {
            this.type = 'Solo';
            this.typeVal = Type.solo;
          }
          break;
        case Type.competitive:
          {
            this.type = 'Competitive';
            this.typeVal = Type.competitive;
          }
          break;
        case Type.recreational:
          {
            this.type = 'Recreational';
            this.typeVal = Type.recreational;
          }
          break;
        default:
          {
            print('Invalid choice');
          }
          break;
      }
    });
  }

  // Change Block Type
  void _changeBlockType(BlockType result) {
    setState(() {
      if (result == BlockType.public) {
        this.blockType = 'public';
      } else if (result == BlockType.private) {
        this.blockType = 'private';
      }
    });
    print(this.blockType);
  }

  // Display Start-Date Date Picker
  void _displayStartDatePicker(BuildContext ctx) {
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
        this.startDate = DateFormat.yMMMd().format(date);
      }),
    );
  }

  // Display End-Date Date Picker
  void _displayEndDatePicker(BuildContext ctx) {
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
        this.endDate = DateFormat.yMMMd().format(date);
      }),
    );
  }

  @override
  void dispose() {
    this._ownerFocusNode.dispose();
    this._descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return this.isLoading == true
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.all(16),
            child: Form(
              key: this._form,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'New Block',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        PopupMenuButton(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.deepOrangeAccent,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              this.blockType,
                              style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onSelected: (BlockType result) =>
                              _changeBlockType(result),
                          itemBuilder: (BuildContext ctx) =>
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
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(this._ownerFocusNode);
                      },
                      onSaved: (value) {
                        this.blockTitle = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Owner Name'),
                      textInputAction: TextInputAction.next,
                      focusNode: this._ownerFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(this._descriptionFocusNode);
                      },
                      onSaved: (value) {
                        this.owner = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Description'),
                      textInputAction: TextInputAction.next,
                      focusNode: this._descriptionFocusNode,
                      onSaved: (value) {
                        this.blockDesc = value;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Block Type Popup button
                        PopupMenuButton(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.deepOrangeAccent,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              this.type,
                              style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onSelected: (Type result) => _changeType(result),
                          itemBuilder: (BuildContext ctx) => this.typeOptions,
                        ),
                        // Block Type Popup button
                        SizedBox(
                          width: 8,
                        ),
                        // Category Popup Button
                        PopupMenuButton(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.deepOrangeAccent,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              this.category,
                              style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onSelected: (Category result) =>
                              _changeCategory(result),
                          itemBuilder: (BuildContext ctx) =>
                              this.categoryOptions,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: this.blockType == 'public'
                              ? TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Reward',
                                  ),
                                  keyboardType: TextInputType.number,
                                  onSaved: (value) {
                                    this.reward = int.parse(value);
                                  },
                                )
                              : SizedBox(),
                        ),
                        // Category Popup Button
                      ],
                    ),
                    ButtonBar(
                      children: <Widget>[
                        OutlineButton(
                          textColor: Colors.deepOrangeAccent,
                          child: Text(this.startDate),
                          onPressed: () => _displayStartDatePicker(context),
                        ),
                        OutlineButton(
                          textColor: Colors.deepOrangeAccent,
                          child: Text(this.endDate),
                          onPressed: () => _displayEndDatePicker(context),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 8),
                      child: RaisedButton(
                        elevation: 6,
                        textColor: Colors.white,
                        color: Colors.deepOrangeAccent,
                        child: Text(
                          'Submit',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => this._saveForm(this.blockType),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
