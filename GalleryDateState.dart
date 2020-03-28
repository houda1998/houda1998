import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class GalleryData extends StatefulWidget {
  String keyword="";

  GalleryData(this.keyword);
  @override
  _GalleryDataState createState() => _GalleryDataState();
}
class _GalleryDataState extends State<GalleryData> {
int  currentPage=1;
int pageSize=10;
int totalPages=0;
List<dynamic>hits=[];
var galleryData;
ScrollController _scrollController=new ScrollController();
  @override
  void initState() {
    super.initState();this.loadData();
    this._scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        if(currentPage<totalPages){
          ++currentPage;
          this.loadData();
        }
      }
    });
  }
@override void dispose() {
// TODO: implement dispose
  super.dispose();
  _scrollController.dispose();
}
  void loadData(){
    String url="https://pixabay.com/api/?key=5832566-81dc7429a63c86e3b707d0429&q=${widget.keyword}&page=$currentPage&per_page=$pageSize";
 http.get(url).then((resp){
  setState(() {
    galleryData=json.decode(resp.body);
    hits.addAll(galleryData['hits']);

    if(galleryData['totalHits']%this.pageSize==0)
      this.totalPages=galleryData['totalHits']~/this.pageSize;
    else this.totalPages=1+(galleryData['totalHits']/this.pageSize).floor();
    print(hits);
  });
 }).catchError((err){
print(err);
 });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 print(widget.keyword);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
     title: Text("${widget.keyword},Page $currentPage/$totalPages"),
      ),
      body: (galleryData==null?Center(child: CircularProgressIndicator()):
          ListView.builder(
            itemCount: (galleryData==null?0:hits.length),
              controller: _scrollController,
              itemBuilder: (context,index){
              return Column(
                children:<Widget>[
                  Container(
                    width:double.infinity,
                    padding: EdgeInsets.only(left:10,right:10),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                            child: Text(hits[index]['tags'],style:TextStyle(fontSize:22,color:Colors.white,fontWeight:FontWeight.bold ),)
                        ),
                      ),
                      color:Colors.lightBlueAccent,
                    ),
                  ),
                  Container(
                    child: Card(
                      child: Image.network(hits[index]['webformatURL'],fit:BoxFit.fitWidth),
                    ),
                  padding: EdgeInsets.only(left:10,right:10),
                  ),
                ],
              );
              }
          )
      ),
      );
  }
}

