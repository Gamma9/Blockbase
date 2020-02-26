import 'package:flutter/material.dart';

enum Status { completed, expired, active }

enum Category { sports, random, custom, educational }
enum Type {
  active,
  passive,
  team,
  solo,
  competitive,
  recreational,
  online,
  offline
}

class Block {
  String id;
  String imageUrl;
  String title;
  String description;
  String owner;
  String startDate;
  String endDate;
  Status status;
  Type type;
  Category category;

  Block({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.owner,
    @required this.startDate,
    @required this.endDate,
    @required this.status,
    @required this.category,
  });
}
