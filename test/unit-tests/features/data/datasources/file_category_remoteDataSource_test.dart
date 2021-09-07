import 'package:flippy/features/data/datasources/category_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late FileCategoryRemoteDataSource dataSource;
  setUp(() {
    dataSource = FileCategoryRemoteDataSource();
  });

  test('should return List count more then one element', () async {
    final result = await dataSource.getAll();
    expect(result.length > 0, true);
  });
}
