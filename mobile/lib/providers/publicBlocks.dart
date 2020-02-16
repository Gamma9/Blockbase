import 'dart:convert';

// Flutter Packages
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// Models
import 'package:mobile/model/publicBlock.dart';

class PublicBlocks with ChangeNotifier {
  final publicBlocksList = [];

  addNewPublicBlock(PublicBlock publicBlock) {
    final date = DateFormat.yMMMd().format(DateTime.now());
    const url = 'https://blockbase-d1c40.firebaseio.com/publicBlocks.json';
    http.post(
      url,
      body: json.encode({
        'title': publicBlock.title,
        'owner': publicBlock.owner,
        'date': date
      }),
    );
    final newPublicBlock = new PublicBlock(
      title: publicBlock.title,
      owner: publicBlock.owner,
      startDate: date,
    );
    publicBlocksList.add(newPublicBlock);
    notifyListeners();
    print(newPublicBlock);
  }

  void updatePublicBlock(String id, String owner, PublicBlock publicBlock) {
    print('edit public block: ' + id);
  }
}
