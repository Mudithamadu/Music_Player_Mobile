import 'package:flutter/material.dart';
import 'package:music_player/components/my_drawer.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get playlist provider
  late final dynamic playListProvider;

  @override
  void initState() {
    super.initState();

    //get playlist provider
    playListProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  //go to song
  void goToSong(int songIndex) {
    //update current song index
    playListProvider.currentSongindex = songIndex;
    //navigate to song page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SongPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text('P L A Y  L I S T')),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          //get playlist
          final List<Song> playlist = value.playlist;

          //return List view UI
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              //get individual song
              final Song song = playlist[index];

              //return title UI
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumArtImagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
