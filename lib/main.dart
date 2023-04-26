import 'package:flutter/material.dart';
import 'package:gallery_ui_with_pageview/Screen/Provider/gallery_provider.dart';
import 'package:gallery_ui_with_pageview/Screen/View/Dash_Screen.dart';
import 'package:gallery_ui_with_pageview/Screen/View/splace.dart';
import 'package:gallery_ui_with_pageview/Screen/View/view_photo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GalleryProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splace',
        routes: {
          '/':(context) => DashScreen(),
          'view':(context) => ViewPhoto(),
          'splace':(context) => Splace(),
        },
      ),
    ),
  );
}
