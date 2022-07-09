import 'package:flutter/material.dart';


void main() => runApp(const VerseCard());


class VerseCard extends StatefulWidget {

  final chapter;
  final date;
  final translation;
  final content;



  const VerseCard({
    Key? key, this.chapter, this.date, this.translation, this.content
  }) : super(key: key);


  @override
  State<VerseCard> createState() => _VerseCardState();
}

class _VerseCardState extends State<VerseCard> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white30,
        margin: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(widget.chapter,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold ),),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.content,
                    style:  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  <Widget>[
                  Text(widget.date,
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),),
                  Text(widget.translation,
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),),
                ],
              ),
              const SizedBox(height: 10,)
            ],
          )
      ),
    );
  }
}

