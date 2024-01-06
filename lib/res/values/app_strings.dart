class AppStrings{
  static const appName = "LocaRate";
  static const searchbar = "Search";
  static const dynamicError = "Error Status code";
  static const dbName = 'locaStore_database.db';
  static const tableName = 'favourites';
  static const createTableName =
      'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, address TEXT, lat REAL, lng REAL, urlPath TEXT, rating REAL, time TEXT)';
}