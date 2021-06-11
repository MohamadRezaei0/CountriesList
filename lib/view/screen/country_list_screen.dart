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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Country list", style: TextStyle(fontSize: 22)),
              Obx(() {
                if (_controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: _controller.countries.length,
                      padding: EdgeInsets.all(8),
                      itemBuilder: (_, index) {
                        final country = _controller.countries[index];
                        return CountryCard(
                          name: country.name,
                          id: country.id.toString(),
                          cid: country.countryId.toString(),
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(height: 8),
                    ),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
