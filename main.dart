import 'package:flutter/material.dart';
import 'package:myflutterapp/quiz.dart';
import 'Gallery.dart.dart';
import 'QRCodePage.dart';
import 'Weather.dart';
void main(){
  runApp(MaterialApp(home:MyApp(),));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    Scaffold (
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
             DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blueAccent, Colors.white])),
              child:
              Center(
                child: CircleAvatar(
                  radius: 50,backgroundImage: AssetImage('images/logo.png'),
                ),
              ),
            ),
            ListTile(
                title: Text(
                  'Quiz', style: TextStyle(fontSize: 22),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Quiz(5)));
                }),
            Divider(),
            ListTile(
                title: Text(
                  'Weather',style: TextStyle(fontSize: 22),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Weather()));
                }),
            Divider(),
            ListTile(
                title: Text(
                  'Gallery', style: TextStyle(fontSize: 22),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Gallery()));
                }),
            Divider(),
            ListTile(
                title: Text(
                  'QRCode', style: TextStyle(fontSize: 22),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => QRCodePage()));
                }),
          ],
        ),
      ),
      appBar: AppBar(title:Text('My APP'),backgroundColor: Colors.lightBlue,),
      body:Center(child:
      Text('Hello IIBDCC', style:TextStyle(fontSize: 28,color:Colors.blue),)),
      );
  }

}

