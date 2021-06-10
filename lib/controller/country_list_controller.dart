import 'package:connectivity/connectivity.dart';
import 'package:countrylist/model/country_model.dart';
import 'package:countrylist/repository/country_list_repository.dart';
import 'package:get/get.dart';

class CountryListController extends GetxController {
  var isLoading = false.obs;
  var countries = <Country>[].obs;

  @override
  void onInit() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      getCountryList();
    } else {
      print("storage");
    }
    super.onInit();
  }

  Future getCountryList() async {
    try {
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
    } catch (e) {}
  }
}
