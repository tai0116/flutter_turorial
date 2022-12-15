import 'package:flutter/material.dart';

class YouTubePage extends StatefulWidget {
  const YouTubePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const YouTubePage(),
    );
  }

  @override
  State<YouTubePage> createState() => _YouTubePageState();
}

class _YouTubePageState extends State<YouTubePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final halfButtonWidth = (size.width - 16) / 2;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.asset('images/youtube.png'),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Icon(Icons.cast),
          SizedBox(width: 16),
          Icon(Icons.notifications_none),
          SizedBox(width: 16),
          Icon(Icons.search_rounded),
          SizedBox(width: 16),
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.lightGreen,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              createCategoryButton(
                halfButtonWidth,
                Icons.local_fire_department_sharp,
                Icons.music_note,
                '急上昇',
                '音楽',
              ),
              createCategoryButton(
                halfButtonWidth,
                Icons.videogame_asset,
                Icons.text_snippet,
                'ゲーム',
                'ニュース',
              ),
              createCategoryButton(
                halfButtonWidth,
                Icons.lightbulb,
                Icons.wifi_tethering,
                '学び',
                'ライブ',
              ),
              createCategoryButton(
                halfButtonWidth,
                Icons.sports_baseball,
                Icons.music_note,
                'スポーツ',
                '',
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              '急上昇動画',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                height: 300,
                child: Column(
                  children: [
                    Image.network(
                      'https://i.ytimg.com/vi/KGsloLCpDfk/maxresdefault.jpg',
                    ),
                    ListTile(
                      title: Text(
                        'title',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        'subtitle',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 22,
                        child: Image.asset('images/youtube.png'),
                      ),
                      trailing: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: null,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'お気に入り'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'お知らせ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'お知らせ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget createCategoryButton(halfButtonWidth, IconData icon, IconData icon2,
      String label, String label2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
          width: halfButtonWidth,
          height: 55,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: 8),
                Text(label),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
          width: halfButtonWidth,
          height: 55,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            child: Row(
              children: [
                Icon(icon2),
                SizedBox(width: 8),
                Text(label2),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
