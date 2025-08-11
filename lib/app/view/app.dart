// ignore_for_file: public_member_api_docs, sort_construct
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:karawan/app/app.dart';
import 'package:karawan/app/language/cubit/language_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit()),
        // BlocProvider(create: (context) => SubjectBloc()),
      ],
      child: Intro(child: const AppView()),
    );
  }
}
