// To parse this JSON data, do
//
//     final appointmentSlotByDateResponse = appointmentSlotByDateResponseFromJson(jsonString);

// ignore_for_file: depend_on_referenced_packages

// ignore: unused_import
import 'package:meta/meta.dart';
import 'dart:convert';

AppointmentSlotByDateResponse appointmentSlotByDateResponseFromJson(
        String str) =>
    AppointmentSlotByDateResponse.fromJson(json.decode(str));

String appointmentSlotByDateResponseToJson(
        AppointmentSlotByDateResponse data) =>
    json.encode(data.toJson());

class AppointmentSlotByDateResponse {
  AppointmentSlotByDateResponse({
    required this.doctorTiming,
    required this.timeArray,
    required this.message,
  });

  final DoctorTiming doctorTiming;
  final List<String> timeArray;
  final String message;

  factory AppointmentSlotByDateResponse.fromJson(Map<String, dynamic> json) =>
      AppointmentSlotByDateResponse(
        doctorTiming: DoctorTiming.fromJson(json["doctorTiming"]),
        timeArray: List<String>.from(json["timeArray"].map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "doctorTiming": doctorTiming.toJson(),
        "timeArray": List<dynamic>.from(timeArray.map((x) => x)),
        "message": message,
      };
}

class DoctorTiming {
  DoctorTiming({
    required this.days,
    required this.startTime,
    required this.endTime,
  });

  final List<int> days;
  final String startTime;
  final String endTime;

  factory DoctorTiming.fromJson(Map<String, dynamic> json) => DoctorTiming(
        days: List<int>.from(json["days"].map((x) => x)),
        startTime: json["startTime"],
        endTime: json["endTime"],
      );

  Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days.map((x) => x)),
        "startTime": startTime,
        "endTime": endTime,
      };
}
