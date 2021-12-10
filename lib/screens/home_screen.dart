import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/home.dart';

import 'categories_screen.dart';
import '../widgets/image_input.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NutriVision'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.food_bank),
          onPressed: () {
            Navigator.of(context).pushNamed(CategoriesScreen.routeName);
          },
        ),
      ]),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      ImageInput(_selectImage),
                    ],
                  ),
                ),
              ),
            ),
            // ignore: deprecated_member_use
            RaisedButton.icon(
              icon: Icon(Icons.food_bank),
              label: Text("Search food by Name"),
              onPressed: () {
                Navigator.of(context).pushNamed(Home.routeName);
              },
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Theme.of(context).accentColor,
            ),
            // ignore: deprecated_member_use
            SizedBox(
              height: 10,
            ),
            // ignore: deprecated_member_use
            RaisedButton.icon(
              icon: Icon(Icons.fastfood_rounded),
              label: Text("Find food"),
              onPressed: () async {
                String fileName = _pickedImage.path.split('/').last;
                FormData formData = FormData.fromMap({
                  "image": await MultipartFile.fromFile(_pickedImage.path,
                      filename: fileName),
                });
                var response = await Dio()
                    .post("http://10.0.2.2:8000/detect_api", data: formData);
                print(response);
                Navigator.of(context).pushNamed(Home.routeName,
                    arguments: response.toString().replaceAll("_", " "));
              },
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
