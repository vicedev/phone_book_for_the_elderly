import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('老年人专用手机通讯录'),
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: null)],
      ),
      body: Container(
        color: Colors.grey,
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: PageController(viewportFraction: 0.9),
            itemBuilder: (context, index) {
              return pageList[index];
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 3; i++) {
      pageList.add(_createPageItem());
    }
  }

  Widget _createPageItem() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(45)),
          color: Colors.white),
    );
  }
}
