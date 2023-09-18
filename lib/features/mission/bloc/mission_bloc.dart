import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:statex/features/mission/models/mission_model.dart';

part 'mission_event.dart';
part 'mission_state.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState> {
  MissionBloc() : super(MissionInitial()) {
    on<MissionInitialFetchEvent>(missionInitialFetchEvent);
  }

  FutureOr<void> missionInitialFetchEvent(MissionInitialFetchEvent event, Emitter<MissionState> emit) async {
    try {
      emit(MissionFetchLoadingState());
      var res = await http.get(Uri.parse("https://api.spacexdata.com/v4/launches/latest"));
      var decodedRes = jsonDecode(res.body);
      log("API RESPONSE JSON =>>> \n $decodedRes");
      MissionModel mission = MissionModel.fromJson(decodedRes);
      emit(MissionFetchSuccessfullState(mission: mission));
    } catch (e) {
      log("error ==>> ${e.toString()}");
      emit(MissionFetchErrorState(error: e.toString()));
    }
  }
}
