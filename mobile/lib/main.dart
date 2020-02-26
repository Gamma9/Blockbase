import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import './providers/privateBlocks.dart';
import './providers/publicBlocks.dart';
import './providers/blocks.dart';

// Screens
import 'package:mobile/screens/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: PublicBlocks(),
        ),
        ChangeNotifierProvider.value(
          value: PrivateBlocks(),
        ),
        ChangeNotifierProvider.value(
          value: Blocks(),
        ),
      ],
      child: MaterialApp(
        title: 'Blockbase',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
