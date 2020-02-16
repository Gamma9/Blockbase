import 'package:flutter/material.dart';

enum Status { completed, expired, active }

class PrivateBlock {
  String id;
  String title;
  String owner;
  String date;
  Status status;

  PrivateBlock({
    @required this.id,
    @required this.title,
    @required this.owner,
    @required this.date,
    @required this.status,
  });
}
