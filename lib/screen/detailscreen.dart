// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/screen/audiorecorder.dart';

class DetailAudioScreen extends StatefulWidget {
  final audiodata;
  final int index;
   DetailAudioScreen({super.key, this.audiodata, required this.index});

  @override
  State<DetailAudioScreen> createState() => _DetailAudioScreenState();
}

class _DetailAudioScreenState extends State<DetailAudioScreen> {

  late AudioPlayer myaudioplayer;

  @override
void initState() {
  super.initState();
  myaudioplayer = AudioPlayer();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 260,
              child: Container(
                color: Color.fromARGB(255, 47, 166, 251),
              )),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              
              leading: IconButton(
                  onPressed: () =>Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back_ios_new_rounded)),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ],
            ),
            
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 220,
              height: 580,
              child: Container(
                //
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44), color: Colors.white
                    //    color: Colors.red,
                    ),
                child: Column(
                  children:  [
                    SizedBox(
                      height: 20,
                    ),
                   
                    
                    Text(
                      this.widget.audiodata[this.widget.index]["title"],
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      this.widget.audiodata[this.widget.index]["text"],
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    AudioRecorderFile(myaudioplayer:myaudioplayer, audiopath : this.widget.audiodata[this.widget.index]["audio"]),
                  
                   Container(
                      decoration: BoxDecoration(
                        color:  Colors.blue,
                        image: DecorationImage(image: AssetImage(this.widget.audiodata[this.widget.index]["img"]),
                        fit: BoxFit.cover)
                          
                        )
                      ),
                  ],

                  
                ),
              )),
       
        ],
      ),
    );
  }
}
