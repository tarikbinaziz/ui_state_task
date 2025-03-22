import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/course_model.dart';

class CourseRepository {
  Future<List<CourseModel>> fetchCourses() async {
    try {
      final response = await rootBundle.loadString('assets/universities.json');
      final List<dynamic> data = json.decode(response);
      return data.map((e) => CourseModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load courses');
    }
  }
}
