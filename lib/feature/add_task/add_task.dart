import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/funcations/navigation.dart';
import 'package:taskati/core/utils/appcolors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgest/custom_Button.dart';
import 'package:taskati/feature/home/home_view.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  int colorIndex = 0;
  String taskDate = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  String endTime =
      DateFormat("hh:mm a").format(DateTime.now().add(const Duration(hours: 2)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: getTiitleTextStyle(colorFree: Appcolors.Primary),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              PushWithReplacment(context, const HomeView());
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Appcolors.Primary,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TiTle', style: getTiitleTextStyle(fontSize: 14)),
            const Gap(10),
            TextFormField(),
            const Gap(10),
            Text('Note', style: getTiitleTextStyle(fontSize: 14)),
            const Gap(10),
            TextFormField(
              maxLines: 5,
            ),
            const Gap(10),
            Text('Date', style: getTiitleTextStyle(fontSize: 14)),
            const Gap(10),
            TextFormField(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2040))
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      taskDate = DateFormat.yMd().format(value);
                    });
                  }
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                  hintText: taskDate,
                  hintStyle: getBodyTextStyle(),
                  suffixIcon: Icon(
                    Icons.date_range_outlined,
                    color: Appcolors.Primary,
                  )),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                    child: Text(
                  'Start Time',
                  style: getTiitleTextStyle(fontSize: 14),
                )),
                const Gap(30),
                Expanded(
                    child: Text(
                  'End Time',
                  style: getTiitleTextStyle(fontSize: 14),
                ))
              ],
            ),
            const Gap(5),
            Row(
              children: [
                Expanded(
                  //
                  //   _________ Start Time __________
                  //
                  child: TextFormField(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            startTime = value.format(context);
                          });
                        }
                      });
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: startTime,
                        hintStyle: getBodyTextStyle(),
                        suffixIcon: Icon(
                          Icons.watch_later_outlined,
                          color: Appcolors.Primary,
                        )),
                  ),
                ),
                const Gap(30),
                Expanded(

                    //
                    //   _________ end Time __________
                    //
                    child: TextFormField(
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          endTime = value.format(context);
                        });
                      }
                    });
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: endTime,
                      hintStyle: getBodyTextStyle(),
                      suffixIcon: Icon(
                        Icons.watch_later_outlined,
                        color: Appcolors.Primary,
                      )),
                ))
              ],
            ),
            const Gap(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: List.generate(3, (int index) {
                      return Padding(
                        padding: const EdgeInsets.all(3),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              colorIndex = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: index == 0
                                ? Appcolors.Primary
                                : index == 1
                                    ? Appcolors.Pink
                                    : Appcolors.Orang,
                            child: colorIndex == index
                                ? Icon(
                                    Icons.check,
                                    color: Appcolors.white,
                                  )
                                : null,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                CustomButton(
                  text: 'Create Task',
                  onPressed: () {},
                  width: 140,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
