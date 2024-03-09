import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movix/presentation/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:movix/presentation/blocs/trending_movies/trending_movies_bloc.dart';
import 'package:movix/presentation/pages/movies_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final bckImage = 'https://w0.peakpx.com/wallpaper/732/875/HD-wallpaper-anonymous-black-cool-dark-guy-foux-hacker-scary-tech.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,toolbarHeight: 100,
        backgroundColor: Colors.black,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Hitesh 👋',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'TDD - Movix - Movie App',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.search, color: Colors.white,),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Default Image
              Container(
                height: 290,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(bckImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20), // Border radius
                              ),
                            ),
                            child: const Text('▶️ Play'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),

              // Trending Movies
              const Text('Trending Movies',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
                builder: (context, state){
                  if(state is TrendingMoviesLoadingState){
                    return const CircularProgressIndicator();
                  } else if(state is TrendingMoviesLoadedState){
                    return MoviesList(movies: state.movies);
                  } else if (state is TrendingMoviesErrorState){
                    return Text(state.message);
                  }
                  return Container();
                },
              ),

              const SizedBox(height: 20,),
              // Popular Movies
              const Text('Popular Movies',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                builder: (context, state){
                  if(state is PopularMoviesLoadingState){
                    return const CircularProgressIndicator();
                  } else if(state is PopularMoviesLoadedState){
                    return MoviesList(movies: state.movies);
                  } else if (state is PopularMoviesErrorState){
                    return Text(state.message);
                  }
                  return Container();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}