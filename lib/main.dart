import 'dart:js';

import 'package:flutter/material.dart';
import 'package:music_player_app_koko/models/playlist_provider.dart';
import 'package:music_player_app_koko/pages/home_page.dart';
import 'package:music_player_app_koko/pages/songa_page.dart';
import 'package:music_player_app_koko/themes/dark_mode.dart';
import 'package:music_player_app_koko/themes/light_mode.dart';
import 'package:music_player_app_koko/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>ThemeProvider()),
      ChangeNotifierProvider(create: (context)=>PlaylistProvider()),
    ],
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music_Player_App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomePage(),
      // home: SongPage(),
    );
  }
}
