import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioe_example/musicplayer.dart';



class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});
  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
 final player=AudioPlayer();
  late AudioCache audioCache;
  bool isplay=false;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            playsound();

          },
          child: const Text(
            "Play Song",
          ),
        )
      ],
    );
  }

  Future<void> playsound() async {
    String audiopath = "audio/musics.mp3";
    await player.play(AssetSource(audiopath));
     
  }
}
