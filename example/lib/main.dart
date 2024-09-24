import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teeth_anatomy/teeth_custom_paint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teeth Anatomy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TeethModel> tooth = [];
  List<TeethModel> tooth1 = [];
  List<TeethModel> tooth2 = [];
  List<TeethModel> tooth3 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Expanded(
            child: TeethWidget(
              borderWith: 1,
              size: 500,
              textPaddingLeft: -10,
              textPaddingTop: 1,
              selectedColor: Colors.purpleAccent,
              unSelectedColor: Colors.white,
              borderColor: Colors.green,
              textStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
              onTap: (String id, selected) {
                if (selected) {
                  tooth.add(TeethModel(
                      id: id,
                      selectedColor: Colors.primaries[Random().nextInt(16)]));
                } else {
                  tooth.removeWhere((r) => r.id == id);
                }

                setState(() {});
              },
              teeth: tooth,
            ),
          ),
          Expanded(
            child: TeethWidget(
              borderWith: 1,
              size: 600,
              textPaddingLeft: -10,
              textPaddingTop: 1,
              selectedColor: Colors.purpleAccent,
              unSelectedColor: Colors.white,
              borderColor: Colors.green,
              showIndex: true,
              textStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
              onTap: (String id, selected) {
                if (selected) {
                  tooth1.add(TeethModel(
                      id: id,
                      selectedColor: Colors.purpleAccent));
                } else {
                  tooth1.removeWhere((r) => r.id == id);
                }

                setState(() {});
              },
              teeth: tooth1,
            ),
          ),
          Expanded(
            child: TeethWidget(
              borderWith: 1,
              size: 800,
              textPaddingLeft: -10,
              textPaddingTop: 1,
              selectedColor: Colors.purpleAccent,
              unSelectedColor: Colors.white,
              borderColor: Colors.green,
              showIndex: true,
              textStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
              onTap: (String id, selected) {
                if (selected) {
                  tooth2.add(TeethModel(
                      id: id,
                      selectedColor: Colors.green,char: 'OK'));
                } else {
                  tooth2.removeWhere((r) => r.id == id);
                }

                setState(() {});
              },
              teeth: tooth2,
            ),
          ),
          Expanded(
            child: TeethWidget(
              borderWith: 1,
              size: 300,
              textPaddingLeft: -10,
              textPaddingTop: 1,
              selectedColor: Colors.purpleAccent,
              unSelectedColor: Colors.white,
              borderColor: Colors.green,
              textStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
              onTap: (String id, selected) {
                if (selected) {
                  tooth3.add(TeethModel(
                      id: id,
                      selectedColor: Colors.primaries[Random().nextInt(16)]));
                } else {
                  tooth3.removeWhere((r) => r.id == id);
                }

                setState(() {});
              },
              teeth: tooth3,
            ),
          ),
          Expanded(
            child: TeethWidget(
              borderWith: 3,
              size: 800,
              textPaddingLeft: -10,
              textPaddingTop: 1,
              selectedColor: Colors.purpleAccent,
              unSelectedColor: Colors.white,
              borderColor: Colors.black,
              textStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
              onTap: (String id, selected) {
                if (selected) {
                  tooth3.add(TeethModel(
                      id: id,
                      selectedColor: Colors.redAccent));
                } else {
                  tooth3.removeWhere((r) => r.id == id);
                }

                setState(() {});
              },
              teeth: tooth3,
            ),
          ),
        ],

      ),
    );
  }
}
