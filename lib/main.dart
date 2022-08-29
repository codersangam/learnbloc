import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/bloc/counter_bloc.dart';
import 'package:learnbloc/blocs/products_bloc/bloc/products_bloc.dart';
import 'package:learnbloc/blocs/tags_bloc/bloc/tags_bloc.dart';
import 'package:learnbloc/cubits/cubit/counter_cubit.dart';
import 'package:learnbloc/data/api_client/products_api.dart';

import 'blocs/posts_bloc/bloc/posts_bloc.dart';
import 'data/api_client/posts_api.dart';
import 'data/repository/posts_repo.dart';
import 'data/repository/products_repo.dart';
import 'screens/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(ProductsRepo(ProductsApi()))
            ..add(ProductsLoadedEvent()),
        ),
        BlocProvider(
          create: (context) =>
              PostsBloc(PostsRepo(PostsApi()))..add(PostsLoadedEvent()),
        ),
        BlocProvider(
          create: (context) =>
              TagsBloc(PostsRepo(PostsApi()))..add(TagsLoadedEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PostsScreen(),
      ),
    );
  }
}
