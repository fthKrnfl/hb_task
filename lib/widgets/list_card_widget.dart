import 'package:flutter/material.dart';
import 'package:hb_task/services/model/content_model.dart';
import 'package:intl/intl.dart';

class ListCardWidget extends StatefulWidget {
  const ListCardWidget({super.key, required this.selectedActivity});

  final ContentModel? selectedActivity;
  final String deneme = "asd";

  @override
  State<ListCardWidget> createState() => _ListCardWidgetState();
}

class _ListCardWidgetState extends State<ListCardWidget> {
  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<HomeScreenProvider>(context, listen: false);
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: imagePicker(widget.selectedActivity?.artworkUrl100),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Tooltip(
                    message: widget.selectedActivity?.trackName ?? "",
                    child: Text(
                      widget.selectedActivity?.trackName ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tooltip(
                    message: widget.selectedActivity?.artistName,
                    child: Text.rich(
                      TextSpan(text: "Type: ", style: const TextStyle(fontWeight: FontWeight.bold), children: [
                        TextSpan(
                            text: widget.selectedActivity?.kind != null ? widget.selectedActivity?.kind ?? "" : "Book",
                            style: const TextStyle(fontWeight: FontWeight.normal)),
                      ]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Tooltip(
                    message: widget.selectedActivity?.artistName,
                    child: Text.rich(
                      TextSpan(text: "Writer: ", style: const TextStyle(fontWeight: FontWeight.bold), children: [
                        TextSpan(
                            text: widget.selectedActivity?.artistName,
                            style: const TextStyle(fontWeight: FontWeight.normal)),
                      ]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text.rich(
                    TextSpan(text: "Release Date: ", style: const TextStyle(fontWeight: FontWeight.bold), children: [
                      TextSpan(
                          text: formatDate(widget.selectedActivity?.releaseDate),
                          style: const TextStyle(fontWeight: FontWeight.normal)),
                    ]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  const Text(
                    "Short Description:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Tooltip(
                    message: widget.selectedActivity?.shortDescription ?? "",
                    child: Text(
                      widget.selectedActivity?.shortDescription ?? "-",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Text(
                    "price:",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: 5),
                  if (widget.selectedActivity!.trackPrice != null || widget.selectedActivity!.collectionPrice != null)
                    Text(
                      "${widget.selectedActivity?.trackPrice != null ? widget.selectedActivity?.trackPrice.toString() ?? "" : widget.selectedActivity?.collectionPrice.toString() ?? ""}\$",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.blue[800]),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
    DateTime dateTime = DateTime.parse(isoDateString!);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }
}
