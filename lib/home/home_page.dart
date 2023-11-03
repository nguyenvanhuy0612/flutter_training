import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_training/login/login_page.dart';
import 'package:flutter_training/user/user_provider.dart';
import 'home_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  static List<Tab> tabs = <Tab>[
    Tab(
      text: 'Liên quan',
    ),
    Tab(
      text: 'Mới nhất',
    ),
    Tab(
      text: 'Bán chạy',
    ),
    Tab(
      text: 'Giá',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final currentUser = userProvider.currentUser;
    final searchController = TextEditingController();

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: homeAppBar(context),
        body: TabBarView(
          children: [
            TabContent(index: 0),
            TabContent(index: 1),
            TabContent(index: 2),
            TabContent(index: 3),
          ],
        ),
      ),
    );
  }

  AppBar homeAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.orangeAccent,
        ),
      ),
      title: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search icon press if needed
            },
          ),
        ]),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {},
            child: Icon(
              Icons.filter_alt_outlined,
              color: Colors.orangeAccent,
            ))
      ],
      bottom: TabBar(
        tabs: tabs,
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}

class TabContent extends StatelessWidget {
  final int index;

  TabContent({required this.index});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    List<String> data = homeProvider.getDataForTabIndex(index);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue,
          margin: EdgeInsets.all(8.0),
          child: Center(child: Text(data[index])),
        );
      },
      itemCount: data.length,
    );
  }
}
