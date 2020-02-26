import 'package:flutter/material.dart';
import 'package:mobile/model/user.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  EditProfileScreen(this.user);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _firstNameFocusNode = FocusNode();
  final _lastnameFocusNode = FocusNode();
  final _usernameFocusNode = FocusNode();
  final _dobFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _saveButtonFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _user = User(
    id: null,
    imageUrl: '',
    firstname: '',
    lastname: '',
    username: '',
    dob: '',
  );

  void _updateImageUrl() {
    if (!this._imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void initState() {
    this._imageUrlFocusNode.addListener(this._updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    this._imageUrlFocusNode.removeListener(this._updateImageUrl);
    this._firstNameFocusNode.dispose();
    this._lastnameFocusNode.dispose();
    this._usernameFocusNode.dispose();
    this._dobFocusNode.dispose();
    this._imageUrlController.dispose();
    this._imageUrlFocusNode.dispose();
    this._saveButtonFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = this._form.currentState.validate();
    if (!isValid) {
      return;
    }
    this._form.currentState.save();
    print(this._user.imageUrl);
    print(this._user.firstname);
    print(this._user.lastname);
    print(this._user.username);
    print(this._user.dob);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: this._form,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Card(
                      color: Colors.deepOrangeAccent[100],
                      elevation: 6,
                      child: Container(
                        width: 150,
                        height: 150,
                        child: this._imageUrlController.text.isEmpty
                            ? Center(
                                child: Icon(
                                  Icons.add_a_photo,
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
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image Url'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.next,
                        controller: this._imageUrlController,
                        focusNode: this._imageUrlFocusNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            // Check for a correct URL
                            return 'Please enter an image URL';
                          } else if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return 'Please enter a valid image URL';
                          } else if (!value.endsWith('.png') &&
                              !value.endsWith('.jpg') &&
                              !value.endsWith('jpeg')) {
                            return 'Please enter a valid image URL';
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(this._firstNameFocusNode);
                        },
                        onSaved: (value) {
                          this._user = User(
                            id: null,
                            imageUrl: value,
                            firstname: this._user.firstname,
                            lastname: this._user.lastname,
                            username: this._user.username,
                            dob: this._user.dob,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: this.widget.user.firstname),
                  focusNode: this._firstNameFocusNode,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    this._user = User(
                      id: null,
                      imageUrl: this._user.imageUrl,
                      firstname: value,
                      lastname: this._user.lastname,
                      username: this._user.username,
                      dob: this._user.dob,
                    );
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(this._lastnameFocusNode);
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: this.widget.user.lastname),
                  textInputAction: TextInputAction.next,
                  focusNode: this._lastnameFocusNode,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    this._user = User(
                      id: null,
                      imageUrl: this._user.imageUrl,
                      firstname: this._user.firstname,
                      lastname: value,
                      username: this._user.username,
                      dob: this._user.dob,
                    );
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(this._usernameFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: '@${this.widget.user.username}'),
                  textInputAction: TextInputAction.next,
                  focusNode: this._usernameFocusNode,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    this._user = User(
                      id: null,
                      imageUrl: this._user.imageUrl,
                      firstname: this._user.firstname,
                      lastname: this._user.lastname,
                      username: value,
                      dob: this._user.dob,
                    );
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(this._dobFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: this.widget.user.dob),
                  textInputAction: TextInputAction.done,
                  focusNode: this._dobFocusNode,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    this._user = User(
                      id: null,
                      imageUrl: this._user.imageUrl,
                      firstname: this._user.firstname,
                      lastname: this._user.lastname,
                      username: this._user.username,
                      dob: value,
                    );
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(this._saveButtonFocusNode);
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                RaisedButton(
                  focusNode: this._saveButtonFocusNode,
                  color: Colors.deepOrange,
                  textColor: Colors.white,
                  child: Text('Save'),
                  splashColor: Colors.deepOrangeAccent,
                  onPressed: () => this._saveForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
