import 'package:flutter/material.dart';
import 'package:gallery_ui_with_pageview/Screen/Provider/gallery_provider.dart';
import 'package:gallery_ui_with_pageview/Screen/View/Dash_Screen.dart';
import 'package:provider/provider.dart';

class Albume extends StatefulWidget {
  const Albume({Key? key}) : super(key: key);

  @override
  State<Albume> createState() => _AlbumeState();
}

class _AlbumeState extends State<Albume> {
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
              child: Text("Albume",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.search,color: Colors.black),
                  SizedBox(width: 20,),
                  Icon(Icons.add,color: Colors.black,),
                  SizedBox(width: 20,),
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
              height: 450,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 140),itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'view',arguments: index);
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("${pf!.GList[index].img}",fit: BoxFit.fill,)),
                      ),
                    ),
                    Text('${pf!.GList[index].name}',style: TextStyle(fontSize: 15,color: Colors.black),),
                    Text('${pf!.GList[index].no}',style: TextStyle(fontSize: 15,color: Colors.grey),),
                  ],
                );
              },itemCount:pf!.GList.length,
              physics: BouncingScrollPhysics(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
