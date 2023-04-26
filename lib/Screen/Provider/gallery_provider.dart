
import 'package:flutter/cupertino.dart';
import 'package:gallery_ui_with_pageview/Screen/Model/Gallery_Model.dart';

class GalleryProvider extends ChangeNotifier
{

  List<GalleryModel> GList = [
    GalleryModel(img: "assets/images/w1.jpg",name: 'All photo',no: '5637'),
    GalleryModel(img: "assets/images/w2.jpg",name: 'Recent',no: '995'),
    GalleryModel(img: "assets/images/w3.jpg",name: 'Video',no: '252'),
    GalleryModel(img: "assets/images/w4.jpg",name: 'Screenshot',no: '450'),
    GalleryModel(img: "assets/images/w5.jpg",name: 'Whatsapp photo',no: '102'),
    GalleryModel(img: "assets/images/w6.jpg",name: 'Whatsapp video',no: '216'),
    GalleryModel(img: "assets/images/w7.jpg",name: 'Download',no: '50'),
    GalleryModel(img: "assets/images/w8.jpg",name: 'Photo Editor',no: '60'),
  ];
  int i=0;
  void Changindex(int index)
  {
    i=index;
    notifyListeners();
  }
  void deletephoto(int index)
  {
    GList.removeAt(index);
  }
}