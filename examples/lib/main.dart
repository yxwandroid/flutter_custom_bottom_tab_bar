import 'package:flutter/material.dart';
import 'package:flutter_custom_bottom_tab_bar/eachtab.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '今日头条',
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.blue,
      ),
//      routes: getRouters(),
      home: Entry(),
    );
  }
}

class Entry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EntryState();
  }
}

class EntryState extends State<Entry> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;
  var titles = ['首页', '西瓜视频', '找人', '小视频', '我的'];
  var icons = [
    Icons.home,
    Icons.play_arrow,
    Icons.child_friendly,
    Icons.fiber_new,
    Icons.mic_none
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(vsync: this, initialIndex: 0, length: titles.length);
    _tabController.addListener(() {
      setState(() => _selectedIndex = _tabController.index);
      print("liucheng-> ${_tabController.indexIsChanging}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 46,
        child: Column(
          children: <Widget>[
            Divider(
              height: 2,
            ),
            new TabBar(
              isScrollable: false,
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.red,
              labelPadding: EdgeInsets.all(0),
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                EachTab(
                    width: 70,
                    badgeNo: '100',
                    badgeColor: Colors.black,
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 0
                        ? Image.asset(
                            'assets/imgs/tab_home_selected.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'assets/imgs/tab_home.png',
                            width: 20,
                            height: 20,
                          ),
                    text: titles[0],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
                EachTab(
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 1
                        ? Image.asset(
                            'assets/imgs/tab_xigua_selected.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'assets/imgs/tab_xigua.png',
                            width: 20,
                            height: 20,
                          ),
                    text: titles[1],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
                EachTab(
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 2
                        ? Image.asset(
                            'assets/imgs/tab_find_selected.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'assets/imgs/tab_find.png',
                            width: 20,
                            height: 20,
                          ),
                    text: titles[2],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
                EachTab(
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 3
                        ? Image.asset(
                            'assets/imgs/tab_video_selected.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'assets/imgs/tab_video.png',
                            width: 20,
                            height: 20,
                          ),
                    text: titles[3],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
                EachTab(
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 4
                        ? Image.asset(
                            'assets/imgs/tab_me_selected.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'assets/imgs/tab_me.png',
                            width: 20,
                            height: 20,
                          ),
                    text: titles[4],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), //设置滑动的效果，这个禁用滑动
        controller: _tabController,
        children: <Widget>[
          Home(),
          Text(titles[1]),
          Text(titles[2]),
          Text(titles[3]),
          Text(titles[4]),
        ],
      ),
    );
  }
}
