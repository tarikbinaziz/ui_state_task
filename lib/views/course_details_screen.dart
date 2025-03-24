import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/course_model.dart';

class DetailsScreen extends StatelessWidget {
  final CourseModel course;

  const DetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(course.courseName, style: TextStyle(fontSize: 20.sp)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.w),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'course-${course.id}',
                child: Icon(Icons.school, size: 80.w, color: Colors.blue),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              course.courseName,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              'University: ${course.universityName}',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h),
            Text(
              'Duration: ${course.duration}',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 20.h),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            Text(
              course.description,
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
