import 'dart:convert';

// Flutter Packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// Models
import 'package:mobile/model/privateBlock.dart';

class PrivateBlocks with ChangeNotifier {
  // Privaet Block List
  final List<PrivateBlock> _privateBlocksList = [];

  // Get Private Block List
  List<PrivateBlock> get privateBlocksList {
    return [..._privateBlocksList];
  }

  // Find by id
  PrivateBlock findById(String id) {
    return this._privateBlocksList.firstWhere((pblock) => pblock.id == id);
  }

  // Add new Private Block
  void addNewPrivateBlock(PrivateBlock privateBlock) {
    final date = DateFormat.yMMMd().format(DateTime.now());
    const url = 'https://blockbase-d1c40.firebaseio.com/privateBlocks.json';
    http.post(
      url,
      body: json.encode({
        'imageUrl': privateBlock.imageUrl,
        'title': privateBlock.title,
        'owner': privateBlock.owner,
        'description': privateBlock.description,
        'date': date,
        'status': privateBlock.status,
        'type': privateBlock.type,
        'watchList': privateBlock.watchList,
      }),
    );
    final newPrivateBlock = new PrivateBlock(
      imageUrl: privateBlock.imageUrl,
      title: privateBlock.title,
      owner: privateBlock.owner,
      description: privateBlock.description,
      date: date,
      status: privateBlock.status,
      type: privateBlock.type,
      category: privateBlock.category,
      watchList: privateBlock.watchList,
    );
    this._privateBlocksList.add(newPrivateBlock);
    // this._privateBlockList.insert(0, newPrivateBlock); Adds item to the beginning of the list
    notifyListeners();
    print(newPrivateBlock);
  }

  // Update Private Block
  void updatePrivateBlock(String id, PrivateBlock newPrivateBlock) {
    final privateBlockIndex =
        _privateBlocksList.indexWhere((element) => element.id == id);
    if (privateBlockIndex >= 0) {
      this._privateBlocksList[privateBlockIndex] = newPrivateBlock;
      notifyListeners();
    } else {
      print('...');
    }
  }

  // Delete a private block
  void deletePrivateBlock(String id) {
    this._privateBlocksList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
