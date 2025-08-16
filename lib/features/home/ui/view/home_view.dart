import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karawan/features/features.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.section});
  final AppSection section;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc()..add(HomeDataFetched(section: section)), // Initial fetch
      child: const HomeContent(),
    );
  }
}
