import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jinee_ims/constants/color_constants.dart';
import 'package:jinee_ims/constants/image_constants.dart';
import 'package:jinee_ims/styles/font_sizes.dart';
import 'package:jinee_ims/styles/text_styles.dart';
import 'package:jinee_ims/utils/screen_utils/app_paddings.dart';
import 'package:jinee_ims/utils/screen_utils/app_spaces.dart';
import 'package:jinee_ims/utils/widgets/app_button.dart';
import 'package:jinee_ims/utils/widgets/app_date_picker_field.dart';
import 'package:jinee_ims/utils/widgets/app_text_form_field.dart';

class ReadyForReviewScreen extends StatelessWidget {
  const ReadyForReviewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      body: Padding(
        padding: AppPaddings.p(context, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child: AppDatePickerTextFormField(
                        dateController: TextEditingController(),
                        hintText: 'From Date',
                        maxWidth: 250,
                      ),
                    ),
                    AppSpaces.h(context, 10),
                    Flexible(
                      flex: 1,
                      child: AppDatePickerTextFormField(
                        dateController: TextEditingController(),
                        hintText: 'To Date',
                        maxWidth: 250,
                      ),
                    ),
                    AppSpaces.h(context, 10),
                    Flexible(
                      flex: 2,
                      child: AppTextFormField(
                        controller: TextEditingController(),
                        hintText:
                            'Search with GST Number, Party name or Bill Number',
                        suffixIcon: Icon(
                          Icons.search,
                          size: 25,
                          color: kColorPrimary,
                        ),
                        maxWidth: 500,
                      ),
                    ),
                    AppSpaces.h(context, 10),
                    Flexible(
                      flex: 1,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 250,
                        ),
                        child: Container(
                          height:
                              MediaQuery.of(context).size.width > 600 ? 50 : 45,
                          decoration: BoxDecoration(
                            color: kColorBackground,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: kColorGrey,
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Filter',
                                style: TextStyles.kMediumNunito(
                                  context,
                                  baseSize: FontSizes.k16,
                                  color: kColorTextPrimary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              AppSpaces.h(context, 10),
                              SvgPicture.asset(
                                kIconFilter,
                                height: 20,
                                width: 20,
                                colorFilter: ColorFilter.mode(
                                  kColorPrimary,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            AppSpaces.v(context, 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: SingleChildScrollView(
                    child: DataTable(
                      columnSpacing: 20,
                      horizontalMargin: 20,
                      headingRowColor: WidgetStatePropertyAll(
                        kColorPrimary,
                      ),
                      headingTextStyle: TextStyles.kSemiBoldNunito(
                        context,
                        color: kColorWhite,
                        baseSize: FontSizes.k14,
                      ),
                      dataTextStyle: TextStyles.kRegularNunito(
                        context,
                        color: kColorTextPrimary,
                        baseSize: FontSizes.k12,
                      ),
                      columns: const [
                        DataColumn(label: Text('GST Number')),
                        DataColumn(label: Text('Party Name')),
                        DataColumn(label: Text('Bill No')),
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Amount')),
                        DataColumn(label: Text('Tax')),
                        DataColumn(label: Text('SGST')),
                        DataColumn(label: Text('CGST')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: List<DataRow>.generate(
                        10,
                        (index) => DataRow(
                          cells: [
                            DataCell(Text('GST123456789')),
                            DataCell(Text('Party $index')),
                            DataCell(Text('BILL $index')),
                            DataCell(Text('2023-10-${index + 1}')),
                            DataCell(Text('\$${1000 + index * 100}')),
                            DataCell(Text('\$${100 + index * 10}')),
                            DataCell(Text('\$${50 + index * 5}')),
                            DataCell(Text('\$${50 + index * 5}')),
                            DataCell(
                              Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: kColorGreen,
                                  ),
                                  AppSpaces.h(context, 10),
                                  Icon(
                                    Icons.clear,
                                    color: kColorRed,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  title: 'Approve All',
                  buttonColor: kColorGreen,
                  onPressed: () {},
                  maxWidth: 200,
                ),
                AppSpaces.h(context, 10),
                AppButton(
                  title: 'Reject All',
                  buttonColor: kColorRed,
                  onPressed: () {},
                  maxWidth: 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
