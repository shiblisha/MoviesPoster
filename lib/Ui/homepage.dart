import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_details/Bloc/movie_bloc.dart';
import 'package:movie_details/Ui/more.dart';

import '../Repository/ModelClass/MovieModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

late List<MovieModel> movies;
List <String>gener=[];

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(FetchMovieDetails());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    final double itemHeight = mheight * 0.3;
    final double itemWidth = size.width / 2;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: Text(
              "Trending Now",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: mwidth * 0.02,
              )
            ]),
        body: SafeArea(
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieBlocLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is MovieBlocLoaded) {
                movies = BlocProvider.of<MovieBloc>(context).trendingMovies;

                return GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    padding: EdgeInsets.only(
                        top: mheight * 0.026,
                        left: mwidth * 0.02,
                        right: mwidth * 0.015),
                    crossAxisCount: 2,
                    mainAxisSpacing: mwidth * 0.008,
                    shrinkWrap: true,
                    children:
                        List.generate(movies.length, growable: false, (index) {
                          gener=movies[index].genre!;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MorePage(
                                        image: movies[index].image.toString(),
                                        title: movies[index].title.toString(),
                                        rating: movies[index].rating.toString(),
                                        discription: movies[index]
                                            .description
                                            .toString(),
                                        trailer:
                                            movies[index].trailer.toString(),
                                        genre:movies[index].genre!,
                                        director:
                                            movies[index].director.toString(), writer: movies[index].writers.toString(),
                                      )));
                        },
                        child: Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  movies[index].image.toString(),
                                  fit: BoxFit.cover,
                                ))),
                      );
                    }));
              }
              if (state is MovieBlocEror) {
                return Text("No Data");
              } else {
                return SizedBox();
              }
            },
          ),
        ));
  }
}
