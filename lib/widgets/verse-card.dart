import 'package:flutter/material.dart';

void main() => runApp(const VerseCard());


class VerseCard extends StatefulWidget {
  const VerseCard({
    Key? key,
  }) : super(key: key);

  @override
  State<VerseCard> createState() => _VerseCardState();
}

class _VerseCardState extends State<VerseCard> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          // color: Colors.deepOrange[500],
          color: Colors.transparent,
          child: SizedBox(
            width: 400,
            height: 200,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    title: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0) ,
                        child: Center(
                            child: Text('Proverbs 27:14',
                              style: TextStyle(fontSize: 20),))),
                    subtitle: Center(child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("He who blesses his neighbor with a loud voice early in the morning, it will be taken as a curse by him.",
                        style:  TextStyle(fontSize: 18),),
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                    // padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const <Widget>[
                        Text('08/05/2022',
                          style: TextStyle(fontSize: 16.0),),
                        Text('World English Bible',
                          style: TextStyle(fontSize: 16.0),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}