import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 0,
            direction: Axis.horizontal, // 가로 정렬
            allowHalfRating: true, // 0.5점 단위 : true, 1점 단위 false
            itemCount: 5, // 리뷰의 별점 갯수
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ),
      ),
    );
  }
}
