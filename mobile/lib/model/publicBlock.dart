import 'package:flutter/material.dart';

// Models
import 'package:mobile/model/block.dart';
import 'package:mobile/model/user.dart';

class PublicBlock extends Block with ChangeNotifier {
  int reward;
  List<User> usersList;
  bool isWatching;

  PublicBlock({
    final String id,
    final String title,
    final String imageUrl,
    final String owner,
    final String description,
    final String startDate,
    final String endDate,
    final Category category,
    final Type type,
    final Status status = Status.active,
    @required this.reward,
    @required this.usersList,
    final this.isWatching = false,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          owner: owner,
          description: description,
          status: status,
          startDate: startDate,
          endDate: endDate,
          category: category,
        );

  void toggleWatchingStatus() {
    isWatching = !isWatching;
    print(this.isWatching);
    notifyListeners();
  }
}
