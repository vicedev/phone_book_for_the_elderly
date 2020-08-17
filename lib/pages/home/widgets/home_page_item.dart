import 'package:flutter/material.dart';
import 'package:phonebookfortheelderly/common/utils.dart';

class HomePageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Stack(
                  children: <Widget>[
                    Image.network(
                      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597679998828&di=4fd6e9f11ed8425307d6ba9f77b98016&imgtype=0&src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2014%2F0829%2F372edfeb74c3119b666237bd4af92be5.jpg',
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white12,
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '姓名：xxxx',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              '号码：xxx',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      bottom: 0,
                      left: 0,
                      right: 0,
                    )
                  ],
                )),
                //打电话按钮
                Container(
                  height: 80,
                  color: Colors.green,
                  child: Center(
                    child: IconButton(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        onPressed: () => Utils.makePhoneCall(8888)),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
