import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/list/list_screen.dart';
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
            leading: FittedBox(
              fit: BoxFit.cover,
              child: IconButton(
                onPressed: null,
                icon: Image.asset(
                  "assets/netflix-logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
            automaticallyImplyLeading: false,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ListScreen()));
                      },
                      child: Hero(
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
                    ),
                    Text(
                      "Movies",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "My List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
