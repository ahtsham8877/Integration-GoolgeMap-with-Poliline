import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goolemap_poliline/controller/map_controller.dart';
import 'package:goolemap_poliline/view/map_view.dart';
import 'package:goolemap_poliline/widget/custom_text.dart';

class MapPointer extends StatelessWidget {
  MapPointer({super.key});

  final mainGoogleMapController = Get.put(MainGoogleMapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: GoogleMapSc(
                      index: mainGoogleMapController.mapIndex.value)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black26,
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  int index =
                      (mainGoogleMapController.scrollController.offset / 350)
                          .floor();
                  mainGoogleMapController.setCurrentMarker(index);
                  mainGoogleMapController.mapIndex.value = index;
                }
                return false;
              },
              child: SizedBox(
                height: 140,
                child: ListView.builder(
                  controller: mainGoogleMapController.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: mainGoogleMapController.list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 180,
                      width: 350,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(132, 255, 195, 125),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 8, right: 8, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            CustomText(
                              title1: "Ahtsham${index + 1}",
                              title1Color: const Color.fromARGB(255, 8, 8, 8),
                              title1fontSize: 20,
                              title1fontWeight: FontWeight.bold,
                              midtext: "Speciles",
                              midtextColor2:
                                  const Color.fromARGB(255, 131, 1, 1),
                              midtext2: "Location londan",
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
