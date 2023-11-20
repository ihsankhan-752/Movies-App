import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/services/api_data_services.dart';
import 'package:movies_app/themes/app_color.dart';
import 'package:movies_app/views/widgets/popular_movies_slider.dart';
import 'package:movies_app/views/widgets/top_rated_movies_widget.dart';
import 'package:movies_app/views/widgets/upcoming_movies_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ApiDataServices apiDataServices = ApiDataServices();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xff2a2a2a),
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: AppColors.primaryWhite,
          ),
          backgroundColor: const Color(0xff2a2a2a),
          title: Text(
            "Home",
            style: GoogleFonts.acme(
              color: AppColors.primaryWhite,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            children: const [
              PopularMoviesSlider(),
              SizedBox(height: 30),
              TopRatedMoviesWidget(),
              SizedBox(height: 30),
              UpComingMoviesWidget(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
