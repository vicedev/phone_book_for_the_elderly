import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phonebookfortheelderly/common/v_colors.dart';
import 'package:phonebookfortheelderly/pages/home/widgets/home_page_item.dart';

/// 首页
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
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: Container(
        color: VColors.bgColor,
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pageList.length,
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
      pageList.add(HomePageItem());
    }
  }
}
