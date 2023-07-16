import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:spot_hub/models/BusinessModels/Product.dart';

String extractNumber(String input) {
  RegExp regex = RegExp(r'</span>(\d+)');
  Match? match = regex.firstMatch(input);

  if (match != null && match.groupCount >= 1) {
    return match.group(1)!;
  }

  return '';
}

Future getWebsiteData() async {
  final url = Uri.parse("https://www.freecodecamp.org/news/tag/code");
  final response = await http.get(url);
  dom.Document html = dom.Document.html(response.body);

  final titles = html
      .querySelectorAll('h2.post-card-title > a')
      .map((e) => e.innerHtml.trim())
      .toList();

  print("count= ${titles.length.toString()}");

  for (final title in titles) {
    print(title);
    // debugPrint(title as String?);
  }
}

Future<void> scrapeImages() async {
  List<String> imageLinks = [];
  final response = await http.get(Uri.parse(
      'https://www.ubereats.com/ca/store/angithi-biryani-%26-wraps/IS_rnnuhTIS9s7AiQNTk-Q?ps=1'));

  try {
    if (response.statusCode == 200) {
      final document = htmlParser.parse(response.body);
      final elements =
          document.querySelectorAll('div.ag.as.at.d4.du.e2 > picture > img');

      //   setState(() {
      imageLinks =
          elements.map((element) => element.attributes['src'] ?? '').toList();
      //  });
      for (final image in imageLinks) {
        print(' ${image} ');
      }
    }
  } catch (e) {
    print(e);
  }

  // if (response.statusCode == 200) {
  //   final document = htmlParser.parse(response.body);
  //   final elements =
  //       document.querySelectorAll('div.lazyload-wrapper > picture > img');

  //   //   setState(() {
  //   imageLinks =
  //       elements.map((element) => element.attributes['src'] ?? '').toList();
  //   //  });
  //   for (final image in imageLinks) {
  //     print(' ${image} ');
  //   }
  // }
}

// Future<void> scrapeImages() async {
//   List<String> imageLinks = [];
//   final response = await http.get(Uri.parse(
//       'https://www.ubereats.com/ca/store/angithi-biryani-%26-wraps/IS_rnnuhTIS9s7AiQNTk-Q?ps=1'));
//   dom.Document html = dom.Document.html(response.body);

//   if (response.statusCode == 200) {
//     final document = htmlParser.parse(response.body);
//     final elements = document.querySelectorAll(
//         '#main-content > div:nth-child(6) > div > div.c9.fz > ul > li:nth-child(1) > ul > li:nth-child(1) > div > div > div.gm.c9.d1.bl.ak > div.ak > div.lazyload-wrapper > picture > img');

//     imageLinks =
//         elements.map((element) => element.attributes['src'] ?? '').toList();
//   }

//   for (final image in imageLinks) {
//     print(' ${image} ');
//   }

// }

Future getProductsFromZarrasha() async {
  try {
    final url = Uri.parse(
        "https://www.zarrasha.com/en/store/Dominos-pizza-University-Road/1032258");
    final response = await http.get(url);

    dom.Document html = dom.Document.html(response.body);

    // div > div > div.gm.c9.d1.bl.ak > div.ak > div.lazyload-wrapper > picture > img
// div.gq.bz.d9.bb.ak > div.ak >

    final image = await html
        .querySelectorAll(
            //"img.post-card-image"
            'img.ng-tns-c49-12'
            //  'div.gq.bz.d9.bb.ak > div.ak > div.lazyload-wrapper > picture > img.e0.gq.bz.dy.d9.i8.i9.ia'
            )
        .map((e) => e.attributes['src']!)
        .toList();

    final titles = html
        .querySelectorAll('div.p-detail-sec')
        .map((e) => e.innerHtml.trim())
        .toList();

    final desc = html
        .querySelectorAll('span.ng-tns-c49-12')
        .map((e) => e.innerHtml.trim())
        .toList();

    final prices = html
        .querySelectorAll('div.priceText.ng-tns-c49-12.ng-star-inserted')
        .map((e) => e.innerHtml.trim())
        .toList();

    await Future.delayed(Duration(seconds: 5));

    print(
        "count= ${titles.length.toString()} count= ${image.length.toString()}");

    for (var i = 0; i < titles.length; i++) {
      "Title: ${titles[i]}";
    }

    for (final title in titles) {
      print('$title');
      // debugPrint(title as String?);
    }

    for (final price in prices) {
      String newprice = price.replaceAll(
          '<span class="woocommerce-Price-currencySymbol">₨</span>', '');
      print(' ${newprice} ');
    }

    for (final image in image) {
      print(' ${image} ');
    }

    for (String desc in desc) {
      //String newdesc = desc.replaceRange(0, 12, "");
      // String newdesc = desc.replaceAll(
      //     '<span class="woocommerce-Price-currencySymbol">₨</span>', '');
      print(' ${desc}');
    }
  } catch (e) {
    print(e);
  }
}

Future getProductsFromKhizarTikka() async {
  final url = Uri.parse("https://www.khizertikkashop.com/menu/");
  final response = await http.get(url);

  dom.Document html = dom.Document.html(response.body);

  // div > div > div.gm.c9.d1.bl.ak > div.ak > div.lazyload-wrapper > picture > img
// div.gq.bz.d9.bb.ak > div.ak >

  final image = await html
      .querySelectorAll('div.pro>a.pro_pic>img')
      .map((e) => e.attributes['src']!)
      .toList();

  final titles = html
      .querySelectorAll('div.pro>h2>a')
      .map((e) => e.innerHtml.trim())
      .toList();

  final desc = html
      .querySelectorAll('div.pro_info>p')
      .map((e) => e.innerHtml.trim())
      .toList();

  final prices = html
      .querySelectorAll('h2 > div > span > span > bdi')
      .map((e) => e.innerHtml.trim())
      .toList();

  await Future.delayed(Duration(seconds: 5));

  print("count= ${titles.length.toString()} count= ${image.length.toString()}");

  for (var i = 0; i < titles.length; i++) {
    print("Image Link: ${image[i]}");
    print("Title: ${titles[i]}");
    print("Description: ${desc[i]}");
    print(
        "Price: ${prices[i].replaceAll('<span class="woocommerce-Price-currencySymbol">₨</span>', '')}");

    await AddNewProduct(
        image[i],
        titles[i],
        desc[i],
        "Desi Foods",
        double.parse(prices[i]
            .replaceAll(
                '<span class="woocommerce-Price-currencySymbol">₨</span>', '')
            .toString()));
  }

  // for (final title in titles) {
  //   print('$title');
  //   // debugPrint(title as String?);
  // }

  // for (final price in prices) {
  //   String newprice = price.replaceAll(
  //       '<span class="woocommerce-Price-currencySymbol">₨</span>', '');
  //   print(' ${newprice} ');
  // }

  // for (final image in image) {
  //   print(' ${image} ');
  // }

  // for (String desc in desc) {
  //   //String newdesc = desc.replaceRange(0, 12, "");
  //   // String newdesc = desc.replaceAll(
  //   //     '<span class="woocommerce-Price-currencySymbol">₨</span>', '');
  //   print(' ${desc}');
  // }
}

Future getWebsitefromKFC() async {
  final url = Uri.parse("https://www.kfcpakistan.com/menu#EverydayValue?ps=1"
      //"https://www.kfcpakistan.com/menu"
      // "https://www.ubereats.com/ca/store/angithi-biryani-%26-wraps/IS_rnnuhTIS9s7AiQNTk-Q?ps=1"
      //"https://www.freecodecamp.org/news/tag/code"
      //  "https://www.ubereats.com/ca/store/pi-co-pizza-bar-king-%26-church/haxKXCvNS2CGkgHhr5nx4g?ps=1"
      //"https://www.ubereats.com/ca/store/angithi-biryani-%26-wraps/IS_rnnuhTIS9s7AiQNTk-Q?ps=1"
      );
  final response = await http.get(url);

  dom.Document html = dom.Document.html(response.body);

  // div > div > div.gm.c9.d1.bl.ak > div.ak > div.lazyload-wrapper > picture > img
// div.gq.bz.d9.bb.ak > div.ak >

  final image = await html
      .querySelectorAll(
          //"img.post-card-image"
          'img.card-img-top card-img'
          //  'div.gq.bz.d9.bb.ak > div.ak > div.lazyload-wrapper > picture > img.e0.gq.bz.dy.d9.i8.i9.ia'
          )
      .map((e) => e.attributes['src']!)
      .toList();

  final titles = html
      .querySelectorAll('h5.card-title')
      .map((e) => e.innerHtml.trim())
      .toList();

  final desc = html
      .querySelectorAll('p.card-text')
      .map((e) => e.innerHtml.trim())
      .toList();

  final prices = html
      .querySelectorAll('h4.kfc-price')
      .map((e) => e.innerHtml.trim())
      .toList();

  await Future.delayed(Duration(seconds: 5));

  print("count= ${titles.length.toString()} count= ${image.length.toString()}");

  for (final title in titles) {
    print('$title}');
    // debugPrint(title as String?);
  }

  for (final price in prices) {
    print(' ${price} ');
  }

  for (final image in image) {
    print(' ${image} ');
  }

  for (final desc in desc) {
    print(' ${desc} ');
  }
}

Future getWebsiteDataUerEats() async {
  final url = Uri.parse(
      "https://www.ubereats.com/ca/store/angithi-biryani-%26-wraps/IS_rnnuhTIS9s7AiQNTk-Q?ps=1"
      //"https://www.freecodecamp.org/news/tag/code"
      //  "https://www.ubereats.com/ca/store/pi-co-pizza-bar-king-%26-church/haxKXCvNS2CGkgHhr5nx4g?ps=1"
      //"https://www.ubereats.com/ca/store/angithi-biryani-%26-wraps/IS_rnnuhTIS9s7AiQNTk-Q?ps=1"
      );
  final response = await http.get(url);

  dom.Document html = dom.Document.html(response.body);

  // div > div > div.gm.c9.d1.bl.ak > div.ak > div.lazyload-wrapper > picture > img
// div.gq.bz.d9.bb.ak > div.ak >

  final image = await html
      .querySelectorAll(
          //"img.post-card-image"
          'div.gq.bz.d9.bb.ak>div.ak>div.lazyload-wrapper>picture>img.e0.gq.bz.dy.d9.i8.i9.ia'
          //  'div.gq.bz.d9.bb.ak > div.ak > div.lazyload-wrapper > picture > img.e0.gq.bz.dy.d9.i8.i9.ia'
          )
      .map((e) => e.attributes['src']!)
      .toList();

  final titles = html
      .querySelectorAll('span.hf.eu.hg.be.cs.bg.en.b1')
      .map((e) => e.innerHtml.trim())
      .toList();

  final prices = html
      .querySelectorAll('span.hf.eu.hg.be.bf.ct.en.b1')
      .map((e) => e.innerHtml.trim())
      .toList();

  await Future.delayed(Duration(seconds: 5));

  print("count= ${titles.length.toString()} count= ${image.length.toString()}");

  for (final title in titles) {
    print('$title - ${prices[0]}  - ${image.length}');
    // debugPrint(title as String?);
  }

  for (final price in prices) {
    print(' ${prices} ');
  }

  for (final image in image) {
    print(' ${image} ');
  }
}

String _one = "Nothing";
String _two = "Nothing";

Future<List<String>> extractData() async {
//Getting the response from the targeted url
  final response =
      await http.Client().get(Uri.parse('https://www.geeksforgeeks.org/'));
  //Status Code 200 means response has been received successfully
  if (response.statusCode == 200) {
    //Getting the html document from the response
    var document = parser.parse(response.body);
    try {
      //Scraping the first article title
      var responseString1 = document
          .getElementsByClassName('articles-list')[0]
          .children[0]
          .children[0]
          .children[0];

      print(responseString1.text.trim());

      //Scraping the second article title
      var responseString2 = document
          .getElementsByClassName('articles-list')[0]
          .children[1]
          .children[0]
          .children[0];

      // print(responseString2.text.trim());

      //Scraping the third article title
      var responseString3 = document
          .getElementsByClassName('articles-list')[0]
          .children[2]
          .children[0]
          .children[0];

      print(responseString3.text.trim());
      //Converting the extracted titles into string and returning a list of Strings
      return [
        responseString1.text.trim(),
        responseString2.text.trim(),
        responseString3.text.trim()
      ];
    } catch (e) {
      return ['', '', 'ERROR!$e'];
    }
  } else {
    return ['', '', 'ERROR: ${response.statusCode}.'];
  }
}

// Future<void> scrapeData() async {
//   final url = 'https://www.foodpanda.pk/restaurant/w5of/baba-g-chaska-point';

//   // Send a GET request to the URL
//   final response = await http.get(Uri.parse(url));

//   // Parse the HTML content
//   final document = htmlParser.parse(response.body);

//   // Find all elements with class "f-title-small-font-size" for titles
//   final titleElements = document.getElementsByClassName('f-title-small-font-size');
//   final titles = titleElements.map((element) => element.text.trim()).toList();

//   // Find all elements with class "dish-description" for descriptions
//   final descriptionElements = document.getElementsByClassName('dish-description');
//   final descriptions = descriptionElements.map((element) => element.text.trim()).toList();

//   // Combine titles and descriptions into a list of products
//   final products = List.generate(
//     titles.length,
//     (index) => {'title': titles[index], 'description': descriptions[index]},
//   );

//   // Print the list of products
//   for (final product in products) {
//     print('Title: ${product['title']}');
//     print('Description: ${product['description']}');
//     print('-------------------');
//   }
// }

void main() {
  extractData();
  print(_one);
  print(_two);
}
