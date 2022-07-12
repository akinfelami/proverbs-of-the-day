import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        margin: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 10,),
               ListTile(
                title: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(widget.date,
                        style: const TextStyle(
                          fontStyle:
                          FontStyle.italic, ),),
                    ],
                  ),
                ),
                subtitle: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Text(widget.content, textAlign: TextAlign.justify,
                    style: GoogleFonts.libreBaskerville(fontSize: 16,
                      fontWeight: FontWeight.w500, color: Colors.black, ),),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  <Widget>[
                    Text('- '+ widget.chapter,
                      style:  const TextStyle(
                        fontSize: 16,
                        fontWeight:
                        FontWeight.w600,
                        fontStyle:
                        FontStyle.italic, ),),
                    Text(widget.translation,
                      style: const TextStyle(fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
              const SizedBox(height: 10,)
            ],
          )
      ),
    );
  }
}

