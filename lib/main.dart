import 'package:app_dog/page/list_dogs_widget.dart';
import 'package:app_dog/page/list_items_widget.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String urlAssets = "assets/images/";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children:[
            Padding(
              padding: EdgeInsets.all(15),
              child: appBar(),
            ),
            Expanded(
              child: body()
            ),
          ]
        )
      ),
    );
  }

  Widget appBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Icon(
            Icons.menu,
              color: Colors.black,
          ),
          onTap: () => print("click menu"),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children : [
            Text("Location"),
            Row(
              children: [
                Icon(
                  Icons.place,
                  color: Colors.brown,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Delhi, ',
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontSize: 19.0,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text:'india',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 19.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]
        ),
        CircleAvatar(
          backgroundImage: AssetImage(urlAssets+'profile_picture.jpg'),
          minRadius: 22.0,
        )
      ]
    );
  }


  Widget body(){
    return  ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.only(top: 40.0),
      shrinkWrap: true,
        children: [
          Container(
            height: 560,
            decoration: BoxDecoration(
              color: Colors.brown[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                    left: 30.0,
                    right: 30.0,
                  ),
                  child: inputSearch(),
                ),
                SizedBox(
                  height: 30.0,
                ),
                
                ListItemsWidget(),
                ListDogsWidget(),
              ]
            ),
          )
        ],
      );
  }

  Widget inputSearch(){
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        cursorColor: Colors.brown[200],
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 40.0,
            color: Colors.brown[200],
          ),
          suffixIcon: Icon(
            Icons.tune,
            color: Colors.brown[200],
            size: 28.0,
          ),
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.brown[200],
            fontSize: 18.0,
          ),
          hintText: 'Search a pet to adopt...',
        ),
      ),
    );
  }
}

