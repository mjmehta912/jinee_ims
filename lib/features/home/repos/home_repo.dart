import 'package:jinee_ims/features/home/models/category_dm.dart';
import 'package:jinee_ims/features/home/models/data_dm.dart';
import 'package:jinee_ims/utils/services/api_service.dart';

class HomeRepo {
  static Future<List<CategoryDm>> getCategories() async {
    try {
      final response = await ApiService.getRequest(
        endpoint: '/IMS/count',
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
  }) async {
    try {
      final response = await ApiService.getRequest(
        endpoint: '/IMS/data',
        queryParams: {
          'Category': category,
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
