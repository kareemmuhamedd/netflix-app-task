import 'package:flutter_netflix_app/home/domain/entities/schedule.dart';

class ScheduleModel extends Schedule {


  ScheduleModel({
    required super.time,
    required super.days,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      time: json['time'],
      days: List<String>.from(json['days']),
    );
  }
}