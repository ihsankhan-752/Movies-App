import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/views/movie_detail_page.dart';

import '../utils/constants.dart';

class MoviesSlider extends StatelessWidget {
  final MoviesModel moviesModel;

  const MoviesSlider({super.key, required this.moviesModel});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: moviesModel.results!.length,
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MovieDetailPage(moviesModel: moviesModel, index: itemIndex)),
            );
          },
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(Constants.imagePath + moviesModel.results![itemIndex].posterPath!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 300,
        aspectRatio: 16 / 9,
        viewportFraction: 0.55,
        initialPage: 0,
        enableInfiniteScroll: true,
        pageSnapping: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
