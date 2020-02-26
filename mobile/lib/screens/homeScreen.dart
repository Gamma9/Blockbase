import 'package:flutter/material.dart';

// Screens
import 'package:mobile/screens/activityScreen.dart';
import 'package:mobile/screens/homeFeedScreen.dart';
import 'package:mobile/screens/misc/settingsScreen.dart';
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

  void selectSettings(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return SettingsScreen();
      }),
    );
  }

  void _startAddNewBlock(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewBlock();
        });
  }

  final List<Widget> _widgetOptions = <Widget>[
    HomeFeedScreen(),
    PublicBlocksScreen(),
    ActivityScreen(),
    PrivateBlocksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blockbase'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => selectSettings(context),
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Public'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Activity'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Base'),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.deepOrangeAccent[100],
        showUnselectedLabels: true,
        selectedItemColor: Colors.deepOrange,
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
