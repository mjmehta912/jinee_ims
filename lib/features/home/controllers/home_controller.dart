import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jinee_ims/features/home/models/category_dm.dart';
import 'package:jinee_ims/features/home/models/data_dm.dart';
import 'package:jinee_ims/features/home/repos/home_repo.dart';
import 'package:jinee_ims/utils/dialogs/app_dialogs.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var isMoreDataAvailable = true.obs;
  var selectedIndex = 0.obs;
  var categories = <CategoryDm>[].obs;
  var data = <DataDm>[].obs;

  var fromDateController = TextEditingController();
  var toDateController = TextEditingController();
  var searchController = TextEditingController();

  var currentPage = 1.obs;
  final int pageSize = 10;

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
    if (categories.isNotEmpty) {
      await getData(
        category: categories.first.category,
        reset: true,
      );
    }
  }

  void changeTab(int index) async {
    selectedIndex.value = index;
    currentPage.value = 1;
    isMoreDataAvailable.value = true;
    await getData(
      category: categories[index].category,
      reset: true,
    );
  }

  Future<void> getCategories() async {
    isLoading.value = true;
    try {
      var fetchedCategories = await HomeRepo.getCategories(
        fromDate: DateFormat('yyyy-MM-dd').format(
          DateFormat('dd-MM-yyyy').parse(fromDateController.text),
        ),
        toDate: DateFormat('yyyy-MM-dd').format(
          DateFormat('dd-MM-yyyy').parse(toDateController.text),
        ),
      );
      categories.assignAll(fetchedCategories);
    } catch (e) {
      showErrorDialog('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  var isFetchingData = false;

  Future<void> getData({
    required String category,
    bool reset = false,
  }) async {
    if (isLoading.value || !isMoreDataAvailable.value) return;
    if (isFetchingData) return;

    if (reset) {
      currentPage.value = 1;
      data.clear();
      isMoreDataAvailable.value = true;
    }

    try {
      isLoading.value = true;
      isFetchingData = true;
      var fetchedData = await HomeRepo.getData(
        category: category,
        fromDate: DateFormat('yyyy-MM-dd').format(
          DateFormat('dd-MM-yyyy').parse(fromDateController.text),
        ),
        toDate: DateFormat('yyyy-MM-dd').format(
          DateFormat('dd-MM-yyyy').parse(toDateController.text),
        ),
        searchText: searchController.text,
        pageNumber: currentPage.value,
        pageSize: pageSize,
      );

      if (fetchedData.isNotEmpty) {
        data.addAll(fetchedData);
        currentPage.value++;
      } else {
        isMoreDataAvailable.value = false;
      }
    } catch (e) {
      showErrorDialog('Error', e.toString());
    } finally {
      isLoading.value = false;
      isFetchingData = false;
    }
  }
}
