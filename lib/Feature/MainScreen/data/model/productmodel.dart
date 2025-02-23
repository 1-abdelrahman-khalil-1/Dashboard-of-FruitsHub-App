class Productmodel {
   int id;
   String name;
   int price;
   String description;
   
  bool organic = false;
   int calories;
   String imageUrl;
   String category;

  Productmodel(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.organic,
      required this.calories,
      required this.imageUrl,
      required this.category});

 Map<String,dynamic> toMap (Productmodel product) {
    return {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'description': product.description,
      'organic': product.organic,
      'calories': product.calories,
      'imageUrl': product.imageUrl,
      'category': product.category
    };
  }
 factory Productmodel.FromJson(Map<String,dynamic> json) {
  return Productmodel(
    id: json['id'],
    name: json['name'],
    price: json['price'],
    description: json['description'],
    organic: json['organic'],
    calories: json['calories'],
    imageUrl: json['imageUrl'],
    category: json['category']
  );
  }
 }   

