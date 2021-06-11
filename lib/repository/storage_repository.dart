import 'package:countrylist/constants/constants.dart';
import 'package:countrylist/model/country_model.dart';
import 'package:sqflite/sqflite.dart';

const String columnId = "id";
const String columnName = "name";
const String tableName = "countries";
const String columnCid = "country_id";

class StorageRepository {
  Database _db;

  static Future<bool> databaseExists() async => databaseFactory
      .databaseExists(await getDatabasesPath() + Constants.dbFileName);

  Future<void> open() async {
    String path = (await getDatabasesPath()) + Constants.dbFileName;
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
        create table $tableName (
            $columnId integer primary key autoincrement,
            $columnName text not null,
            $columnCid integer not null)
          ''',
        );
      },
    );
  }

  Future<void> insert(Country country) async {
    await _db.insert(
      tableName,
      {
        columnId: country.id,
        columnName: country.name,
        columnCid: country.countryId,
      },
    );
  }

  Future<List<Country>> getCountries() async {
    return (await _db.rawQuery("select * from $tableName")).map(
      (country) {
        return Country.fromJson(country);
      },
    ).toList();
  }

  Future close() async => _db.close();
}
