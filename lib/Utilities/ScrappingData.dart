import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as html;

Future<void> scrapeData() async {
  final url = 'https://www.foodpanda.pk/restaurant/w5of/baba-g-chaska-point';

  // Send a GET request to the URL
  final response = await http.get(Uri.parse(url));

  // Parse the HTML content
  final document = htmlParser.parse(response.body);

  // Find all elements with class "f-title-small-font-size" for titles
  final titleElements = document.getElementsByClassName('f-title-small-font-size');
  final titles = titleElements.map((element) => element.text.trim()).toList();

  // Find all elements with class "dish-description" for descriptions
  final descriptionElements = document.getElementsByClassName('dish-description');
  final descriptions = descriptionElements.map((element) => element.text.trim()).toList();

  // Combine titles and descriptions into a list of products
  final products = List.generate(
    titles.length,
    (index) => {'title': titles[index], 'description': descriptions[index]},
  );

  // Print the list of products
  for (final product in products) {
    print('Title: ${product['title']}');
    print('Description: ${product['description']}');
    print('-------------------');
  }
}

void main() {
  scrapeData();
}