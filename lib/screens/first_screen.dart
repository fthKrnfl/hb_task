import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hb_task/controllers/first_screen_controller.dart';
import 'package:hb_task/screens/sec_screen.dart';
import 'package:hb_task/widgets/custome_app_bar.dart';
import 'package:hb_task/widgets/list_card_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final firstScreenController = Get.put(FirstScreenController());
    return Obx(
      () => Scaffold(
        appBar: const CustomeAppBar(),
        body: Container(
          color: Colors.blueGrey[100],
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0, bottom: 5.0),
            child: firstScreenController.contentList.isNotEmpty
                ? ListView.builder(
                    itemCount: firstScreenController.contentList.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Get.to(SecondaryScreen(
                          selectedActivity: firstScreenController.contentList[index],
                          trackName: firstScreenController.contentList[index].trackName,
                        ));
                      },
                      child: ListCardWidget(
                        selectedActivity: firstScreenController.contentList[index],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
          ),
        ),
      ),
    );
  }
}
