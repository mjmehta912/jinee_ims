import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jinee_ims/constants/color_constants.dart';
import 'package:jinee_ims/constants/image_constants.dart';
import 'package:jinee_ims/features/home/controllers/home_controller.dart';
import 'package:jinee_ims/styles/font_sizes.dart';
import 'package:jinee_ims/styles/text_styles.dart';
import 'package:jinee_ims/utils/screen_utils/app_paddings.dart';
import 'package:jinee_ims/utils/screen_utils/app_spaces.dart';
import 'package:jinee_ims/utils/widgets/app_date_picker_field.dart';
import 'package:jinee_ims/utils/widgets/app_loading_overlay.dart';
import 'package:jinee_ims/utils/widgets/app_text_form_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final HomeController _controller = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Obx(
            () => DefaultTabController(
              length: _controller.categories.length,
              child: Scaffold(
                backgroundColor: kColorBackground,
                appBar: AppBar(
                  backgroundColor: kColorBackground,
                  title: Text(
                    'Jinee IMS',
                    style: TextStyles.kMediumNunito(
                      context,
                      color: kColorTextPrimary,
                    ).copyWith(
                      height: 1,
                    ),
                  ),
                  bottom: TabBar(
                    tabAlignment: TabAlignment.center,
                    isScrollable: true,
                    dividerColor: kColorBackground,
                    indicatorColor: kColorPrimary,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: TextStyles.kBoldNunito(
                      context,
                      color: kColorPrimary,
                      baseSize: FontSizes.k12,
                    ),
                    unselectedLabelStyle: TextStyles.kRegularNunito(
                      context,
                      color: kColorTextPrimary,
                      baseSize: FontSizes.k12,
                    ),
                    tabs: _controller.categories.asMap().entries.map(
                      (entry) {
                        int index = entry.key;
                        var category = entry.value;

                        return Obx(
                          () => Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(category.category),
                                AppSpaces.h(context, 10),
                                Container(
                                  padding: AppPaddings.combined(
                                    context,
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        _controller.selectedIndex.value == index
                                            ? kColorPrimary
                                            : Colors.grey,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    category.count.toString(),
                                    style:
                                        _controller.selectedIndex.value == index
                                            ? TextStyles.kBoldNunito(
                                                context,
                                                color: kColorWhite,
                                                baseSize: FontSizes.k12,
                                              )
                                            : TextStyles.kRegularNunito(
                                                context,
                                                color: kColorWhite,
                                                baseSize: FontSizes.k12,
                                              ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    onTap: (index) => _controller.changeTab(index),
                  ),
                ),
                body: TabBarView(
                  children: _controller.categories.map(
                    (category) {
                      return Padding(
                        padding: AppPaddings.combined(
                          context,
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppDatePickerTextFormField(
                                    dateController:
                                        _controller.fromDateController,
                                    hintText: 'From Date',
                                    maxWidth: 250,
                                  ),
                                  AppSpaces.h(context, 10),
                                  AppDatePickerTextFormField(
                                    dateController:
                                        _controller.toDateController,
                                    hintText: 'To Date',
                                    maxWidth: 250,
                                  ),
                                  AppSpaces.h(context, 10),
                                  AppTextFormField(
                                    controller: _controller.searchController,
                                    hintText:
                                        'Search with GST Number, Party name or Bill Number',
                                    maxWidth: 450,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: kColorGrey,
                                      size: 20,
                                    ),
                                  ),
                                  AppSpaces.h(context, 10),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: kColorBackground,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          color: kColorLightGrey,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Filter',
                                              style: TextStyles.kRegularNunito(
                                                context,
                                                baseSize: FontSizes.k12,
                                                color: kColorGrey,
                                              ),
                                            ),
                                            AppSpaces.h(context, 10),
                                            SvgPicture.asset(
                                              kIconFilter,
                                              height: 20,
                                              width: 20,
                                              colorFilter: ColorFilter.mode(
                                                kColorGrey,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppSpaces.v(context, 10),
                            Obx(
                              () {
                                if (_controller.data.isEmpty &&
                                    !_controller.isLoading.value) {
                                  return const SizedBox.shrink();
                                }

                                return Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        color: kColorPrimary,
                                        child: Table(
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          columnWidths: const {
                                            0: FixedColumnWidth(180),
                                            1: FixedColumnWidth(180),
                                            2: FixedColumnWidth(150),
                                            3: FixedColumnWidth(120),
                                            4: FixedColumnWidth(120),
                                            5: FixedColumnWidth(120),
                                            6: FixedColumnWidth(120),
                                            7: FixedColumnWidth(120),
                                            8: FixedColumnWidth(120),
                                          },
                                          children: [
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: kColorPrimary,
                                              ),
                                              children: [
                                                tableHeaderCell('GST Number'),
                                                tableHeaderCell('Party'),
                                                tableHeaderCell('Bill No'),
                                                tableHeaderCell('Date'),
                                                tableHeaderCell('Amount'),
                                                tableHeaderCell('Tax'),
                                                tableHeaderCell('CGST'),
                                                tableHeaderCell('SGST'),
                                                tableHeaderCell('Action'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Table(
                                              defaultVerticalAlignment:
                                                  TableCellVerticalAlignment
                                                      .middle,
                                              columnWidths: const {
                                                0: FixedColumnWidth(180),
                                                1: FixedColumnWidth(180),
                                                2: FixedColumnWidth(150),
                                                3: FixedColumnWidth(120),
                                                4: FixedColumnWidth(120),
                                                5: FixedColumnWidth(120),
                                                6: FixedColumnWidth(120),
                                                7: FixedColumnWidth(120),
                                                8: FixedColumnWidth(120),
                                              },
                                              children: _controller.data.map(
                                                (data) {
                                                  return TableRow(
                                                    children: [
                                                      tableDataCell(
                                                          data.gstNumber ?? ''),
                                                      tableDataCell(
                                                          data.pName ?? ''),
                                                      tableDataCell(
                                                          data.billNo ?? ''),
                                                      tableDataCell(data
                                                                      .billDate !=
                                                                  null &&
                                                              data.billDate!
                                                                  .isNotEmpty
                                                          ? DateFormat(
                                                                  "dd-MM-yyyy")
                                                              .format(
                                                              DateTime.parse(data
                                                                  .billDate!),
                                                            )
                                                          : ''),
                                                      tableDataCell(data
                                                              .valueOfGoods
                                                              ?.toString() ??
                                                          '0.0'),
                                                      tableDataCell(data
                                                              .gstNetAmount
                                                              ?.toString() ??
                                                          '0.0'),
                                                      tableDataCell(data
                                                              .cgstAmount
                                                              ?.toString() ??
                                                          '0.0'),
                                                      tableDataCell(data
                                                              .sgstAmount
                                                              ?.toString() ??
                                                          '0.0'),
                                                      tableDataCell(data
                                                              .sgstAmount
                                                              ?.toString() ??
                                                          '0.0'),
                                                    ],
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => AppLoadingOverlay(
            isLoading: _controller.isLoading.value,
          ),
        ),
      ],
    );
  }

  Widget tableHeaderCell(String title) {
    return Padding(
      padding: AppPaddings.p(Get.context!, 6),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.kMediumNunito(
          Get.context!,
          baseSize: FontSizes.k12,
          color: kColorWhite,
        ),
      ),
    );
  }

  Widget tableDataCell(String value) {
    return Padding(
      padding: AppPaddings.p(Get.context!, 4),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyles.kMediumNunito(
          Get.context!,
          baseSize: FontSizes.k10,
          color: kColorTextPrimary,
        ),
      ),
    );
  }
}
