import 'package:flutter/material.dart';

enum Status { completed, expired, active }
enum Category { sports, random, custom, educational }
enum Type { active, passive, team, competitive, online, offline }

class PublicBlock {
  String id;
  String title;
  String owner;
  String startDate;
  String endDate;
  Category category;
  Status status;
  Type type;
  int reward;

  PublicBlock({
    @required this.id,
    @required this.title,
    @required this.owner,
    @required this.startDate,
    @required this.endDate,
    @required this.category,
    @required this.status,
    @required this.type,
    @required this.reward,
  });
}
