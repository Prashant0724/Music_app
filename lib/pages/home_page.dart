import 'package:flutter/material.dart';
import 'package:music_player_app_koko/components/my_drawer.dart';
import 'package:music_player_app_koko/models/playlist_provider.dart';
import 'package:music_player_app_koko/pages/songa_page.dart';
import 'package:provider/provider.dart';
import '../models/song.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get the playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //   get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  //  go to a song
  void goToSong(int songIndex) {
    //   update current song index
    playlistProvider.currentSongIndex = songIndex;

    //   navigate  to song page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SongPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("P L A Y L I S T"),
      ),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          // get the playlist
          final List<Song> playlist = value.playlist;

          // return list view UI
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              // get individual song
              final Song song = playlist[index];

              // return list tile UI
              return Padding(
                padding: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(song.songName),
                  subtitle: Text(song.artstName),
                  leading: Image.asset(song.albulmArtImagePath),
                  onTap: () => goToSong(index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
