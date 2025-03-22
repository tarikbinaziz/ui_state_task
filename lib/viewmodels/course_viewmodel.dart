
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/course_model.dart';
import '../repositories/course_repository.dart';

final courseViewModelProvider =
    StateNotifierProvider<CourseViewModel, List<CourseModel>>((ref) {
  return CourseViewModel(ref.read(courseRepositoryProvider));
});

final courseRepositoryProvider = Provider((ref) => CourseRepository());

class CourseViewModel extends StateNotifier<List<CourseModel>> {
  final CourseRepository _repository;
  List<CourseModel> _allCourses = [];

  CourseViewModel(this._repository) : super([]) {
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    _allCourses = await _repository.fetchCourses();
    state = _allCourses;
  }

  void searchCourses(String query) {
    if (query.isEmpty) {
      state = _allCourses;
    } else {
      state = _allCourses
          .where((course) =>
              course.universityName.toLowerCase().contains(query.toLowerCase()) ||
              course.courseName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
