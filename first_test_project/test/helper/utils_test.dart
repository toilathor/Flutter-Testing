import 'package:first_test_project/helper/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('check for to number addition', () {
    // Arrange
    var x = 145;
    var y = 7;

    // Act
    var sum = add(x, y);

    // Assert
    expect(sum, 152);
  });
}
