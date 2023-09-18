import 'dart:convert';
import 'dart:developer';

import 'package:statex/features/mission/models/mission_model.dart';
import 'package:http/http.dart' as http;

class MissionRepository{
  static Future<MissionModel?> fetchMission() async {
    try {
      var res = await http.get(Uri.parse("https://api.spacexdata.com/v4/launches/latest"));
      var decodedRes = jsonDecode(res.body);
      log("API RESPONSE JSON =>>> \n $decodedRes");
      MissionModel mission = MissionModel.fromJson(decodedRes);
      return mission;
    } catch (e) {
      log("error =>> ${e.toString()}");
      return null;
    }
  }
}