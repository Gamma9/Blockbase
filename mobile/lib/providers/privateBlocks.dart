import 'dart:convert';

// Flutter Packages
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// Models
import 'package:mobile/model/privateBlock.dart';

class PersonalBlocks with ChangeNotifier {
  final List<PrivateBlock> _personalBlockList = [];

  void addNewPersonalBlock(PrivateBlock personalBlock) {
    final date = DateFormat.yMMMd().format(DateTime.now());
    const url = 'https://blockbase-d1c40.firebaseio.com/personalBlocks.json';
    http.post(
      url,
      body: json.encode({
        'title': personalBlock.title,
        'owner': personalBlock.owner,
        'date': date,
      }),
    );
    final newPersonalBlock = new PrivateBlock(
      title: personalBlock.title,
      owner: personalBlock.owner,
      date: date,
    );
    this._personalBlockList.add(newPersonalBlock);
    notifyListeners();
    print(newPersonalBlock);
  }

  void updatePersonalBlock(String id, PrivateBlock personalBlock) {
    print('edit personal block' + id);
  }
}
