import 'dart:convert';

// Flutter Packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// Models
import 'package:mobile/model/block.dart';
import 'package:mobile/model/publicBlock.dart';
import 'package:mobile/model/user.dart';

class PublicBlocks with ChangeNotifier {
  // Public Block List
  final List<PublicBlock> _publicBlocksList = [
    PublicBlock(
      id: DateTime.now().toString(),
      imageUrl: '',
      title: 'Mavericks Marvel',
      description: '500,000 retweets about Dallas Mavericks',
      owner: 'Mark Cuban',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.sports,
      reward: 5000,
      type: Type.online,
      status: Status.active,
      usersList: [
        User(
          id: DateTime.now().toString(),
          imageUrl: '',
          firstname: 'Cameron',
          lastname: 'Gamble',
          username: 'Gamma9',
        )
      ],
    ),
    PublicBlock(
      id: DateTime.now().toString(),
      imageUrl: '',
      title: 'FB Friends Frenzy',
      description: 'Gain 5,000 Facebook friends within 2 hours',
      owner: 'Mark Zuckerburg',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.random,
      type: Type.online,
      reward: 4556,
      status: Status.active,
      usersList: [],
    ),
    PublicBlock(
      id: DateTime.now().toString(),
      imageUrl: '',
      title: 'Don\'t FW Cats',
      description: '500,000 favorites on a tweet about cats',
      owner: 'Twitter Co.',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.random,
      type: Type.online,
      reward: 467,
      status: Status.active,
      usersList: [],
    ),
    PublicBlock(
      id: DateTime.now().toString(),
      imageUrl: '',
      title: 'Coding Circuit',
      description: 'Hold a successful lesson about computer science',
      owner: 'LISD',
      startDate: DateFormat.yMMMd().format(DateTime.now()),
      endDate: DateFormat.yMMMd().format(DateTime.now()),
      category: Category.educational,
      reward: 65,
      type: Type.offline,
      status: Status.active,
      usersList: [],
    ),
  ];

  // Get Public Blocks List
  List<PublicBlock> get publicBlocks {
    return [...this._publicBlocksList];
  }

  // Find Public Block by id
  PublicBlock findById(String id) {
    return _publicBlocksList.firstWhere((pBlock) => pBlock.id == id);
  }

  // Add New Public Block
  Future<void> addNewPublicBlock(PublicBlock publicBlock) {
    const url = 'https://blockbase-d1c40.firebaseio.com/publicBlocks.json';

    http
        .post(
      url,
      body: json.encode({
        'title': publicBlock.title,
        'imageUrl': publicBlock.imageUrl,
        'owner': publicBlock.owner,
        'description': publicBlock.description,
        'startDate': publicBlock.startDate,
        'endDate': publicBlock.endDate,
        'type': publicBlock.type,
        'category': publicBlock.category,
        'status': publicBlock.status,
        'usersList': publicBlock.usersList,
        'reward': publicBlock.reward,
      }),
    )
        .then((response) {
      print(json.decode(response.body));
      final newPublicBlock = new PublicBlock(
        id: json.decode(response.body)['name'],
        title: publicBlock.title,
        imageUrl: publicBlock.imageUrl,
        owner: publicBlock.owner,
        description: publicBlock.description,
        startDate: publicBlock.startDate,
        endDate: publicBlock.endDate,
        reward: publicBlock.reward,
        type: publicBlock.type,
        category: publicBlock.category,
        status: publicBlock.status,
        usersList: publicBlock.usersList,
      );
      _publicBlocksList.add(newPublicBlock);
      // _publicBlocksList.insert(0, newPublicBlock); Adds at the beginning of the list
      notifyListeners();
      print("New Block Created!\n\n" +
          "Title: ${publicBlock.title}\n" +
          "Image Url: ${publicBlock.imageUrl}\n" +
          "Owner: ${publicBlock.owner}\n" +
          "Description: ${publicBlock.description}\n" +
          "Start Date: ${publicBlock.startDate}\n" +
          "End Date: ${publicBlock.endDate}\n" +
          "Reward: ${publicBlock.reward}\n" +
          "Type: ${publicBlock.type}\n" +
          "Category: ${publicBlock.category}\n" +
          "Status: ${publicBlock.status}\n" +
          "Users List: ${publicBlock.usersList}\n");
      return Future.value();
    });
  }

  // Update Public Block
  void updatePublicBlock(String id, PublicBlock newPublicBlock) {
    final publicBlockIndex =
        this._publicBlocksList.indexWhere((element) => element.id == id);
    if (publicBlockIndex >= 0) {
      this._publicBlocksList[publicBlockIndex] = newPublicBlock;
      notifyListeners();
    } else {
      print('...');
    }
  }

  //  Delete Public Block
  void deletePublicBlock(String id) {
    this._publicBlocksList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
