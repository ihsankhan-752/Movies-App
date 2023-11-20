import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/movies_model.dart';
import '../../services/api_data_services.dart';
import '../../themes/app_color.dart';
import '../../widgets/movies_slider.dart';

class PopularMoviesSlider extends StatelessWidget {
  const PopularMoviesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    ApiDataServices apiDataServices = ApiDataServices();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Movies",
          style: GoogleFonts.acme(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryWhite,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.35,
          child: FutureBuilder<MoviesModel>(
            future: apiDataServices.getMovies('popular'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitCircle(
                    size: 50,
                    color: Colors.blue,
                  ),
                );
              }
              return MoviesSlider(moviesModel: snapshot.data!);
            },
          ),
        ),
      ],
    );
  }
}
