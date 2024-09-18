// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hb_task/widgets/base_button.dart';
import 'package:intl/intl.dart';

import 'package:hb_task/services/model/content_model.dart';

class SecondaryScreen extends StatelessWidget {
  const SecondaryScreen({super.key, required this.selectedActivity, required this.trackName});
  final ContentModel? selectedActivity;
  final String? trackName;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(trackName ?? "")),
        backgroundColor: Colors.blueGrey[900],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(color: Colors.blueGrey[900]),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(flex: 2, child: imagePicker(selectedActivity?.artworkUrl100)),
                      Expanded(
                        flex: 5,
                        child: Card(
                          color: Colors.blueGrey[900],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                    text: "Type: ",
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                    children: [
                                      TextSpan(
                                          text: selectedActivity?.kind != null ? selectedActivity?.kind ?? "" : "Book",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal, fontSize: 20, color: Colors.white)),
                                    ]),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Writer: ",
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                    children: [
                                      TextSpan(
                                          text: selectedActivity?.artistName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal, fontSize: 20, color: Colors.white)),
                                    ]),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                              Text.rich(
                                TextSpan(
                                    text: "Release Date: ",
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                    children: [
                                      TextSpan(
                                          text: formatDate(selectedActivity?.releaseDate ?? "---"),
                                          style: const TextStyle(fontWeight: FontWeight.normal)),
                                    ]),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(color: Colors.blueGrey[100]),
                  child: Column(
                    children: [
                      if (selectedActivity!.longDescription != null)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                const Text(
                                  "Description: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(selectedActivity?.longDescription ?? "")
                              ]),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (selectedActivity!.trackPrice != null)
                              BaseButton(
                                  text: "Price\n${selectedActivity?.trackPrice ?? ""}",
                                  isPressable: true,
                                  onPressedFunction: () {
                                    showSnackBar(
                                        selectedActivity?.trackName ?? "", selectedActivity?.trackPrice ?? 0.0);
                                  },
                                  colorChange: true),
                            const SizedBox(
                              width: 15,
                            ),
                            if (selectedActivity!.trackHdPrice != null)
                              BaseButton(
                                  text: "Hd Price:\n${selectedActivity?.trackHdPrice}",
                                  isPressable: true,
                                  onPressedFunction: () {
                                    showSnackBar(
                                        selectedActivity?.trackName ?? "", selectedActivity?.trackHdPrice ?? 0.0);
                                  },
                                  colorChange: true),
                            const SizedBox(
                              width: 15,
                            ),
                            if (selectedActivity!.collectionHdPrice != null)
                              BaseButton(
                                  text: "Collection Hd Price:\n${selectedActivity?.collectionHdPrice}",
                                  isPressable: true,
                                  onPressedFunction: () {
                                    showSnackBar(
                                        selectedActivity?.trackName ?? "", selectedActivity?.collectionHdPrice ?? 0.0);
                                  },
                                  colorChange: true),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SnackbarController showSnackBar(String trackName, double price) {
    return Get.showSnackbar(GetSnackBar(
      title: trackName,
      message: "Product purchase successful.\nÖdenen tutar: $price",
      icon: const Icon(
        Icons.add_shopping_cart,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 3),
    ));
  }

  Widget imagePicker(String? imageUrl) {
    return imageUrl == null
        ? const Icon(
            Icons.movie_creation_outlined,
            size: 50,
          )
        : Image.network(imageUrl);
  }

  String formatDate(String? isoDateString) {
    if (isoDateString == null) {
      DateTime dateTime = DateTime.parse(isoDateString!);
      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      return formattedDate;
    } else {
      return "";
    }
  }
}
