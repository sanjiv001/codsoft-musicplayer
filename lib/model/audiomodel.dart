class AudioModel {
  final String name;
  final String imageUrl;
  final String artist;
  final double length;
  late final bool isFav;

  AudioModel({
    required this.name,
    required this.imageUrl,
    required this.artist,
    required this.length,
    required this.isFav,
  });
}

List<AudioModel> musicList = [
  AudioModel(
    name: "Lose it",
    imageUrl: "assets/images/1.jpg",
    artist: "Flume ft. Vic Mensa",
    length: 345,
    isFav: true,
  ),
  AudioModel(
    name: "Helix",
    imageUrl: "assets/images/2.jpg",
    artist: "Flume",
    length: 430,
    isFav: false,
  ),
  AudioModel(
    name: "Say It",
    imageUrl: "assets/images/3.jpg",
    artist: "Flume ft. Tove Lo",
    length: 250,
    isFav: false,
  ),
  AudioModel(
    name: "Never Be Like You",
    imageUrl: "assets/images/4.jpg",
    artist: "Flume • Kai",
    length: 500,
    isFav: true,
  ),
  AudioModel(
    name: "Numb & Getting Colder",
    imageUrl: "assets/images/5.jpg",
    artist: "Flume • KUCKA",
    length: 330,
    isFav: true,
  ),
  AudioModel(
    name: "Wall Out",
    imageUrl: "assets/images/6.jpg",
    artist: "Flume",
    length: 250,
    isFav: false,
  ),
  AudioModel(
    name: "Pika",
    imageUrl: "assets/images/7.jpg",
    artist: "Flume ft. Tove Lo",
    length: 450,
    isFav: true,
  ),
  AudioModel(
    name: "Space Cadet",
    imageUrl: "assets/images/8.jpg",
    artist: "Flume ft. Tove",
    length: 450,
    isFav: true,
  ),
  AudioModel(
    name: "Hyperreal",
    imageUrl: "assets/images/9.jpg",
    artist: "Tove Lo",
    length: 450,
    isFav: false,
  ),
  AudioModel(
    name: "Smoke & Retribution",
    imageUrl: "assets/images/10.jpg",
    artist: "Flume • KUCKA",
    length: 450,
    isFav: false,
  ),
];



class MusicModel {
  final String musicName;
  final String author;
  final String cover;
  final String path;

  MusicModel(
      {required this.cover,
      required this.author,
      required this.musicName,
      required this.path});
}

List<MusicModel> musics = [
  MusicModel(
      cover: "https://i.scdn.co/image/ab67616d0000b273b9659e2caa82191d633d6363",
      author: "Konsta",
      musicName: "O'zbekistonlik",
      path: '1.mp3'),
  MusicModel(
      cover:
          "https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/8c/81/ae/8c81aec1-6bad-ecd2-691b-e0bbcdb2e600/cover.jpg/1200x1200bb.jpg",
      author: "Konsta & Timur Alixanov",
      musicName: "Odamlar nima deydi?",
      path: '2.mp3'),
  MusicModel(
      cover:
          "https://cdns-images.dzcdn.net/images/cover/7c99f6bb157544db8775430007bb7979/264x264.jpg",
      author: "Jon Caryl ",
      musicName: "Alone",
      path: '3.mp3'),
  MusicModel(
      cover:
          "https://is3-ssl.mzstatic.com/image/thumb/Music112/v4/9f/a7/98/9fa798ea-25fc-f447-196a-c9f8bc894669/cover.jpg/600x600bf-60.jpg",
      author: "Konsta && Shokir ",
      musicName: "Poyga",
      path: '4.mp3'),
];