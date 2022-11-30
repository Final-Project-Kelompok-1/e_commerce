import 'package:flutter/cupertino.dart';

import '../data/repository/apps_repository.dart';

class TransactionViewModel extends ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  Future<void> postTransaction(String address) async {
    try {
      await appsRepository.postTransaction(address);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
