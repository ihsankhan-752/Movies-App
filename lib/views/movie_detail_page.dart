// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/services/api_data_services.dart';
import 'package:movies_app/themes/app_color.dart';
import 'package:movies_app/utils/constants.dart';
import 'package:movies_app/views/movie_trailer_screen.dart';

class MovieDetailPage extends StatelessWidget {
  final MoviesModel moviesModel;
  final int index;
  const MovieDetailPage({super.key, required this.moviesModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2a2a2a),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlack,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: () async {
            Map<String, dynamic> movieKey = await ApiDataServices().movieTrailer(moviesModel.results![index].id!);
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieTrailerScreen(videoId: movieKey['results'][index]['key']),
                ),
              );
            });
          },
          child: Text(
            "Watch Trailer",
            style: GoogleFonts.acme(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryWhite,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.primaryWhite,
        ),
        backgroundColor: const Color(0xff2a2a2a),
        title: Text(
          "${moviesModel.results![index].title}",
          style: GoogleFonts.acme(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.6,
            color: AppColors.primaryWhite,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height * 0.02, vertical: 10),
            height: MediaQuery.sizeOf(context).height * 0.3,
            width: MediaQuery.sizeOf(context).width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: Constants.imagePath + moviesModel.results![index].backdropPath!,
                fit: BoxFit.cover,
                placeholder: (context, url) => spinKit2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Text(
                    moviesModel.results![index].title!,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryWhite,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.favorite, color: Colors.red),
                const SizedBox(width: 10),
                Text(
                  (moviesModel.results![index].voteAverage!).toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.blue, thickness: 0.6),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Release Date",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryWhite,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              moviesModel.results![index].releaseDate!,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Overview",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryWhite,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              moviesModel.results![index].overview!,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

const spinKit2 = SpinKitFadingCircle(
  color: Colors.blue,
  size: 50,
);
