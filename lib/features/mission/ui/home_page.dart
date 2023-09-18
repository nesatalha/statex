import 'package:flutter/material.dart';
import 'package:statex/features/mission/bloc/mission_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocConsumer<MissionBloc, MissionState>(
        bloc: missionBloc,
        listenWhen: (previous, current) => current is MissionActionState,
        buildWhen: (previous, current) => current is !MissionActionState,
        listener: (context, state) {


        },
        builder: (context, state) {
          switch(state.runtimeType) {
            case MissionFetchLoadingState:
              return Center(child: CircularProgressIndicator(color: Colors.black87,),);
            case MissionFetchSuccessfullState:
              final successState = state as MissionFetchSuccessfullState;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(successState.mission.patch),
                    SizedBox(height: 10,),
                    Text("Name: " + successState.mission.name),
                    SizedBox(height: 10,),
                    Text("number:  " + successState.mission.flightNumber.toString())
                  ],
                )
              );
            default:
              return Container();
          }
        },
      ),

    );
  }
}
