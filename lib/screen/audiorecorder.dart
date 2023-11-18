// ignore_for_file: prefer_final_fields

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioRecorderFile extends StatefulWidget {
  final AudioPlayer myaudioplayer;
  final String audiopath;
  
  const AudioRecorderFile(
      {super.key, required this.myaudioplayer, required this.audiopath});

  @override
  State<AudioRecorderFile> createState() => _AudioRecorderFileState();
}

class _AudioRecorderFileState extends State<AudioRecorderFile> {
  final player = AudioPlayer();
  Duration _duration = new Duration();
  Duration _position = new Duration();
  bool isPlaying = false;
  bool isPaused = false;
 final url  =
      "https://st.bslmeiyu.com/uploads/%e6%9c%97%e6%96%87%e5%9b%bd%e9%99%85SBS%e7%b3%bb%e5%88%97/%e6%9c%97%e6%96%87%e5%9b%bd%e9%99%85%e8%8b%b1%e8%af%ad%e6%95%99%e7%a8%8b%e7%ac%ac1%e5%86%8c_V2/%e5%ad%a6%e7%94%9f%e7%94%a8%e4%b9%a6/P149_Chapter%2016_Vocabulary%20Preview.mp3";

  bool isRepeat = false;
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  // slider function
  Widget slider() {
    return Slider(
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        });
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.myaudioplayer.seek(newDuration);
  }

// btn init
  void initState() {
    super.initState();
  
    this.widget.myaudioplayer.onDurationChanged.listen((a) {
      setState(() {
        _duration = a;
      });
    });
    this.widget.myaudioplayer.onDurationChanged.listen((b) {
      setState(() {
        _position = b;
      });
    });
  
    this.widget.myaudioplayer.setSourceUrl(url);
    this.widget.myaudioplayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if (isRepeat = true) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });
  }
 


 
  Future <void> playAudioFromUrl(String url) async {
    await player.play(UrlSource(url));
  }

  Widget btnstrt() {
    return IconButton(
        padding: EdgeInsets.only(bottom: 10),
        onPressed: ()  async {
         
           if (isPlaying == false) {
            
            playAudioFromUrl(url);
            // print("stop");
            setState(() {
              isPlaying = true;
            });
          } else if (isPlaying == true) {
            this.widget.myaudioplayer.pause();
           // print("start");
            setState(() {
              isPlaying = false;
            });
          }
         },
        icon: isPlaying == false
            ? Icon(
                _icons[0],
                color: Colors.blueGrey,
                size: 40,
              )
            : Icon(
                _icons[1],
                color: Colors.blueGrey,
                size: 40,
              ));
  }

  Widget Backwardbtn() {
    return IconButton(
      icon: const ImageIcon(
        AssetImage('assets/images/backword.png'),
        size: 15,
        color: Colors.black,
      ),
      onPressed: () {
        this.widget.myaudioplayer.setPlaybackRate(0.5);
      },
    );
  }

  Widget Forwardbtn() {
    return IconButton(
      icon: const ImageIcon(
        AssetImage('assets/images/forward.png'),
        size: 15,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      onPressed: () {
        this.widget.myaudioplayer.setPlaybackRate(0.5);
      },
    );
  }

  Widget Loopbtn() {
    return IconButton(
      icon: const ImageIcon(
        AssetImage('assets/images/loop.png'),
        size: 15,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      onPressed: () {
        this.widget.myaudioplayer.setPlaybackRate(0.5);
      },
    );
  }

  Widget Repeatbtn() {
    return IconButton(
      icon: const ImageIcon(
        AssetImage('assets/images/repeat.png'),
        size: 15,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      onPressed: () {
        if (isRepeat == false) {
          this.widget.myaudioplayer.setReleaseMode(ReleaseMode.loop);
          setState(() {
            isRepeat = true;
            this.widget.myaudioplayer.setReleaseMode(ReleaseMode.loop);
          });
        } else if (isRepeat = true) {
          this.widget.myaudioplayer.setReleaseMode(ReleaseMode.release);
          isRepeat = false;
        }
      },
    );
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Repeatbtn(),
          Backwardbtn(),
          btnstrt(),
          Forwardbtn(),
          Loopbtn(),
        ],
      ),
    );
  }




  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _position.toString().split(".")[0],
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                _duration.toString().split(".")[0],
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        slider(),
        loadAsset(),
      ],
    );
  }
}
