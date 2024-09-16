import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/appcolors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/home/widgets/home_header_widget.dart';
import 'package:taskati/feature/home/widgets/task_item_widget.dart';
import 'package:taskati/feature/home/widgets/today_header_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeHeaderWidget(),
                const Gap(15),
                const TodayHeaderWidget(),
                const Gap(20),
                DatePicker(
                  DateTime.now(),
                  height: 100,
                  width: 70,
                  initialSelectedDate:
                      DateTime.now().subtract(const Duration(days: 2)),
                  selectionColor: Appcolors.Primary,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      //   _selectedValue = date;
                    });
                  },
                ),
                const Gap(20),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      child: const taskItemWidget(),
                      background: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Appcolors.Red,
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.only(bottom: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Appcolors.white,
                              ),
                              Text(
                                'Delete Task',
                                style: getBodyTextStyle(
                                    colorFree: Appcolors.white),
                              )
                            ],
                          )),
                      secondaryBackground: Container(
                        decoration: BoxDecoration(
                            color: Appcolors.Green,
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.only(bottom: 9),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.check,
                              color: Appcolors.white,
                            ),
                            Text(
                              'Complete Task',
                              style:
                                  getBodyTextStyle(colorFree: Appcolors.white),
                            )
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                        } else {}
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
