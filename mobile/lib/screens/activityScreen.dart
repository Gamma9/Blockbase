import 'package:flutter/material.dart';
import 'package:mobile/model/appNotification.dart';
import 'package:mobile/widgets/misc/noNotifications.dart';

class ActivityScreen extends StatelessWidget {
  final List<AppNotification> notificationsList = [];

  @override
  Widget build(BuildContext context) {
    return this.notificationsList.length <= 0
        ? NoNotifications()
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(
                  this.notificationsList[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  this.notificationsList[index].date,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              );
            },
            itemCount: this.notificationsList.length,
          );
  }
}
