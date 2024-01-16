import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../vo/Results.dart';

class MovieGridViewWidget extends StatefulWidget {
  final Results item;

  const MovieGridViewWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<MovieGridViewWidget> createState() => _MovieGridViewWidgetState();
}

class _MovieGridViewWidgetState extends State<MovieGridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${widget.item.poster_path}",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 4,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rate,
              color: Colors.yellowAccent,
            ),
            SizedBox(
              width: 2,
            ),
            Text("Rating: ${widget.item.vote_average?.toStringAsFixed(1)??"평가없음"}"),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Text(widget.item.title.toString()),
        ),
      ],
    );
  }
}
