import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_clone/screens/list/list_screen.dart';
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
      backgroundColor: Colors.black,
      floatingActionButton: isFAB ? _buildFAB() : _buildExtendedFAB(),
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
                icon: Image.network(
                  Resource.netflixLogo,
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
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    Resource.avatarLogo,
                    height: 35,
                  ),
                ),
              ),
            ],
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
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
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              "${Resource.baseUrl}/5bFK5d3mVTAvBCXi5NPWH0tYjKl.jpg",
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
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Popular on Netflix",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 170,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: Resource.populer.length,
                            padding: EdgeInsets.only(right: 30),
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                    "${Resource.baseUrl}${Resource.populer[index]}"),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 8);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "My List",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 170,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: Resource.populer.length,
                            padding: EdgeInsets.only(right: 30),
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                    "${Resource.baseUrl}${Resource.myList[index]}"),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 8);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.slideshow),
            label: 'Coming Soon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_outlined),
            label: 'Downloads',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Resource.black,
      ),
    );
  }

  Widget _buildFAB() => AnimatedContainer(
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

  Widget _buildExtendedFAB() => AnimatedContainer(
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
