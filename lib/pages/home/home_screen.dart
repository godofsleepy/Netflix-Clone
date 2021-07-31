import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_clone/pages/list/list_screen.dart';
import 'package:netflix_clone/utils/resource.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  bool isFAB = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50) {
        setState(() {
          isFAB = true;
        });
      } else {
        setState(() {
          isFAB = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resource.black,
      floatingActionButton: isFAB ? buildFAB() : buildExtendedFAB(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            floating: true,
            snap: false,
            pinned: true,
            brightness: Brightness.dark,
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
            backgroundColor: Resource.black,
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 50),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
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
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500/5bFK5d3mVTAvBCXi5NPWH0tYjKl.jpg",
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Exciting",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "•",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Sports",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "•",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text("TV"),
                            Text(
                              "•",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Animation",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                            ),
                            onPressed: () {},
                            child: Column(
                              children: [
                                Icon(Icons.add),
                                Text("My List"),
                              ],
                            ),
                          ),
                          Container(
                            width: 90,
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                primary: Resource.black,
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {},
                              label: Text(
                                "Play",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              icon: Icon(Icons.play_arrow),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                            ),
                            onPressed: () {},
                            child: Column(
                              children: [
                                Icon(Icons.info_outline),
                                Text("Info"),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFAB() => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
        width: 50,
        height: 50,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Resource.redAccent,
          onPressed: () {},
          child: Icon(Icons.shuffle),
        ),
      );

  Widget buildExtendedFAB() => AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
        width: 190,
        height: 50,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          onPressed: () {},
          icon: Icon(
            Icons.shuffle,
            color: Resource.redAccent,
          ),
          label: Center(
            child: Text(
              "Play Something",
              style: TextStyle(
                fontSize: 15,
                color: Resource.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
}
