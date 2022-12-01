import 'package:e_commerce/models/review_model.dart';
import 'package:flutter/cupertino.dart';

import '../data/repository/apps_repository.dart';
import '../utils/utils.dart';

class ReviewViewModel extends ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  List<ReviewModel> _reviews = [];
  final List<ReviewModel> _oneRatingReviews = [];
  final List<ReviewModel> _twoRatingReviews = [];
  final List<ReviewModel> _threeRatingReviews = [];
  final List<ReviewModel> _fourRatingReviews = [];
  final List<ReviewModel> _fiveRatingReviews = [];
  AppState _appState = AppState.loading;
  double averageRating5 = 0.0;
  double averageRating4 = 0.0;
  double averageRating3 = 0.0;
  double averageRating2 = 0.0;
  double averageRating1 = 0.0;
  double averageSumRating = 0.0;

  List<ReviewModel> get reviews => _reviews;
  AppState get appState => _appState;
  List<ReviewModel> get oneRatingReviews => _oneRatingReviews;
  List<ReviewModel> get twoRatingReviews => _twoRatingReviews;
  List<ReviewModel> get threeRatingReviews => _threeRatingReviews;
  List<ReviewModel> get fourRatingReviews => _fourRatingReviews;
  List<ReviewModel> get fiveRatingReviews => _fiveRatingReviews;

  Future<void> fetchReviews(int productId) async {
    await clearRating();

    try {
      changeAppState(AppState.loading);
      _reviews = await appsRepository.fetchReview(productId: productId);
      await filterRating();
      await calculateAveragePerRatingProduct();
      await calculateAverageSumRatingProduct();
      changeAppState(AppState.loaded);

      if (_reviews.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> filterRating() async {
    for (var i in _reviews) {
      if (i.star == 1 && !_oneRatingReviews.contains(i)) {
        _oneRatingReviews.add(i);
        notifyListeners();
      }
      if (i.star == 2 && !_twoRatingReviews.contains(i)) {
        _twoRatingReviews.add(i);
        notifyListeners();
      }
      if (i.star == 3 && !_threeRatingReviews.contains(i)) {
        _threeRatingReviews.add(i);
        notifyListeners();
      }
      if (i.star == 4 && !_fourRatingReviews.contains(i)) {
        _fourRatingReviews.add(i);
        notifyListeners();
      }
      if (i.star == 5 && !_fiveRatingReviews.contains(i)) {
        _fiveRatingReviews.add(i);
        notifyListeners();
      }
    }
  }

  Future<void> calculateAveragePerRatingProduct() async {
    averageRating5 = _fiveRatingReviews.length / _reviews.length;
    averageRating4 = _fourRatingReviews.length / _reviews.length;
    averageRating3 = _threeRatingReviews.length / _reviews.length;
    averageRating2 = _twoRatingReviews.length / _reviews.length;
    averageRating1 = _oneRatingReviews.length / _reviews.length;

    notifyListeners();
  }

  Future<void> calculateAverageSumRatingProduct() async {
    averageSumRating = ((1 * _oneRatingReviews.length) +
            (2 * _twoRatingReviews.length) +
            (3 * _threeRatingReviews.length) +
            (4 * _fourRatingReviews.length) +
            (5 * _fiveRatingReviews.length)) /
        _reviews.length;
  }

  Future<void> clearRating() async {
    _oneRatingReviews.clear();
    _twoRatingReviews.clear();
    _threeRatingReviews.clear();
    _fourRatingReviews.clear();
    _fiveRatingReviews.clear();
    averageRating5 = 0.0;
    averageRating4 = 0.0;
    averageRating3 = 0.0;
    averageRating2 = 0.0;
    averageRating1 = 0.0;
    averageSumRating = 0.0;
    notifyListeners();
  }

  void changeAppState(AppState appState) async {
    _appState = appState;
    notifyListeners();
  }
}
