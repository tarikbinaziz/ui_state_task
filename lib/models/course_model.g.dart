// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      id: (json['id'] as num).toInt(),
      universityName: json['universityName'] as String,
      courseName: json['courseName'] as String,
      duration: json['duration'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'universityName': instance.universityName,
      'courseName': instance.courseName,
      'duration': instance.duration,
      'description': instance.description,
    };
