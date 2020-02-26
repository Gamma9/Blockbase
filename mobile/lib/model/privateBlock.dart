import 'package:flutter/material.dart';

// Models
import 'package:mobile/model/block.dart';
import 'package:mobile/model/user.dart';

class PrivateBlock extends Block with ChangeNotifier {
  final List<User> watchList;
  final String date;

  PrivateBlock({
    final String id,
    final String title,
    final String imageUrl,
    final String owner,
    final String description,
    final String startDate,
    final String endDate,
    final Status status,
    final Type type,
    final Category category,
    @required this.watchList,
    @required this.date,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          category: category,
          owner: owner,
          description: description,
          startDate: startDate,
          endDate: endDate,
          status: status,
        );
}
