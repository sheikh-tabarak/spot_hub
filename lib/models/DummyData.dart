// ignore_for_file: file_names, constant_identifier_names

import 'package:spot_hub/models/BusinessModels/Product.dart';
import 'package:spot_hub/models/ReviewModels/ReviewsModel.dart';
import 'package:spot_hub/models/BusinessModels/Bussiness.dart';
import 'package:spot_hub/models/UserModels/UserClass.dart';

const DummyBussinesses = [
  Bussiness(
      BussinessId: "SHB1",
      BussinessImageUrl:
          "https://images.unsplash.com/photo-1534009502677-4e5080efa8c6?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MnwxfDB8MXxyYW5kb218MHx8aG90ZWx8fHx8fHwxNjc3MzAzMTEz&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080",
      BussinessName: "The Grand Hotel",
      BussinessEmail: "admin@grandhotel.com",
      BussinessCity: "New York",
      BussinessAddress: "123 Main St",
      BussinessPhone: "555-1234",
      BussinessType: "Hotel",
      BussinessWebsite: "grandhotel.com",
      Reports: 0),
  Bussiness(
      BussinessId: "SHB2",
      BussinessImageUrl:
          "https://images.unsplash.com/photo-1470114755716-3e1124c6c3bd?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MnwxfDB8MXxyYW5kb218MHx8cmVzdHVyYW50fHx8fHx8MTY3NzMxOTc0OQ&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080",
      BussinessName: "Pasta Palace",
      BussinessEmail: "admin@pastapalace.com",
      BussinessCity: "Chicago",
      BussinessAddress: "456 State St",
      BussinessPhone: "555-5678",
      BussinessType: "Restaurant",
      BussinessWebsite: "pastapalace.com",
      Reports: 0),
  Bussiness(
      BussinessId: "SHB3",
      BussinessImageUrl:
          "https://images.unsplash.com/photo-1610641818989-c2051b5e2cfd?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MnwxfDB8MXxyYW5kb218MHx8aG90ZWx8fHx8fHwxNjc3MzAzMTIz&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080",
      BussinessName: "The Plaza Hotel",
      BussinessEmail: "admin@theplazahotel.com",
      BussinessCity: "New York",
      BussinessAddress: "789 Fifth Ave",
      BussinessPhone: "555-9012",
      BussinessType: "Hotel",
      BussinessWebsite: "theplazahotel.com",
      Reports: 0),
  Bussiness(
      BussinessId: "SHB4",
      BussinessImageUrl:
          "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MnwxfDB8MXxyYW5kb218MHx8cmVzdHVyYW50fHx8fHx8MTY3NzMxOTYzNA&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080",
      BussinessName: "Burger Bistro",
      BussinessEmail: "admin@burgerbistro.com",
      BussinessCity: "Los Angeles",
      BussinessAddress: "101 Main St",
      BussinessPhone: "555-3456",
      BussinessType: "Restaurant",
      BussinessWebsite: "burgerbistro.com",
      Reports: 0),
  Bussiness(
      BussinessId: "SHB5",
      BussinessImageUrl:
          "https://images.unsplash.com/photo-1574728435494-4134e681f687?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MnwxfDB8MXxyYW5kb218MHx8aG90ZWxzfHx8fHx8MTY3NzMxOTgxNg&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080",
      BussinessName: "The Ritz-Carlton",
      BussinessEmail: "admin@ritzcarlton.com",
      BussinessCity: "San Francisco",
      BussinessAddress: "234 Market St",
      BussinessPhone: "555-7890",
      BussinessType: "Hotel",
      BussinessWebsite: "ritzcarlton.com",
      Reports: 0)
];

const DummyProducts = [
  Product(
      isRecommended: true,
      Id: 'SHFP1',
      BussinessId: 'SHB5',
      image:
          'https://images.unsplash.com/photo-1615719413546-198b25453f85?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MnwxfDB8MXxyYW5kb218MHx8cGl6emF8fHx8fHwxNjc3MTI3NDg2&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=500',
      description:
          "Delicious pizza topped with pepperoni, cheese, and fresh vegetables",
      title: "Pepperoni Pizza",
      Price: 12.99,
      rating: 5,
      reviews: 44,
      Category: 'Fast Food'),
];
//   Product(
//       isRecommended: false,
//       Id: 'SHFP2',
//       BussinessId: 'SHB1',
//       image:
//           "https://images.unsplash.com/photo-1590577976322-3d2d6e2130d5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MnwxfDB8MXxyYW5kb218MHx8c3VzaGl8fHx8fHwxNjc3MTI3NTc0&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=500",
//       description:
//           "Variety of fresh sushi rolls, including tuna, salmon, and avocado",
//       title: "Sushi Platter",
//       Price: 12.99,
//       rating: 1.3,
//       reviews: 34),
//   Product(
//       isRecommended: false,
//       Id: 'SHFP3',
//       BussinessId: 'SHB1',
//       image:
//           "https://images.unsplash.com/photo-1446611720526-39d16597055c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MnwxfDB8MXxyYW5kb218MHx8aGFtYnVyZ2VyfHx8fHx8MTY3NzEyNzc3MA&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=500",
//       description: "Juicy hamburger with all the fixings, served with fries",
//       title: "Hamburger and Fries",
//       Price: 9.99,
//       rating: 4.3,
//       reviews: 32),
//   Product(
//       isRecommended: false,
//       Id: 'SHFP4',
//       BussinessId: 'SHB1',
//       image:
//           "https://images.unsplash.com/photo-1518133683791-0b9de5a055f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
//       description:
//           "Three soft tacos filled with your choice of protein and topped with salsa, sour cream, and cheese",
//       title: "Taco Plate",
//       Price: 10.99,
//       rating: 4.0,
//       reviews: 12),
//   Product(
//       isRecommended: true,
//       Id: 'SHFP5',
//       BussinessId: 'SHB1',
//       image:
//           "https://www.indianhealthyrecipes.com/wp-content/uploads/2015/10/pizza-recipe-2.jpg",
//       description:
//           "Fettuccine Alfredo with grilled chicken and a side of garlic bread",
//       title: "Chicken Alfredo Pasta",
//       Price: 13.99,
//       rating: 5,
//       reviews: 5),
//   Product(
//       isRecommended: false,
//       Id: 'SHFP6',
//       BussinessId: 'SHB3',
//       image:
//           "https://www.indianhealthyrecipes.com/wp-content/uploads/2015/10/pizza-recipe-2.jpg",
//       description:
//           "Mixed greens with cherry tomatoes, cucumbers, and your choice of dressing",
//       title: "Garden Salad",
//       Price: 8.99,
//       rating: 3.3,
//       reviews: 2),
//   Product(
//       isRecommended: false,
//       Id: 'SHFP7',
//       BussinessId: 'SHB3',
//       image:
//           "https://www.indianhealthyrecipes.com/wp-content/uploads/2015/10/pizza-recipe-2.jpg",
//       description:
//           "Turkey, bacon, and avocado sandwich on toasted bread with lettuce and mayonnaise",
//       title: "Turkey Club Sandwich",
//       Price: 11.99,
//       rating: 3.3,
//       reviews: 12),
//   Product(
//       isRecommended: false,
//       Id: 'SHFP8',
//       BussinessId: 'SHB4',
//       image:
//           "https://www.indianhealthyrecipes.com/wp-content/uploads/2015/10/pizza-recipe-2.jpg",
//       description: "Golden fried chicken served with mashed potatoes and gravy",
//       title: "Fried Chicken Dinner",
//       Price: 14.99,
//       rating: 4.7,
//       reviews: 43),
//   Product(
//       isRecommended: false,
//       Id: 'SHFP9',
//       BussinessId: 'SHB2',
//       image:
//           "https://www.indianhealthyrecipes.com/wp-content/uploads/2015/10/pizza-recipe-2.jpg",
//       description:
//           "Stir-fried noodles with your choice of protein and vegetables",
//       title: "Stir-Fried Noodles",
//       Price: 12.99,
//       rating: 3.0,
//       reviews: 70),
//   Product(
//       isRecommended: false,
//       Id: 'SHFP10',
//       BussinessId: 'SHB2',
//       image:
//           "https://www.indianhealthyrecipes.com/wp-content/uploads/2015/10/pizza-recipe-2.jpg",
//       description: "Hearty bowl of chicken noodle soup, served with a roll",
//       title: "Chicken Noodle Soup",
//       Price: 9.99,
//       rating: 2.3,
//       reviews: 3),
//   Product(
//       isRecommended: false,
//       Id: 'SHFP11',
//       BussinessId: 'SHB1',
//       image:
//           "https://www.indianhealthyrecipes.com/wp-content/uploads/2015/10/pizza-recipe-2.jpg",
//       description: "Vegetable stir-fry with tofu and brown rice",
//       title: "Vegetable Stir-Fry",
//       Price: 11.99,
//       rating: 1.0,
//       reviews: 0),
//   Product(
//       isRecommended: true,
//       Id: 'SHFP12',
//       BussinessId: 'SHB1',
//       image:
//           "https://www.indianhealthyrecipes.com/wp-content/uploads/2015/10/pizza-recipe-2.jpg",
//       description:
//           "Slow-cooked BBQ ribs with a side of coleslaw and baked beans",
//       title: "BBQ Ribs",
//       Price: 16.99,
//       rating: 3.1,
//       reviews: 5),
//   Product(
//       isRecommended: false,
//       Id: 'SHFP13',
//       BussinessId: 'SHB5',
//       image:
//           "https://www.indianhealthyrecipes.com/wp-content/uploads/2015/10/pizza-recipe-2.jpg",
//       description: "Stack of three fluffy pancakes with butter and syrup",
//       title: "Pancakes",
//       Price: 7.99,
//       rating: 2.3,
//       reviews: 63)
// ];

const ReviewsData = [
  ReviewsModel(
    ProductId: 'SHFP13',
    ReviewId: 1,
    Name: 'John Doe 1',
    Review: 'Food Was Amazing',
    Stars: 4.9,
    TimeStamp: 'two days ago',
  ),
  ReviewsModel(
    ProductId: 'SHFP13',
    ReviewId: 2,
    Name: 'John Doe 2',
    Review: 'Food Was Amazing',
    Stars: 4.9,
    TimeStamp: 'two days ago',
  ),
  ReviewsModel(
    ProductId: 'SHFP13',
    ReviewId: 3,
    Name: 'John Doe 3',
    Review: 'Food Was Amazing',
    Stars: 4.9,
    TimeStamp: 'two days ago',
  ),
  ReviewsModel(
    ProductId: 'SHFP12',
    ReviewId: 4,
    Name: 'John Doe 4',
    Review: 'Food Was Amazing',
    Stars: 4.9,
    TimeStamp: 'two days ago',
  ),
  ReviewsModel(
    ProductId: 'SHFP12',
    ReviewId: 5,
    Name: 'John Doe 5',
    Review: 'Food Was Amazing',
    Stars: 4.9,
    TimeStamp: 'two days ago',
  ),
  ReviewsModel(
    ProductId: 'SHFP11',
    ReviewId: 6,
    Name: 'John Doe 6',
    Review: 'Food Was Amazing',
    Stars: 4.9,
    TimeStamp: 'two days ago',
  ),
  ReviewsModel(
    ProductId: 'SHFP10',
    ReviewId: 7,
    Name: 'John Doe 7',
    Review: 'Food Was Amazing',
    Stars: 4.9,
    TimeStamp: 'two days ago',
  ),
  ReviewsModel(
    ProductId: 'SHFP9',
    ReviewId: 8,
    Name: 'John Doe 8',
    Review: 'Food Was Amazing',
    Stars: 4.9,
    TimeStamp: 'two days ago',
  ),
  ReviewsModel(
    ProductId: 'SHFP8',
    ReviewId: 9,
    Name: 'John Doe 9',
    Review: 'Food Was Amazing',
    Stars: 4.9,
    TimeStamp: 'two days ago',
  ),
  ReviewsModel(
    ProductId: 'SHFP7',
    ReviewId: 10,
    Name: 'John Doe 10',
    Review: 'Food Was Amazing',
    Stars: 4.9,
    TimeStamp: 'two days ago',
  ),
  ReviewsModel(
    ProductId: 'SHFP8',
    ReviewId: 11,
    Name: 'John Doe 11',
    Review: 'Poor Quality',
    Stars: 1,
    TimeStamp: 'just Now',
  ),
  ReviewsModel(
    ProductId: 'SHFP5',
    ReviewId: 12,
    Name: 'William Son',
    Review: 'Ammazing , Just Love it !!\n It was so so amazing',
    Stars: 5,
    TimeStamp: 'just Now',
  ),
];
