class Product {
  final int id;
  final String title, description, image, price, location, recovered, email;

  Product(
      {this.id,
      this.price,
      this.title,
      this.description,
      this.recovered,
      this.image,
      this.location,
      this.email});
}

// list of products
// for our demo
List<Product> products = [
  Product(
    id: 1,
    price: "AB +",
    title: "John Doe",
    image: "assets/images/Item_1.png",
    email: "johndoe10@gmail.com",
    recovered: "3 weeks",
    location: "Noida",
    description:
        "Hi I am John! I have all the necessary documents required to donate plasma. So if you need plasma kindly contact me from the button below",
  ),
  Product(
    id: 4,
    price: "O -",
    title: "James Doe",
    image: "assets/images/Item_2.png",
    email: "jamesdoe@gmail.com",
    recovered: "2 weeks",
    location: "Gurgaon",
    description:
        "I am completely fit to donate plasma. Please contact in case of requirement!",
  ),
  Product(
    id: 9,
    price: "B +",
    title: "Jenna Doe",
    image: "assets/images/Item_3.png",
    email: "jennadoe@outlook.com",
    recovered: "1 week",
    location: "Ahemdabad",
    description:
        "I want to donate plasma and am completely verified for doing so..",
  ),
  Product(
    id: 10,
    price: "A +",
    title: "Anonymous",
    image: "assets/images/Vkq2a.png",
    email: "anonymoususer@yahoo.com",
    recovered: "2 weeks",
    location: "Pune",
    description: "No description is available as the user is anonymous",
  ),
];
