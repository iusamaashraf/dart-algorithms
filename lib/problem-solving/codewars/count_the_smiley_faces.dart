// Given an array (arr) as an argument complete the function countSmileys that
//should return the total number of smiling faces.
// Source: https://www.codewars.com/kata/583203e6eb35d7980400002a

// Rules for a smiling face:

//     Each smiley face must contain a valid pair of eyes. Eyes can be marked as : or ;
//     A smiley face can have a nose but it does not have to. Valid characters for a nose are - or ~
//     Every smiling face must have a smiling mouth that should be marked with either ) or D

// No additional characters are allowed except for those mentioned.

// Valid smiley face examples: :) :D ;-D :~)
// Invalid smiley faces: ;( :> :} :]
// Example

// countSmileys([':)', ';(', ';}', ':-D']);       // should return 2;
// countSmileys([';D', ':-(', ':-)', ';~)']);     // should return 3;
// countSmileys([';]', ':[', ';*', ':$', ';-D']); // should return 1;

// Note

// In case of an empty array return 0. You will not be tested with invalid input
//(input will always be an array). Order of the face (eyes, nose, mouth) elements will always be the same.

// Solution
import 'package:test/test.dart';

int countSmileys(List<String> arr) {
  var smileyCount = 0;
  for (var entry in arr) {
    if (RegExp(r'^[;:][-~]?[)D]$').hasMatch(entry)) {
      smileyCount++;
    }
  }
  return smileyCount;
}

// Tests
void main() {
  group('Fixed tests', () {
    test('Testing for []', () => expect(countSmileys([]), equals(0)));
    test("Testing for [':)', ';(', ';}', ':-D']",
        () => expect(countSmileys([':)', ';(', ';}', ':-D']), equals(2)));
    test(
        "Testing for [';]', ':[', ';*', ':\$', ';-D']",
        () =>
            expect(countSmileys([';]', ':[', ';*', ':\$', ';-D']), equals(1)));
    test("Testing for [':)',':(',':D',':O',':;']",
        () => expect(countSmileys([':)', ':(', ':D', ':O', ':;']), equals(2)));
    test("Testing for [':-)',';~D',':-D',':_D']",
        () => expect(countSmileys([':-)', ';~D', ':-D', ':_D']), equals(3)));
    test("Testing for [':---)','))',';~~D',';D']",
        () => expect(countSmileys([':---)', '))', ';~~D', ';D']), equals(1)));
    test("Testing for [';~)',':)',':-)',':--)']",
        () => expect(countSmileys([';~)', ':)', ':-)', ':--)']), equals(3)));
    test("Testing for [':o)',':--D',';-~)']",
        () => expect(countSmileys([':o)', ':--D', ';-~)']), equals(0)));
  });
}
