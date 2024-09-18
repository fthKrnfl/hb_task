import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hb_task/controllers/first_screen_controller.dart';
import 'package:hb_task/widgets/base_button.dart';
import 'package:hb_task/widgets/base_text_field.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final FirstScreenController firstScreenController = Get.find();
    var size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.blueGrey[900],
      elevation: 3,
      title: const Center(child: Text("Home Screen")),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 5.0, right: 5.0, bottom: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: CustomTextField(
                  controller: firstScreenController.textEditingController,
                  inputType: TextInputType.name,
                  name: "Search",
                  prefixIcon: Icons.search,
                  onChangedFun: (value) {
                    firstScreenController.searchText.value = value;
                    print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                    print(value);
                  },
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Container(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Obx(
                    () => Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: BaseButton(
                            text: "Movie",
                            isPressable: true,
                            colorChange: firstScreenController.filterMovie.value,
                            onPressedFunction: () {
                              if (firstScreenController.filterMovie.value == false) {
                                firstScreenController.filterMovie.value = true;
                                firstScreenController.fetchSearchResults(firstScreenController.searchText.value);
                              } else {
                                firstScreenController.filterMovie.value = false;
                                firstScreenController.fetchSearchResults(firstScreenController.searchText.value);
                              }
                            },
                            color: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: BaseButton(
                            text: "Music",
                            isPressable: true,
                            colorChange: firstScreenController.filterMusic.value,
                            onPressedFunction: () {
                              if (firstScreenController.filterMusic.value == false) {
                                firstScreenController.isLoading.value = true;
                                firstScreenController.filterMusic.value = true;
                                firstScreenController.fetchSearchResults(firstScreenController.searchText.value);
                              } else {
                                firstScreenController.filterMusic.value = false;
                                firstScreenController.isLoading.value = true;
                                firstScreenController.fetchSearchResults(firstScreenController.searchText.value);
                              }
                            },
                            color: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: BaseButton(
                            text: "Tv Show",
                            isPressable: true,
                            colorChange: firstScreenController.filterTvShow.value,
                            onPressedFunction: () {
                              if (firstScreenController.filterTvShow.value == false) {
                                firstScreenController.filterTvShow.value = true;
                                firstScreenController.fetchSearchResults(firstScreenController.searchText.value);
                              } else {
                                firstScreenController.filterTvShow.value = false;
                                firstScreenController.fetchSearchResults(firstScreenController.searchText.value);
                              }
                            },
                            color: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: BaseButton(
                            text: "Book",
                            isPressable: true,
                            colorChange: firstScreenController.filterBook.value,
                            onPressedFunction: () {
                              if (firstScreenController.filterBook.value == false) {
                                firstScreenController.filterBook.value = true;
                                firstScreenController.fetchSearchResults(firstScreenController.searchText.value);
                              } else {
                                firstScreenController.filterBook.value = false;
                                firstScreenController.fetchSearchResults(firstScreenController.searchText.value);
                              }
                            },
                            color: Theme.of(context).colorScheme.secondaryContainer,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
