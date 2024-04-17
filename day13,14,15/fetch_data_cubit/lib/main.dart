import 'package:fetch_data_cubit/app_navigator.dart';
import 'package:fetch_data_cubit/cubit/nav_cubit.dart';
import 'package:fetch_data_cubit/cubit/post_cubit.dart';
import 'package:fetch_data_cubit/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostBloc()..add(LoadPostEvent()),
        ),
        BlocProvider(
          create: (context) => NavCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AppNavigator(),
      ),
    );
  }
}
