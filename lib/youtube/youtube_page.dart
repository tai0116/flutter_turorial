import 'package:flutter/material.dart';
import 'package:flutter_turorial/youtube/movie_info.dart';

class YouTubePage extends StatelessWidget {
  YouTubePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => YouTubePage(),
    );
  }

  final List<MovieInfo> _dummyMovieData = [
    MovieInfo(
      imagePath: 'https://i.ytimg.com/vi/KGsloLCpDfk/maxresdefault.jpg',
      iconPath: 'images/youtube.png',
      title: 'title1',
      subTitle: 'subTitle1',
    ),
    MovieInfo(
      imagePath: 'https://i.ytimg.com/vi/KGsloLCpDfk/maxresdefault.jpg',
      iconPath: 'images/youtube.png',
      title: 'title2',
      subTitle: 'subTitle2',
    ),
    MovieInfo(
      imagePath: 'https://i.ytimg.com/vi/KGsloLCpDfk/maxresdefault.jpg',
      iconPath: 'images/youtube.png',
      title: 'title3',
      subTitle: 'subTitle3',
    ),
    MovieInfo(
      imagePath: 'https://i.ytimg.com/vi/KGsloLCpDfk/maxresdefault.jpg',
      iconPath: 'images/youtube.png',
      title: 'title4',
      subTitle: 'subTitle4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.asset('images/youtube.png'),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          _AppBarActions(),
        ],
        backgroundColor: Colors.black,
      ),
      body: _Body(dummyMovieData: _dummyMovieData),
      bottomNavigationBar: const _BottomNavigation(),
    );
  }
}

class _AppBarActions extends StatelessWidget {
  const _AppBarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Icon(Icons.cast),
        SizedBox(width: 16),
        Icon(Icons.notifications_none),
        SizedBox(width: 16),
        Icon(Icons.search_rounded),
        SizedBox(width: 16),
        IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.purple,
          ),
          onPressed: null,
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key, required this.dummyMovieData}) : super(key: key);

  final List<MovieInfo> dummyMovieData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: const [
            CreateCategoryButton(
              icon: Icons.local_fire_department_sharp,
              icon2: Icons.music_note,
              label: '急上昇',
              label2: '音楽',
            ),
            CreateCategoryButton(
              icon: Icons.videogame_asset,
              icon2: Icons.text_snippet,
              label: 'ゲーム',
              label2: 'ニュース',
            ),
            CreateCategoryButton(
              icon: Icons.lightbulb,
              icon2: Icons.wifi_tethering,
              label: '学び',
              label2: 'ライブ',
            ),
            CreateCategoryButton(
              icon: Icons.sports_baseball,
              icon2: null,
              label: 'スポーツ',
              label2: '',
            ),
          ],
        ),
        const _HotVideos(),
        _HotVideosList(dummyMovieData: dummyMovieData),
      ],
    );
  }
}

class _HotVideosList extends StatelessWidget {
  const _HotVideosList({
    Key? key,
    required this.dummyMovieData,
  }) : super(key: key);

  final List<MovieInfo> dummyMovieData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dummyMovieData.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 320,
          child: Column(
            children: [
              Image.network(dummyMovieData[index].imagePath),
              ListTile(
                title: Text(
                  dummyMovieData[index].title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  dummyMovieData[index].subTitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                leading: CircleAvatar(
                  radius: 22,
                  child: Image.asset(dummyMovieData[index].iconPath),
                ),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HotVideos extends StatelessWidget {
  const _HotVideos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: const Text(
        '急上昇動画',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CreateCategoryButton extends StatelessWidget {
  const CreateCategoryButton({
    Key? key,
    this.icon,
    this.icon2,
    this.label,
    this.label2,
  }) : super(key: key);

  final IconData? icon;
  final IconData? icon2;
  final String? label;
  final String? label2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final halfButtonWidth = (size.width - 16) / 2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
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
                const SizedBox(width: 8),
                Text(label ?? ''),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
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
                const SizedBox(width: 8),
                Text(label2 ?? ''),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      unselectedFontSize: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '検索',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_sharp),
          label: 'チャンネル',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_sharp),
          label: 'ライブラリ',
        ),
      ],
    );
  }
}
