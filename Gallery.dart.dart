import 'package:flutter/material.dart';
import 'package:myflutterapp/GalleryDateState.dart';
class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() =>
      _GalleryState();
}
class _GalleryState extends State<Gallery> {
  String keyword="";
  TextEditingController editingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, title: Text(keyword)
    ),
    body: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    children: <Widget>[
    TextField(
   style: TextStyle(fontSize: 28),
    onChanged: (value){
    setState((){ this.keyword=value; });
    },
    controller: editingController,
      decoration: InputDecoration(hintText: 'Taper un lieu'),
    onSubmitted: (value){
     this.keyword=value;
     Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryData(this.keyword)));
    },
    ),
    Container(
    width: double.infinity,
    child: RaisedButton(
    onPressed: (){
    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>GalleryData(keyword)));
    editingController.text="";
    }, color: Colors.blueAccent,textColor: Colors.white,child: Text('Get Images',style :TextStyle(fontSize:28,color:Colors.white)),
    ),
    ),
    ],
    ),
    ),
    );
  }
}
