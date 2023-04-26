import 'package:flutter/material.dart';
import 'package:gallery_ui_with_pageview/Screen/Provider/gallery_provider.dart';
import 'package:gallery_ui_with_pageview/Screen/View/Dash_Screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    pt = Provider.of<GalleryProvider>(context,listen: true);
    pf = Provider.of<GalleryProvider>(context,listen: false);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0,top: 20),
            child: Text("Search",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.w500),),
          ),
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.only(left: 45,right: 45),
            height: 35,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                Icon(Icons.search,color: Colors.grey,),
                SizedBox(width: 10),
                Text("Search for photos/video")
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.only(left: 45,right: 45),
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Type",style: TextStyle(fontSize: 15,color: Colors.black),),
                SizedBox(width: 10),
                Text("More >",style: TextStyle(fontSize: 15,color: Colors.grey),)
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            // margin: EdgeInsets.only(left: 30),
            height: 170,
            child: ListView.builder(itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'view',arguments: index);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("${pf!.GList[index].img}",fit: BoxFit.fill,)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('${pf!.GList[index].name}',style: TextStyle(fontSize: 15,color: Colors.black),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('${pf!.GList[index].no}',style: TextStyle(fontSize: 15,color: Colors.grey),),
                  ),
                ],
              );
            },
              itemCount: pf!.GList.length,
              scrollDirection: Axis.horizontal,

            ),
          )
        ],
      ),
    );
  }
}
