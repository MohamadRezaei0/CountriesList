import 'package:countrylist/controller/country_list_controller.dart';
import 'package:countrylist/view/widget/country_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryListScreen extends StatelessWidget {
  final CountryListController _controller = Get.put(CountryListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (_controller.isLoading.value) {
                print("Loading");
                return Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(8),
                    // physics: ChampionScr,
                    // shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final country = _controller.countries[index];
                      return CountryCard(
                        name: country.name,
                        id: country.id.toString(),
                        cid: country.countryId.toString(),
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(height: 8),
                    itemCount: _controller.countries.length,
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
