import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phonebookfortheelderly/common/contact_model.dart';
import 'package:phonebookfortheelderly/common/data_utils.dart';
import 'package:phonebookfortheelderly/common/route_constant.dart';
import 'package:phonebookfortheelderly/common/v_colors.dart';
import 'package:phonebookfortheelderly/pages/home/widgets/home_page_item.dart';
import 'package:uuid/uuid.dart';

/// 首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomePageItem> pageList = [];
  List<ContactModel> dataModelList = [];

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
        child: (pageList == null || pageList.length == 0)
            ? Center(
          child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteConstant.add);
              }),
        )
            : PageView.builder(
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
//    for (var i = 0; i < 3; i++) {
//      DataModel dataModel = DataModel(Uuid().v1());
//      dataModelList.add(dataModel);
//      pageList.add(HomePageItem(dataModel));
//    }
    _refreshData();
  }

  _refreshData() async {
    List<ContactModel> contacts = await DataUtils.queryAll();
    if (contacts != null) {
      contacts.forEach((contact) {
        dataModelList.add(contact);
        pageList.add(HomePageItem(contact));
      });
    }
  }
}
