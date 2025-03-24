import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_state_task/views/course_details_screen.dart';

import '../utils/debouncer.dart';
import '../viewmodels/course_viewmodel.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final courses = ref.watch(courseViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text('Search Courses', style: TextStyle(fontSize: 20.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (query) {
                _debouncer.run(() {
                  ref
                      .read(courseViewModelProvider.notifier)
                      .searchCourses(query);
                });
              },
              decoration: InputDecoration(
                labelText: 'Search by university or course',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r)),
                prefixIcon: Icon(Icons.search, size: 24.w),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: courses.isEmpty
                  ? Center(
                      child: Text('No results found',
                          style: TextStyle(fontSize: 16.sp)))
                  : ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                          child: ListTile(
                            leading: Hero(
                              tag: 'course-${course.id}',
                              child: Icon(Icons.school,
                                  size: 30.w, color: Colors.blue),
                            ),
                            title: Text(course.courseName,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(course.universityName,
                                style: TextStyle(fontSize: 14.sp)),
                            trailing: Icon(Icons.arrow_forward, size: 24.w),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(course: course),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
