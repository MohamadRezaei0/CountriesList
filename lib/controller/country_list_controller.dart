import 'package:countrylist/model/country_model.dart';
import 'package:countrylist/repository/country_list_repository.dart';
import 'package:get/get.dart';

class CountryListController extends GetxController {
  var isLoading = false.obs;
  var countries = <Country>[].obs;

  @override
  void onInit() {
    getCountryList();
    super.onInit();
  }

  Future getCountryList() async {
    isLoading(true);
    final streamResponse = await CountryListRepository.getCountryList();
    isLoading(false);
    streamResponse.forEach(
      (response) {
        if (response.statusCode == 200) {
          countries(countryModelFromJson(response.body).countries);
        } else {
          print("getCountryList: no data");
        }
      },
    );
  }
}
