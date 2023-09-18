import 'package:flutter/material.dart';
import 'package:statex/features/mission/bloc/mission_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final MissionBloc missionBloc = MissionBloc();

  @override
  void initState() {
    missionBloc.add(MissionInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "StateX"
        ),
      ),
      body: Center(
        child: Text(
          "statex"
        ),
      ),

    );
  }
}
