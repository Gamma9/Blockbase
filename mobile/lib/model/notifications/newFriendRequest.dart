import 'package:flutter/material.dart';
import 'package:mobile/model/notifications/appNotification.dart';

class NewFriendRequest extends AppNotification {
  NewFriendRequest({
    @required id,
    @required title,
    @required date,
  }) : super(
          id: id,
          title: title,
          date: date,
        );
}
