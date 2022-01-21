
/// App cached data in memory
class AppData{
  String sessionId = '';
  static final appData = AppData();
  AppData();
  static AppData getInstance() {
    return appData;
  }
}
