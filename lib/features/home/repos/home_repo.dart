import 'package:jinee_ims/features/home/models/category_dm.dart';
import 'package:jinee_ims/features/home/models/data_dm.dart';
import 'package:jinee_ims/utils/services/api_service.dart';

class HomeRepo {
  static Future<List<CategoryDm>> getCategories({
    required String fromDate,
    required String toDate,
  }) async {
    try {
      final response = await ApiService.getRequest(
        endpoint: '/IMS/count',
        queryParams: {
          'FromDate': fromDate,
          'ToDate': toDate,
        },
      );
      if (response == null) {
        return [];
      }

      if (response['data'] != null) {
        return (response['data'] as List<dynamic>)
            .map(
              (item) => CategoryDm.fromJson(item),
            )
            .toList();
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<DataDm>> getData({
    required String category,
    required String fromDate,
    required String toDate,
    String searchText = '',
    int pageNumber = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await ApiService.getRequest(
        endpoint: '/IMS/data',
        queryParams: {
          'Category': category,
          'FromDate': fromDate,
          'ToDate': toDate,
          'SearchText': searchText,
          'PageNumber': pageNumber.toString(),
          'PageSize': pageSize.toString(),
        },
      );
      if (response == null) {
        return [];
      }

      if (response['data'] != null) {
        return (response['data'] as List<dynamic>)
            .map(
              (item) => DataDm.fromJson(item),
            )
            .toList();
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }
}
