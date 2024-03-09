import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movix/injection_container.dart';
import 'package:movix/presentation/pages/home_screen.dart';

import 'presentation/blocs/popular_movies/popular_movies_bloc.dart';
import 'presentation/blocs/search_movies/search_movies_bloc.dart';
import 'presentation/blocs/trending_movies/trending_movies_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<PopularMoviesBloc>()..add(FetchPopularMoviesEvent()),
          ),
          BlocProvider(
            create: (context) => getIt<TrendingMoviesBloc>()..add(FetchTrendingMoviesEvent()),
          ),
          BlocProvider(
            create: (context) => getIt<SearchMoviesBloc>(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}

