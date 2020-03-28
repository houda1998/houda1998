import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
class WeatherForm extends StatefulWidget {
  String city="";
  WeatherForm(this.city);
  @override
  _State createState() => _State();
}

class _State extends State<WeatherForm> {
  var weatherData;
  @override
  void initState(){
    super.initState();
    getData(widget.city);
  }
  getData(String city){
    print("Getting weather of"+city);
    String url='https://samples.openweathermap.org/data/2.5/forecast?q=$city,DE&appid=b6907d289e10d714a6e88b30761fae22';
    http.get(url).then((resp){
      setState(() {
        this.weatherData=json.decode(resp.body);
        print(this.weatherData);
      });

    }).catchError((err){

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather of city ${widget.city}'),
          backgroundColor: Colors.indigo,
        ),
        body:
        (weatherData==null? Center(child: CircularProgressIndicator(),):
        ListView.builder(
            itemCount: (weatherData==null?0:weatherData['list'].length),
            itemBuilder: (context,index){
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:AssetImage("images/${weatherData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png"),
                    ),
                    Text(
                      "${new DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt']*1000000) )}",
                      style: TextStyle(fontSize: 22),),
                    Text(
                      " ${weatherData['list'][index]['main']['temp'].round()}°C"
                      ,style: TextStyle(fontSize: 22),),

                  ],
                ),
              );
            })
        )
    );
  }
}