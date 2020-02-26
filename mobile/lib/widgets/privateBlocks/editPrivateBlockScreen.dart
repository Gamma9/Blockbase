import 'package:flutter/material.dart';
import 'package:mobile/model/block.dart';
import 'package:mobile/model/privateBlock.dart';
import 'package:mobile/providers/privateBlocks.dart';
import 'package:provider/provider.dart';

class EditPrivateBlockScreen extends StatefulWidget {
  final PrivateBlock privateBlock;

  EditPrivateBlockScreen(this.privateBlock);

  @override
  _EditPrivateBlockScreenState createState() => _EditPrivateBlockScreenState();
}

class _EditPrivateBlockScreenState extends State<EditPrivateBlockScreen> {
  final _titleFocusNode = FocusNode();
  final _ownerFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var type = null;
  var category = null;
  var _editedPrivateBlock = PrivateBlock(
    id: null,
    title: '',
    imageUrl: '',
    description: '',
    owner: '',
    startDate: '',
    endDate: '',
    date: '',
    type: null,
    category: null,
    status: null,
    watchList: [],
  );

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

  // Change Block Category
  void _changeCategory(Category category) {
    setState(() {
      switch (category) {
        case Category.random:
          {
            this._editedPrivateBlock.category = Category.random;
            this.category = 'Random';
          }
          break;
        case Category.sports:
          {
            this._editedPrivateBlock.category = Category.sports;
            this.category = 'Sports';
          }
          break;
        case Category.educational:
          {
            this._editedPrivateBlock.category = Category.educational;
            this.category = 'Educational';
          }
          break;
        case Category.custom:
          {
            this._editedPrivateBlock.category = Category.custom;
            this.category = 'Custom';
          }
          break;

        default:
          {
            print('Invalid Choice');
          }
          break;
      }
    });
    print(this._editedPrivateBlock.category);
  }

  // Change Type
  void _changeType(Type type) {
    setState(() {
      switch (type) {
        case Type.active:
          {
            this._editedPrivateBlock.type = Type.active;
            this.type = 'Active';
          }
          break;
        case Type.passive:
          {
            this._editedPrivateBlock.type = Type.passive;
            this.type = 'Passive';
          }
          break;
        case Type.online:
          {
            this._editedPrivateBlock.type = Type.online;
            this.type = 'Online';
          }
          break;
        case Type.offline:
          {
            this._editedPrivateBlock.type = Type.offline;
            this.type = 'Offline';
          }
          break;
        case Type.team:
          {
            this._editedPrivateBlock.type = Type.team;
            this.type = 'Team';
          }
          break;
        case Type.solo:
          {
            this._editedPrivateBlock.type = Type.solo;
            this.type = 'Solo';
          }
          break;
        case Type.competitive:
          {
            this._editedPrivateBlock.type = Type.competitive;
            this.type = 'Competitive';
          }
          break;
        case Type.recreational:
          {
            this._editedPrivateBlock.type = Type.recreational;
            this.type = 'Recreational';
          }
          break;
        default:
          {
            print('Invalid choice');
          }
          break;
      }
    });
    print(this._editedPrivateBlock.type);
  }

  void updateImageUrl() {}

  @override
  void initState() {
    this._imageUrlFocusNode.addListener(this.updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    this._imageUrlController.removeListener(this.updateImageUrl);
    this._titleFocusNode.dispose();
    this._ownerFocusNode.dispose();
    this._descriptionFocusNode.dispose();
    this._imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    this._form.currentState.save();
    if (this._editedPrivateBlock.id != null) {
      Provider.of<PrivateBlocks>(context).updatePrivateBlock(
          this.widget.privateBlock.id, this._editedPrivateBlock);
    } else {
      Provider.of<PrivateBlocks>(context, listen: false)
          .addNewPrivateBlock(this._editedPrivateBlock);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // final privateBlocksProvider = Provider.of<PrivateBlocks>(context);
    // final privateBlock = privateBlocksProvider.findById(this.privateBlock.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Private Block'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: this._form,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Card(
                  elevation: 6,
                  color: Colors.deepOrangeAccent[100],
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: this._imageUrlController.text.isEmpty
                        ? Center(
                            child: Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            ),
                          )
                        : FittedBox(
                            child: Image.network(
                              this._imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Image Url',
                  ),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(this._titleFocusNode);
                  },
                  onSaved: (value) {
                    _editedPrivateBlock = PrivateBlock(
                      id: _editedPrivateBlock.id,
                      title: _editedPrivateBlock.title,
                      imageUrl: value,
                      description: _editedPrivateBlock.description,
                      owner: _editedPrivateBlock.owner,
                      startDate: _editedPrivateBlock.startDate,
                      endDate: _editedPrivateBlock.endDate,
                      status: _editedPrivateBlock.status,
                      category: _editedPrivateBlock.category,
                      watchList: _editedPrivateBlock.watchList,
                      date: _editedPrivateBlock.date,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: this.widget.privateBlock.title,
                  ),
                  focusNode: this._titleFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(this._ownerFocusNode);
                  },
                  onSaved: (value) {
                    _editedPrivateBlock = PrivateBlock(
                      id: _editedPrivateBlock.id,
                      title: value,
                      imageUrl: _editedPrivateBlock.imageUrl,
                      description: _editedPrivateBlock.description,
                      owner: _editedPrivateBlock.owner,
                      startDate: _editedPrivateBlock.startDate,
                      endDate: _editedPrivateBlock.endDate,
                      status: _editedPrivateBlock.status,
                      category: _editedPrivateBlock.category,
                      watchList: _editedPrivateBlock.watchList,
                      date: _editedPrivateBlock.date,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: this.widget.privateBlock.owner,
                  ),
                  textInputAction: TextInputAction.next,
                  focusNode: this._ownerFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(this._descriptionFocusNode);
                  },
                  onSaved: (value) {
                    _editedPrivateBlock = PrivateBlock(
                      id: _editedPrivateBlock.id,
                      title: _editedPrivateBlock.title,
                      imageUrl: _editedPrivateBlock.imageUrl,
                      description: _editedPrivateBlock.description,
                      owner: value,
                      startDate: _editedPrivateBlock.startDate,
                      endDate: _editedPrivateBlock.endDate,
                      status: _editedPrivateBlock.status,
                      category: _editedPrivateBlock.category,
                      watchList: _editedPrivateBlock.watchList,
                      date: _editedPrivateBlock.date,
                    );
                  },
                ),
                TextFormField(
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      labelText: this.widget.privateBlock.description),
                  focusNode: this._descriptionFocusNode,
                  onSaved: (value) {
                    _editedPrivateBlock = PrivateBlock(
                      id: _editedPrivateBlock.id,
                      title: _editedPrivateBlock.title,
                      imageUrl: _editedPrivateBlock.imageUrl,
                      description: value,
                      owner: _editedPrivateBlock.owner,
                      startDate: _editedPrivateBlock.startDate,
                      endDate: _editedPrivateBlock.endDate,
                      status: _editedPrivateBlock.status,
                      category: _editedPrivateBlock.category,
                      watchList: _editedPrivateBlock.watchList,
                      date: _editedPrivateBlock.date,
                    );
                  },
                  // onFieldSubmitted: (_) {
                  //   this._saveForm();
                  // },
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    PopupMenuButton(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepOrangeAccent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          this._editedPrivateBlock.type == null
                              ? 'No Type'
                              : '${this.type}',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ),
                      onSelected: (Type value) => _changeType(value),
                      itemBuilder: (BuildContext ctx) => this.typeOptions,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    PopupMenuButton(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepOrangeAccent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          this._editedPrivateBlock.category == null
                              ? 'No Category'
                              : '${this.category}',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ),
                      onSelected: (Category category) =>
                          _changeCategory(category),
                      itemBuilder: (BuildContext ctx) => this.categoryOptions,
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                RaisedButton(
                  color: Colors.deepOrangeAccent,
                  textColor: Colors.white,
                  child: Text('Save'),
                  onPressed: () => this._saveForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
