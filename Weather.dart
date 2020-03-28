
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:myflutterapp/WeatherForm.dart';
class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String city="";
  @override Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
          backgroundColor: Colors.blueAccent,),
        body:
        Column(
          children: <Widget>[
            Container(
              child: TextField(
                style: TextStyle(fontSize: 28),
                decoration: InputDecoration(hintText: 'taper une ville'),
                onChanged: (value){
                  setState(() {
                    this.city=value;
                  });
                },
              ),
            ),
            Container(child: RaisedButton(
              child: Text('Get Weather'),
              textColor:Colors.white , onPressed: (){
              //appel au navigateur
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>WeatherForm(city)));
              //   cityEditingController.text="";
            }, color: Colors.lightBlueAccent,

            ),)
          ],
        )
    );
  } }
