import 'package:connectivity/connectivity.dart';
import 'package:countrylist/model/country_model.dart';
import 'package:countrylist/repository/country_list_repository.dart';
import 'package:countrylist/repository/storage_repository.dart';
import 'package:get/get.dart';

class CountryListController extends GetxController {
  var isLoading = false.obs;
  var countries = <Country>[].obs;

  @override
  void onInit() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      getCountryListFromApi();
    } else if (await StorageRepository.databaseExists()) {
      getCountryListFromDB();
    }

    super.onInit();
  }

  Future getCountryListFromApi() async {
    try {
      isLoading(true);
      final streamResponse = await CountryListRepository.getCountryList();
      streamResponse.forEach(
        (response) async {
          if (response.statusCode == 200) {
            countries(countryModelFromJson(response.body).countries);
            if (!(await StorageRepository.databaseExists())) {
              final store = StorageRepository();
              await store.open();
              countries.forEach((country) {
                store.insert(country);
              });
            }
          } else {
            print(response.statusCode);
          }
        },
      );
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future getCountryListFromDB() async {
    isLoading(true);
    try {
      final store = StorageRepository();
      await store.open();
      countries(await store.getCountries());
      store.close();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
