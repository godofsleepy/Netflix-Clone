import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/resource.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ScrollController _scrollController = ScrollController();
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
            title: Text("TV Shows"),
            actions: [
              IconButton(
                splashRadius: 20,
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Resource.white,
                  size: 35,
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                splashRadius: 24,
                icon: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png",
                  height: 35,
                ),
              ),
            ],
            backgroundColor: Resource.black.withOpacity(0.5),
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 50),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Resource.black.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: "TV Shows",
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          "TV Shows",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
