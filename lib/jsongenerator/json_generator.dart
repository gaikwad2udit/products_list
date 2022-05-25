import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class JsonGenerator {
  void JsongeneratorFuntion() async {
    List<Map<String, dynamic>> allproduct = [];
    int i = 0;

    // print("after timer");
    // var neww = alphabeticalOrderGen(1);

    for (int i = 1; i <= 1000; i++) {
      var x = alphabeticalOrderGen(i);
      String productname = 'Product ${x}';
      int productrating = Random().nextInt(6);
      String productDescription = await getDescription();
      String productURl = await getphotoURL();

      allproduct.add({
        'ProductName': productname,
        'productRating': productrating,
        'productDescription': productDescription,
        'productUrl': productURl
      });
    }

    Map<String, dynamic> products = {'Products': allproduct};

    var jsonstring = json.encode(products);
    print(jsonstring);
  }

  Future<String> getphotoURL() async {
    String photourl = '';
    http.Request req =
        http.Request("Get", Uri.parse('https://picsum.photos/400'))
          ..followRedirects = false;
    http.Client baseClient = http.Client();
    http.StreamedResponse response = await baseClient.send(req);
    Uri redirectUri = Uri.parse(response.headers['location']!);
    //print(response.headers);
    return redirectUri.toString();
  }

  Future<String> getDescription() async {
    var res = await http
        .get(Uri.parse('https://baconipsum.com/api/?type=meat-and-filler'));

    // print(res.statusCode);
    // print(res.body);
    return res.statusCode == 200 ? res.body.substring(2, 70) : '';
  }

  String alphabeticalOrderGen(int index) {
    //index++;

    Map<int, String> alphabets = {
      0: "Z",
      1: 'A',
      2: 'B',
      3: 'C',
      4: 'D',
      5: 'E',
      6: 'F',
      7: 'G',
      8: 'H',
      9: 'I',
      10: 'J',
      11: 'K',
      12: "L",
      13: 'M',
      14: "N",
      15: "O",
      16: "P",
      17: "Q",
      18: 'R',
      19: "S",
      20: 'T',
      21: 'U',
      22: 'V',
      23: "W",
      24: 'X',
      25: 'Y',
      26: 'Z'
    };

    String result = '';

    String twodigit(int index) {
      if (index % 26 == 0) {
        var a = index / 26;
        var newindex = a.toInt() * 26 - 1;

        var first = newindex / 26;
        result = alphabets[first.toInt()]!;

        result = result + alphabets[26]!;
        return result;
      } else {
        var first = index / 26;
        result = alphabets[first.toInt()]!;

        var second = index % 26;
        result = result + alphabets[second]!;
        return result;
      }
    }
    //String num = index.toString();

    // 0-26
    if (index <= 26) {
      return alphabets[index]!;
    }
    // 28 - 729
    else if (index > 26 && index <= 702) {
      return twodigit(index);
    }
    // 729 + 26 > and 19683 + 729 <  assuming index wont go further 19683
    else {
      var a = index / 26;
      var firsttwo = twodigit(a.toInt());

      if (index % 26 == 0) {
        return firsttwo + alphabets[26]!;
      } else {
        return firsttwo + alphabets[index % 26]!;
      }
    }
  }
}
