class ReviewModel {
  final String name;
  final double rating;
  final String review;

  ReviewModel({required this.name, required this.rating, required this.review});

  static List<ReviewModel> reviews = [
    ReviewModel(
        name: 'Yelena Belova',
        rating: 4.0,
        review:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    ReviewModel(
        name: 'Stephen Strange',
        rating: 3.0,
        review:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    ReviewModel(
        name: 'Peter Parker',
        rating: 4.0,
        review:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    ReviewModel(
        name: "t'chala",
        rating: 3.0,
        review:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    ReviewModel(
        name: 'Tony Stark',
        rating: 5.0,
        review:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    ReviewModel(
        name: 'Peter Quil',
        rating: 4.0,
        review:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    ReviewModel(
        name: 'Wanda Maximof',
        rating: 5.0,
        review:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  ];
}
