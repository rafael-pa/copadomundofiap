// To parse this JSON data, do
//
//     final matches = matchesFromJson(jsonString);

import 'dart:convert';

List<Match> matchesFromJson(String str) => List<Match>.from(json.decode(str).map((x) => Match.fromJson(x)));

String matchesToJson(List<Match> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Match {
  Match({
    required this.id,
    this.venue,
    this.location,
    this.status,
    this.attendance,
    this.stageName,
    this.homeTeamCountry,
    this.awayTeamCountry,
    this.datetime,
    this.winner,
    this.winnerCode,
    this.homeTeam,
    this.awayTeam,
    this.weather,
    this.time,
    this.detailedTime,
    this.officials,
    this.homeTeamEvents,
    this.awayTeamEvents,
    this.lastCheckedAt,
    this.lastChangedAt,
    this.homeTeamLineup,
    this.awayTeamLineup,
    this.homeTeamStatistics,
    this.awayTeamStatistics,
  });

  int id;
  String? venue;
  Location? location;
  Status? status;
  String? attendance;
  String? stageName;
  String? homeTeamCountry;
  String? awayTeamCountry;
  DateTime? datetime;
  String? winner;
  String? winnerCode;
  Team? homeTeam;
  Team? awayTeam;
  Weather? weather;
  Time? time;
  DetailedTime? detailedTime;
  List<Official?>? officials;
  List<TeamEvent>? homeTeamEvents;
  List<TeamEvent>? awayTeamEvents;
  DateTime? lastCheckedAt;
  DateTime? lastChangedAt;
  TeamLineup? homeTeamLineup;
  TeamLineup? awayTeamLineup;
  TeamStatistics? homeTeamStatistics;
  TeamStatistics? awayTeamStatistics;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    id: json["id"],
    venue: json["venue"],
    location: locationValues.map[json["location"]],
    status: statusValues.map[json["status"]],
    attendance: json["attendance"] == null ? null : json["attendance"],
    stageName: json["stage_name"],
    homeTeamCountry: json["home_team_country"] == null ? null : json["home_team_country"],
    awayTeamCountry: json["away_team_country"] == null ? null : json["away_team_country"],
    datetime: DateTime.parse(json["datetime"]),
    winner: json["winner"] == null ? null : json["winner"],
    winnerCode: json["winner_code"] == null ? null : json["winner_code"],
    homeTeam: Team.fromJson(json["home_team"]),
    awayTeam: Team.fromJson(json["away_team"]),
    weather: Weather.fromJson(json["weather"]),
    time: json["time"] == null ? null : timeValues.map[json["time"]],
    detailedTime: json["detailed_time"] == null ? null : DetailedTime.fromJson(json["detailed_time"]),
    officials: List<Official>.from(json["officials"].map((x) => Official.fromJson(x))),
    homeTeamEvents: List<TeamEvent>.from(json["home_team_events"].map((x) => TeamEvent.fromJson(x))),
    awayTeamEvents: List<TeamEvent>.from(json["away_team_events"].map((x) => TeamEvent.fromJson(x))),
    lastCheckedAt: DateTime.parse(json["last_checked_at"]),
    lastChangedAt: DateTime.parse(json["last_changed_at"]),
    homeTeamLineup: json["home_team_lineup"] == null ? null : TeamLineup.fromJson(json["home_team_lineup"]),
    awayTeamLineup: json["away_team_lineup"] == null ? null : TeamLineup.fromJson(json["away_team_lineup"]),
    homeTeamStatistics: json["home_team_statistics"] == null ? null : TeamStatistics.fromJson(json["home_team_statistics"]),
    awayTeamStatistics: json["away_team_statistics"] == null ? null : TeamStatistics.fromJson(json["away_team_statistics"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "venue": venue,
    "location": locationValues.reverse![location],
    "status": statusValues.reverse![status],
    "attendance": attendance == null ? null : attendance,
    "stage_name": stageNameValues.reverse![stageName],
    "home_team_country": homeTeamCountry == null ? null : homeTeamCountry,
    "away_team_country": awayTeamCountry == null ? null : awayTeamCountry,
    "datetime": datetime?.toIso8601String(),
    "winner": winner == null ? null : winner,
    "winner_code": winnerCode == null ? null : winnerCode,
    "home_team": homeTeam?.toJson(),
    "away_team": awayTeam?.toJson(),
    "weather": weather?.toJson(),
    "time": time == null ? null : timeValues.reverse![time],
    "detailed_time": detailedTime == null ? null : detailedTime?.toJson(),
    "officials": officials == null ? null : List<dynamic>.from(officials!.map((x) => x!.toJson())),
    "home_team_events": homeTeamEvents == null ? null : List<dynamic>.from(homeTeamEvents!.map((x) => x.toJson())),
    "away_team_events": awayTeamEvents == null ? null : List<dynamic>.from(awayTeamEvents!.map((x) => x.toJson())),
    "last_checked_at": lastCheckedAt?.toIso8601String(),
    "last_changed_at": lastChangedAt?.toIso8601String(),
    "home_team_lineup": homeTeamLineup == null ? null : homeTeamLineup?.toJson(),
    "away_team_lineup": awayTeamLineup == null ? null : awayTeamLineup?.toJson(),
    "home_team_statistics": homeTeamStatistics == null ? null : homeTeamStatistics?.toJson(),
    "away_team_statistics": awayTeamStatistics == null ? null : awayTeamStatistics?.toJson(),
  };
}

class Team {
  Team({
    this.name,
    this.country,
    this.goals,
    this.penalties,
  });

  String? name;
  String? country;
  int? goals;
  int? penalties;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    name: json["name"],
    country: json["country"],
    goals: json["goals"] == null ? null : json["goals"],
    penalties: json["penalties"] == null ? null : json["penalties"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "country": country,
    "goals": goals == null ? null : goals,
    "penalties": penalties == null ? null : penalties,
  };
}

class TeamEvent {
  TeamEvent({
    this.id,
    this.typeOfEvent,
    this.player,
    this.time,
    this.extraInfo,
  });

  int? id;
  TypeOfEvent? typeOfEvent;
  String? player;
  String? time;
  String? extraInfo;

  factory TeamEvent.fromJson(Map<String, dynamic> json) => TeamEvent(
    id: json["id"],
    typeOfEvent: typeOfEventValues.map[json["type_of_event"]],
    player: json["player"],
    time: json["time"],
    extraInfo: json["extra_info"] == null ? null : json["extra_info"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type_of_event": typeOfEventValues.reverse![typeOfEvent],
    "player": player,
    "time": time,
    "extra_info": extraInfo == null ? null : extraInfo,
  };
}

enum TypeOfEvent { BOOKING, SUBSTITUTION, GOAL }

final typeOfEventValues = EnumValues({
  "booking": TypeOfEvent.BOOKING,
  "goal": TypeOfEvent.GOAL,
  "substitution": TypeOfEvent.SUBSTITUTION
});

class TeamLineup {
  TeamLineup({
    this.country,
    this.tactics,
    this.startingEleven,
    this.substitutes,
  });

  String? country;
  Tactics? tactics;
  List<StartingEleven>? startingEleven;
  List<StartingEleven>? substitutes;

  factory TeamLineup.fromJson(Map<String, dynamic> json) => TeamLineup(
    country: json["country"],
    tactics: json["tactics"] == null ? null : tacticsValues.map[json["tactics"]],
    startingEleven: json["starting_eleven"] == null ? null : List<StartingEleven>.from(json["starting_eleven"].map((x) => StartingEleven.fromJson(x))),
    substitutes: json["substitutes"] == null ? null : List<StartingEleven>.from(json["substitutes"].map((x) => StartingEleven.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "tactics": tactics == null ? null : tacticsValues.reverse![tactics],
    "starting_eleven": startingEleven == null ? null : List<dynamic>.from(startingEleven!.map((x) => x.toJson())),
    "substitutes": substitutes == null ? null : List<dynamic>.from(substitutes!.map((x) => x.toJson())),
  };
}

class StartingEleven {
  StartingEleven({
    this.name,
    this.shirtNumber,
    this.position,
  });

  String? name;
  int? shirtNumber;
  Position? position;

  factory StartingEleven.fromJson(Map<String, dynamic> json) => StartingEleven(
    name: json["name"],
    shirtNumber: json["shirt_number"],
    position: positionValues.map[json["position"]],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "shirt_number": shirtNumber,
    "position": positionValues.reverse![position],
  };
}

enum Position { GOALKEEPER, DEFENDER, MIDFIELDER, FORWARD, UNKNOWN }

final positionValues = EnumValues({
  "Defender": Position.DEFENDER,
  "Forward": Position.FORWARD,
  "Goalkeeper": Position.GOALKEEPER,
  "Midfielder": Position.MIDFIELDER,
  "Unknown": Position.UNKNOWN
});

enum Tactics { EMPTY, THE_451, THE_433, THE_442, THE_343, THE_532, THE_361, THE_352, THE_541 }

final tacticsValues = EnumValues({
  "": Tactics.EMPTY,
  "3-4-3": Tactics.THE_343,
  "3-5-2": Tactics.THE_352,
  "3-6-1": Tactics.THE_361,
  "4-3-3": Tactics.THE_433,
  "4-4-2": Tactics.THE_442,
  "4-5-1": Tactics.THE_451,
  "5-3-2": Tactics.THE_532,
  "5-4-1": Tactics.THE_541
});

class TeamStatistics {
  TeamStatistics({
    this.country,
    this.attemptsOnGoal,
    this.attemptsOnGoalAgainst,
    this.onTarget,
    this.offTarget,
    this.blocked,
    this.corners,
    this.offsides,
    this.numPasses,
    this.passesCompleted,
    this.tackles,
    this.freeKicks,
    this.goalKicks,
    this.penalties,
    this.penaltiesScored,
    this.throwIns,
    this.yellowCards,
    this.redCards,
    this.foulsCommitted,
  });

  String? country;
  int? attemptsOnGoal;
  int? attemptsOnGoalAgainst;
  int? onTarget;
  int? offTarget;
  int? blocked;
  int? corners;
  int? offsides;
  int? numPasses;
  int? passesCompleted;
  int? tackles;
  int? freeKicks;
  int? goalKicks;
  int? penalties;
  int? penaltiesScored;
  int? throwIns;
  int? yellowCards;
  int? redCards;
  int? foulsCommitted;

  factory TeamStatistics.fromJson(Map<String, dynamic> json) => TeamStatistics(
    country: json["country"],
    attemptsOnGoal: json["attempts_on_goal"] == null ? null : json["attempts_on_goal"],
    attemptsOnGoalAgainst: json["attempts_on_goal_against"] == null ? null : json["attempts_on_goal_against"],
    onTarget: json["on_target"] == null ? null : json["on_target"],
    offTarget: json["off_target"] == null ? null : json["off_target"],
    blocked: json["blocked"] == null ? null : json["blocked"],
    corners: json["corners"] == null ? null : json["corners"],
    offsides: json["offsides"] == null ? null : json["offsides"],
    numPasses: json["num_passes"] == null ? null : json["num_passes"],
    passesCompleted: json["passes_completed"] == null ? null : json["passes_completed"],
    tackles: json["tackles"] == null ? null : json["tackles"],
    freeKicks: json["free_kicks"] == null ? null : json["free_kicks"],
    goalKicks: json["goal_kicks"] == null ? null : json["goal_kicks"],
    penalties: json["penalties"] == null ? null : json["penalties"],
    penaltiesScored: json["penalties_scored"] == null ? null : json["penalties_scored"],
    throwIns: json["throw_ins"] == null ? null : json["throw_ins"],
    yellowCards: json["yellow_cards"] == null ? null : json["yellow_cards"],
    redCards: json["red_cards"] == null ? null : json["red_cards"],
    foulsCommitted: json["fouls_committed"] == null ? null : json["fouls_committed"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "attempts_on_goal": attemptsOnGoal == null ? null : attemptsOnGoal,
    "attempts_on_goal_against": attemptsOnGoalAgainst == null ? null : attemptsOnGoalAgainst,
    "on_target": onTarget == null ? null : onTarget,
    "off_target": offTarget == null ? null : offTarget,
    "blocked": blocked == null ? null : blocked,
    "corners": corners == null ? null : corners,
    "offsides": offsides == null ? null : offsides,
    "num_passes": numPasses == null ? null : numPasses,
    "passes_completed": passesCompleted == null ? null : passesCompleted,
    "tackles": tackles == null ? null : tackles,
    "free_kicks": freeKicks == null ? null : freeKicks,
    "goal_kicks": goalKicks == null ? null : goalKicks,
    "penalties": penalties == null ? null : penalties,
    "penalties_scored": penaltiesScored == null ? null : penaltiesScored,
    "throw_ins": throwIns == null ? null : throwIns,
    "yellow_cards": yellowCards == null ? null : yellowCards,
    "red_cards": redCards == null ? null : redCards,
    "fouls_committed": foulsCommitted == null ? null : foulsCommitted,
  };
}

class DetailedTime {
  DetailedTime({
    this.currentTime,
    this.firstHalfTime,
    this.firstHalfExtraTime,
    this.secondHalfTime,
    this.secondHalfExtraTime,
  });

  CurrentTime? currentTime;
  dynamic firstHalfTime;
  dynamic firstHalfExtraTime;
  dynamic secondHalfTime;
  dynamic secondHalfExtraTime;

  factory DetailedTime.fromJson(Map<String, dynamic> json) => DetailedTime(
    currentTime: currentTimeValues.map[json["current_time"]],
    firstHalfTime: json["first_half_time"],
    firstHalfExtraTime: json["first_half_extra_time"],
    secondHalfTime: json["second_half_time"],
    secondHalfExtraTime: json["second_half_extra_time"],
  );

  Map<String, dynamic> toJson() => {
    "current_time": currentTimeValues.reverse![currentTime],
    "first_half_time": firstHalfTime,
    "first_half_extra_time": firstHalfExtraTime,
    "second_half_time": secondHalfTime,
    "second_half_extra_time": secondHalfExtraTime,
  };
}

enum CurrentTime { THE_0, THE_120 }

final currentTimeValues = EnumValues({
  "0'": CurrentTime.THE_0,
  "120'": CurrentTime.THE_120
});

enum Location { AL_DAAYEN, AR_RAYYAN, AL_KHOR, DOHA, AL_WAKRAH }

final locationValues = EnumValues({
  "Al Daayen": Location.AL_DAAYEN,
  "Al Khor": Location.AL_KHOR,
  "Al Wakrah": Location.AL_WAKRAH,
  "Ar-Rayyan": Location.AR_RAYYAN,
  "Doha": Location.DOHA
});

class Official {
  Official({
    this.name,
    this.role,
    this.country,
  });

  String? name;
  Role? role;
  String? country;

  factory Official.fromJson(Map<String, dynamic> json) => Official(
    name: json["name"],
    role: roleValues.map[json["role"]],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "role": roleValues.reverse![role],
    "country": country,
  };
}

enum Role { REFEREE, ASSISTANT_REFEREE_1, ASSISTANT_REFEREE_2, FOURTH_OFFICIAL, VIDEO_ASSISTANT_REFEREE_VAR, RESERVE_REFEREE, OFFSIDE_VAR, ASSISTANT_VAR, SUPPORT_VAR, RESERVE_ASSISTANT_REFEREE }

final roleValues = EnumValues({
  "Assistant Referee 1": Role.ASSISTANT_REFEREE_1,
  "Assistant Referee 2": Role.ASSISTANT_REFEREE_2,
  "Assistant VAR": Role.ASSISTANT_VAR,
  "Fourth official": Role.FOURTH_OFFICIAL,
  "Offside VAR": Role.OFFSIDE_VAR,
  "Referee": Role.REFEREE,
  "Reserve Assistant Referee": Role.RESERVE_ASSISTANT_REFEREE,
  "Reserve referee": Role.RESERVE_REFEREE,
  "Support VAR": Role.SUPPORT_VAR,
  "Video Assistant Referee (VAR)": Role.VIDEO_ASSISTANT_REFEREE_VAR
});

enum StageName { FINAL, PLAY_OFF_FOR_THIRD_PLACE, SEMI_FINAL, QUARTER_FINAL, ROUND_OF_16, FIRST_STAGE }

final stageNameValues = EnumValues({
  "Final": StageName.FINAL,
  "First stage": StageName.FIRST_STAGE,
  "Play-off for third place": StageName.PLAY_OFF_FOR_THIRD_PLACE,
  "Quarter-final": StageName.QUARTER_FINAL,
  "Round of 16": StageName.ROUND_OF_16,
  "Semi-final": StageName.SEMI_FINAL
});

enum Status { FUTURE_UNSCHEDULED, FUTURE_SCHEDULED, COMPLETED }

final statusValues = EnumValues({
  "completed": Status.COMPLETED,
  "future_scheduled": Status.FUTURE_SCHEDULED,
  "future_unscheduled": Status.FUTURE_UNSCHEDULED
});

enum Time { FULL_TIME }

final timeValues = EnumValues({
  "full-time": Time.FULL_TIME
});

class Weather {
  Weather({
    this.humidity,
    this.tempCelsius,
    this.tempFarenheit,
    this.windSpeed,
    this.description,
  });

  String? humidity;
  String? tempCelsius;
  String? tempFarenheit;
  String? windSpeed;
  Description? description;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    humidity: json["humidity"] == null ? null : json["humidity"],
    tempCelsius: json["temp_celsius"] == null ? null : json["temp_celsius"],
    tempFarenheit: json["temp_farenheit"] == null ? null : json["temp_farenheit"],
    windSpeed: json["wind_speed"] == null ? null : json["wind_speed"],
    description: json["description"] == null ? null : descriptionValues.map[json["description"]],
  );

  Map<String, dynamic> toJson() => {
    "humidity": humidity == null ? null : humidity,
    "temp_celsius": tempCelsius == null ? null : tempCelsius,
    "temp_farenheit": tempFarenheit == null ? null : tempFarenheit,
    "wind_speed": windSpeed == null ? null : windSpeed,
    "description": description == null ? null : descriptionValues.reverse![description],
  };
}

enum Description { PARTLY_CLOUDY_NIGHT, CLOUDY_NIGHT, CLEAR_NIGHT, PARTLY_CLOUDY, SUNNY }

final descriptionValues = EnumValues({
  "Clear Night": Description.CLEAR_NIGHT,
  "Cloudy Night": Description.CLOUDY_NIGHT,
  "Partly Cloudy": Description.PARTLY_CLOUDY,
  "Partly Cloudy Night": Description.PARTLY_CLOUDY_NIGHT,
  "Sunny": Description.SUNNY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
