import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:statex/features/mission/models/mission_model.dart';
import 'package:statex/features/mission/repos/mission_repository.dart';

part 'mission_event.dart';
part 'mission_state.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState> {
  MissionBloc() : super(MissionInitial()) {
    on<MissionInitialFetchEvent>(missionInitialFetchEvent);
  }

  FutureOr<void> missionInitialFetchEvent(MissionInitialFetchEvent event, Emitter<MissionState> emit) async {
    try {
      emit(MissionFetchLoadingState());
      MissionModel? mission = await MissionRepository.fetchMission();
      if(mission != null){
        emit(MissionFetchSuccessfullState(mission: mission));
      } else {
        emit(MissionFetchErrorState(error: "error"));
      }
    } catch (e) {
      log("error ==>> ${e.toString()}");
      emit(MissionFetchErrorState(error: e.toString()));
    }
  }
}
