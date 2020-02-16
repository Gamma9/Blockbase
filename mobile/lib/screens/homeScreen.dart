import 'package:flutter/material.dart';

// Screens
import 'package:mobile/screens/activityScreen.dart';
import 'package:mobile/screens/privateBlocksScreen.dart';
import 'package:mobile/screens/publicBlocksScreen.dart';

// Widgets
import 'package:mobile/widgets/newBlock.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  // final List<PublicBlock> publicBlockList = [];
  // final List<PersonalBlock> personalBlockList = [];

  void _selectIndex(int index) {
    setState(() {
      this._selectedIndex = index;
    });
  }

  void _startAddNewBlock(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewBlock();
        });
  }

  final List<Widget> _widgetOptions = <Widget>[
    PublicBlocksScreen(),
    PrivateBlocksScreen(),
    ActivityScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blockbase'),
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Public'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Base'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Activity'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        onTap: _selectIndex,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewBlock(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
