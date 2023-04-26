import 'package:flutter/material.dart';
import 'package:gallery_ui_with_pageview/Screen/Provider/gallery_provider.dart';
import 'package:gallery_ui_with_pageview/Screen/View/Dash_Screen.dart';
import 'package:provider/provider.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    pt = Provider.of<GalleryProvider>(context,listen: true);
    pf = Provider.of<GalleryProvider>(context,listen: false);
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 10),
              child: Text("Photos",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.search,color: Colors.black,),
                  SizedBox(width: 30,),
                  Icon(Icons.settings,color: Colors.black,),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,bottom: 5),
              child: Text("Today",style: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.all(8),
              height: 400,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8),itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'view',arguments: index);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("${pf!.GList[index].img}",fit: BoxFit.fill,),
                  ),
                );
              },itemCount:pt!.GList.length,
              physics: BouncingScrollPhysics()),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,bottom: 5),
              child: Text("Yesterday",style: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.all(8),
              height: 400,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8),itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'view',arguments: index);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("${pf!.GList[index].img}",fit: BoxFit.fill,),
                  ),
                );
              },itemCount:pt!.GList.length,
              physics: BouncingScrollPhysics(),),
            )
          ],
        ),
      ),
    );
  }
}
