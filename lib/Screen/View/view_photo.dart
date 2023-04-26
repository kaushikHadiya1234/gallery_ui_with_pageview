import 'package:flutter/material.dart';
import 'package:gallery_ui_with_pageview/Screen/Provider/gallery_provider.dart';
import 'package:gallery_ui_with_pageview/Screen/View/Dash_Screen.dart';
import 'package:provider/provider.dart';

class ViewPhoto extends StatefulWidget {
  const ViewPhoto({Key? key}) : super(key: key);

  @override
  State<ViewPhoto> createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhoto> {
  @override
  Widget build(BuildContext context) {
    pt = Provider.of<GalleryProvider>(context,listen: true);
    pf = Provider.of<GalleryProvider>(context,listen: false);
    int d = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          height: 400,
          child: PageView.builder(itemBuilder: (context, index) {
            return Container(
              height: 300,
              child: Image.asset('${pf!.GList[index].img}',fit: BoxFit.fill,),
            );
          },
            itemCount: pt!.GList.length,
            controller: PageController(initialPage: d),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ios_share),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.edit),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: ""),
          BottomNavigationBarItem(icon: InkWell(onTap: () {
            pf!.deletephoto(d);
          },child: Icon(Icons.delete)),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz_rounded),label: ""),
        ],
      ),
    );
  }
}
