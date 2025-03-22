import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  final int id;
  final String universityName;
  final String courseName;
  final String duration;
  final String description;

  CourseModel({
    required this.id,
    required this.universityName,
    required this.courseName,
    required this.duration,
    required this.description,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}
