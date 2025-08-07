import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //Playlist of songs
  final List<Song> _playlist = [
    //song 1
    Song(
      songName: "Bindunu Kalaka",
      artistName: "Priya Sooriyasena",
      albumArtImagePath: "assets/images/albumArt1.png",
      audioPath: "audios/Bindunu_Kalaka.mp3",
    ),

    //song 2
    Song(
      songName: "Sewwandiyakata",
      artistName: "Priya Sooriyasena",
      albumArtImagePath: "assets/images/albumArt2.png",
      audioPath: "audios/Sewuwandiyakata.mp3",
    ),

    //song3
    Song(
      songName: "Me_Bus_Nawathuma",
      artistName: "Priya Sooriyasena",
      albumArtImagePath: "assets/images/albumArt3.png",
      audioPath: "audios/Me_Bus_Nawathuma.mp3",
    ),
  ];

  //current song playing
  int? _currentSongIndex;

  /* 
  
  AUDIO PLAYER
  
  */

  //audio player

  final AudioPlayer _audioPlayer =
      AudioPlayer(); //create audio player class's object

  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PlaylistProvider() {
    listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;
  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    // await _audioPlayer.setSourceAsset(path);
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  //pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to specific position in the current song
  void seek(Duration position) async {
    _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() async {
    pause();
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //go to the next song if it is not the Last
        _currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if it is the last song
        _currentSongIndex = 0; //play from the beigining
      }
    }
    play();
  }

  //play previous song
  void playPreviousSong() async {
    pause();
    //if more than 2 seconds passed restart current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    //if it is within 2 seconds , go to previous song
    else {
      if (_currentSongIndex! > 0) {
        _currentSongIndex = _currentSongIndex! - 1;
      } else {
        //if it is first song (index = 0 ) , loop back to Last song
        _currentSongIndex = _playlist.length - 1;
      }
    }
    play();
  }

  //listen To duration
  void listenToDuration() async {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for current duration

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for song completion

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  //dispose audio player
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  /* 
  
  GETTERS

  */
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  /* 
  
  SETTERS

  */

  set currentSongindex(int? newIndex) {
    //update current song name
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play();
    }

    //update UI
    notifyListeners();
  }
}
