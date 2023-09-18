part of 'mission_bloc.dart';

@immutable
abstract class MissionState {}

abstract class MissionActionState extends MissionState{}

class MissionInitial extends MissionState {}


class MissionFetchSuccessfullState extends MissionState {
  final MissionModel mission;

  MissionFetchSuccessfullState({
    required this.mission
  });
}

class MissionFetchLoadingState extends MissionState {}

class MissionFetchErrorState extends MissionState {
  final String error;

  MissionFetchErrorState({
    required this.error
  });
}
