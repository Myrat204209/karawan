import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:karawan/features/features.dart';

part 'main_host_view.dart';

@RoutePage()
class MainHostPage extends StatelessWidget {
  const MainHostPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (_) => MainHostBloc(
    //     mainHostRepository: MainHostRepository(
    //       // You'll likely inject this with get_it or another locator
    //       mainHostClient: MainHostClient(),
    //     ),
    //   )..add(const MainHostRequested()),
    //   child:
    //   const Scaffold(
    //     body: MainHostView(),
    //   ),
    // );
    return const Scaffold(body: MainHostView());
  }
}
