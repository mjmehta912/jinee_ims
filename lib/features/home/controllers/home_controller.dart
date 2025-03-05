import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jinee_ims/features/home/models/category_dm.dart';
import 'package:jinee_ims/features/home/models/data_dm.dart';
import 'package:jinee_ims/features/home/repos/home_repo.dart';
import 'package:jinee_ims/utils/dialogs/app_dialogs.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var selectedIndex = 0.obs;
  var categories = <CategoryDm>[].obs;
  var data = <DataDm>[].obs;

  var fromDateController = TextEditingController();
  var toDateController = TextEditingController();
  var searchController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();

    DateTime now = DateTime.now();

    DateTime startFinancialYear;
    DateTime endFinancialYear;

    if (now.month >= 4) {
      startFinancialYear = DateTime(now.year, 4, 1);
      endFinancialYear = DateTime(now.year + 1, 3, 31);
    } else {
      startFinancialYear = DateTime(now.year - 1, 4, 1);
      endFinancialYear = DateTime(now.year, 3, 31);
    }

    fromDateController.text =
        DateFormat('dd-MM-yyyy').format(startFinancialYear);
    toDateController.text = DateFormat('dd-MM-yyyy').format(endFinancialYear);

    await getCategories();
  }

  void changeTab(int index) async {
    selectedIndex.value = index;
    await getData(
      category: categories[index].category,
    );
  }

  Future<void> getCategories() async {
    isLoading.value = true;
    try {
      var fetchedCategories = await HomeRepo.getCategories();
      categories.assignAll(fetchedCategories);
      if (categories.isNotEmpty) {
        await getData(
          category: categories.first.category,
        );
      }
    } catch (e) {
      showErrorDialog(
        'Error',
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getData({required String category}) async {
    isLoading.value = true;
    try {
      var fetchedData = await HomeRepo.getData(
        category: category,
      );
      data.assignAll(fetchedData);
    } catch (e) {
      showErrorDialog(
        'Error',
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
