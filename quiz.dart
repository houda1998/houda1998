import 'package:flutter/material.dart';
class Quiz extends StatefulWidget {
  int counter;
  Quiz(this.counter);
  @override
  _QuizState createState() => _QuizState();
}
class _QuizState extends State<Quiz> {
  int currentQuestion=0;
  int score=0;
  final quiz=[
    {'title':'1 X 1 ?','answers':[
      {'answer':'2', 'correct':false},
      {'answer':'1', 'correct':true},
      {'answer':'0', 'correct':false},
    ]},{'title':'capital du Maroc','answers':[
      {'answer':'Casablanca', 'correct':false},
      {'answer':'Rabat', 'correct':true},
      {'answer':'Marrakech', 'correct':false},
    ]},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Quiz'),
    backgroundColor: Colors.blueAccent,
    ),
    body:
    (this.currentQuestion>=quiz.length)?
    Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text('Score : ${(score/quiz.length*100).round()} %',style:

    TextStyle(color: Colors.lightBlue,fontSize: 22)),

    RaisedButton(
    color: Colors.lightBlue,
    onPressed: (){
    setState((){
    currentQuestion=0;
    score=0;
    });
    },
    child: Text('Restart ...',style: TextStyle(color:

    Colors.white,fontSize: 22),

    ))
    ]
    ))
    :ListView(
      children: <Widget>[
        ListTile(
          title: Center(child: Text('Question : ${currentQuestion+1}/${quiz.length}',style:
          TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.blue))) ,
        ),
        ListTile(
          title: Text ('${quiz[currentQuestion]['title']} ?',style: TextStyle(fontSize:

          22,fontWeight: FontWeight.bold),),),

        ...(quiz[currentQuestion]['answers'] as List<Map<String,Object>>).map((answer){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.lightBlue,
              onPressed: (){
                setState(() {
                  if(answer['correct']==true) ++score;
                  ++this.currentQuestion;
                });
              },
              child:Container(
                child: Align( alignment: Alignment.centerLeft,
                    child: Text(answer['answer'],style: TextStyle(color: Colors.white,fontSize: 22,fontWeight:
                    FontWeight.bold),)),padding: EdgeInsets.all(10),),
            ),
          );
        })
      ],
    ),
    );
  }}