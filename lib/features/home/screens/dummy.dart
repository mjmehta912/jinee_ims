import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
        Scaffold(
          backgroundColor: kColorBackground,
          body: Row(
            children: [
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: kColorBackground,
                  border: Border(
                    right: BorderSide(
                      color: kColorLightGrey,
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: AppPaddings.p(context, 16),
                      child: Text(
                        'Jinee IMS',
                        style: TextStyles.kBoldNunito(
                          context,
                          baseSize: FontSizes.k20,
                          color: kColorTextPrimary,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: kColorGrey,
                    ),
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                          itemCount: _controller.categories.length,
                          itemBuilder: (context, index) {
                            final category = _controller.categories[index];

                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  _controller.changeTab(index);
                                },
                                child: Container(
                                  padding: AppPaddings.combined(
                                    context,
                                    horizontal: 20,
                                    vertical: 14,
                                  ),
                                  color:
                                      _controller.selectedIndex.value == index
                                          // ignore: deprecated_member_use
                                          ? kColorPrimary.withOpacity(0.1)
                                          : Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        category.category,
                                        style:
                                            _controller.selectedIndex.value ==
                                                    index
                                                ? TextStyles.kSemiBoldNunito(
                                                    context,
                                                    baseSize: FontSizes.k14,
                                                    color: kColorPrimary,
                                                  )
                                                : TextStyles.kRegularNunito(
                                                    context,
                                                    baseSize: FontSizes.k12,
                                                    color: kColorTextPrimary,
                                                  ),
                                      ),
                                      Container(
                                        padding: AppPaddings.combined(
                                          context,
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: kColorPrimary,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          category.count.toString(),
                                          style: TextStyles.kRegularNunito(
                                            context,
                                            baseSize: FontSizes.k10,
                                            color: kColorBackground,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: dataWidget(context),
              ),
            ],
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

  Widget dataWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: AppPaddings.p(context, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppDatePickerTextFormField(
                  dateController: _controller.fromDateController,
                  hintText: 'From Date',
                  maxWidth: 200,
                ),
                AppSpaces.h(context, 10),
                AppDatePickerTextFormField(
                  dateController: _controller.toDateController,
                  hintText: 'To Date',
                  maxWidth: 200,
                ),
                AppSpaces.h(context, 10),
                AppTextFormField(
                  controller: _controller.searchController,
                  hintText: 'Search with GST Number, Party name or Bill Number',
                  maxWidth: 375,
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
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: kColorLightGrey,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
        ),
        AppSpaces.v(context, 20),
        Expanded(
          child: Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: const {
                    0: FixedColumnWidth(150),
                    1: FixedColumnWidth(150),
                    2: FixedColumnWidth(120),
                    3: FixedColumnWidth(100),
                    4: FixedColumnWidth(120),
                    5: FixedColumnWidth(100),
                    6: FixedColumnWidth(100),
                    7: FixedColumnWidth(100),
                    8: FixedColumnWidth(100),
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
                    ..._controller.data.map(
                      (data) {
                        return TableRow(
                          children: [
                            tableDataCell(data.gstNumber ?? ''),
                            tableDataCell(data.pName ?? ''),
                            tableDataCell(data.billNo ?? ''),
                            tableDataCell(data.billDate ?? ''),
                            tableDataCell(
                                data.valueOfGoods?.toString() ?? '0.0'),
                            tableDataCell(
                                data.gstNetAmount?.toString() ?? '0.0'),
                            tableDataCell(data.cgstAmount?.toString() ?? '0.0'),
                            tableDataCell(data.sgstAmount?.toString() ?? '0.0'),
                            tableDataCell(data.sgstAmount?.toString() ?? '0.0'),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Header Cell Widget
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

  /// Data Cell Widget
  Widget tableDataCell(String value) {
    return Padding(
      padding: AppPaddings.p(Get.context!, 4),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyles.kRegularNunito(
          Get.context!,
          baseSize: FontSizes.k10,
          color: kColorTextPrimary,
        ),
      ),
    );
  }
}
