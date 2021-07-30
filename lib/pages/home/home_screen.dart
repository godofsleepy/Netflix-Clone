import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/resource.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resource.black,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            floating: true,
            snap: false,
            pinned: true,
            leading: Image.asset(
              "assets/netflix-logo.png",
              height: 50,
            ),
            actions: [
              IconButton(
                splashRadius: 20,
                onPressed: () {},
                icon: Icon(Icons.search, color: Resource.white, size: 35),
              ),
              SizedBox(width: 8),
              IconButton(
                splashRadius: 24,
                onPressed: () {},
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
            automaticallyImplyLeading: false,
            backgroundColor: Resource.black,
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 50),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
