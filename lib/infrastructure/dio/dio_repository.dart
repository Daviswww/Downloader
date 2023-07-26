abstract class DioRepository {
  /// Download target file.
  ///
  /// args[0]: SendPort, args[1]: String, args[2]: Url
  ///
  /// https://wonderfulengineering.com/wp-content/uploads/2016/01/Desktop-Background-11-768x432.jpg
  Future<void> downloadFile(List<dynamic> args);
}
