import 'package:flutter/material.dart';
import 'package:gallery_ui_with_pageview/Screen/Provider/gallery_provider.dart';
import 'package:gallery_ui_with_pageview/Screen/View/Photo_Screen.dart';
import 'package:gallery_ui_with_pageview/Screen/View/Search_Screen.dart';
import 'package:gallery_ui_with_pageview/Screen/View/albume_Screen.dart';
import 'package:provider/provider.dart';

GalleryProvider? pt;
GalleryProvider? pf;

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    pt = Provider.of<GalleryProvider>(context,listen: true);
    pf = Provider.of<GalleryProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: pt!.i,
          children: [
            PhotoScreen(),
            Albume(),
            SearchScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            pf!.Changindex(value);
          },
          currentIndex: pt!.i,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.photo),label:'Photo'),
            BottomNavigationBarItem(icon: Icon(Icons.gradient_outlined),label:'Albume'),
            BottomNavigationBarItem(icon: Icon(Icons.search),label:'Search'),
          ],
        ),
      ),

    );
  }
}
