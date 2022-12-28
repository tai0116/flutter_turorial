class MovieInfo {
  final String imagePath; //サムネイル画像パス用
  final String iconPath; //アイコン画像パス用
  final String title; //動画タイトル用
  final String subTitle; //サブタイトル用

  MovieInfo({
    required this.imagePath,
    required this.iconPath,
    required this.title,
    required this.subTitle,
  });
}
