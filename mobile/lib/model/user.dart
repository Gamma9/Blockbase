import 'package:flutter/foundation.dart';
import 'package:mobile/model/privateBlock.dart';

class User {
  String id;
  String imageUrl;
  String firstname;
  String lastname;
  String username;
  String dob;
  List<PrivateBlock> privateBlocksList;
  String initialBlock;
  int completedBlocks;

  User({
    @required this.id,
    @required this.imageUrl,
    @required this.firstname,
    @required this.lastname,
    @required this.username,
    @required this.dob,
    @required this.privateBlocksList,
    @required this.initialBlock,
    @required this.completedBlocks,
  });
}
