import 'package:flutter/material.dart';
import 'package:jinee_ims/constants/color_constants.dart';
import 'package:jinee_ims/features/ready_for_review/screens/ready_for_review_screen.dart';
import 'package:jinee_ims/styles/font_sizes.dart';
import 'package:jinee_ims/styles/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        backgroundColor: kColorBackground,
        title: Text(
          'Jinee IMS',
          style: TextStyles.kBoldNunito(context),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: kColorPrimary,
          dividerColor: kColorBackground,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2.5,
          labelStyle: TextStyles.kBoldNunito(
            context,
            baseSize: FontSizes.k12,
          ),
          unselectedLabelStyle: TextStyles.kRegularNunito(
            context,
            baseSize: FontSizes.k12,
          ),
          tabs: [
            Tab(text: 'Ready For Review'),
            Tab(text: 'Only On Portal'),
            Tab(text: 'Only On Software'),
            Tab(text: 'GST No. Mismatch'),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Other Conflicts'),
                  if (_tabController.index == 4) ...[
                    const SizedBox(width: 10), // Fixed spacing
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        color: kColorTextPrimary,
                        size: 20,
                      ),
                      tooltip: 'Select Conflict',
                      position: PopupMenuPosition.under,
                      color: kColorBackground,
                      onSelected: (value) {},
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'Bill No Mismatch',
                          child: Text(
                            'Bill No Mismatch',
                            style: TextStyles.kMediumNunito(
                              context,
                              baseSize: FontSizes.k12,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'Bill Date Mismatch',
                          child: Text(
                            'Bill Date Mismatch',
                            style: TextStyles.kMediumNunito(
                              context,
                              baseSize: FontSizes.k12,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'GST Taxable Mismatch',
                          child: Text(
                            'GST Taxable Mismatch',
                            style: TextStyles.kMediumNunito(
                              context,
                              baseSize: FontSizes.k12,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'GST Tax Mismatch',
                          child: Text(
                            'GST Tax Mismatch',
                            style: TextStyles.kMediumNunito(
                              context,
                              baseSize: FontSizes.k12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ReadyForReviewScreen(),
          ReadyForReviewScreen(),
          ReadyForReviewScreen(),
          ReadyForReviewScreen(),
          ReadyForReviewScreen(),
        ],
      ),
    );
  }
}
