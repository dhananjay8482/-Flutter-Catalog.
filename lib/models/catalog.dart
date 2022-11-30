class CatalogModel {
  static List<Item> items = [

  ];
}

class Item {
  var id;
  var name;
  var desc;
  var price;
  var color;
  var image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});

  factory Item.fromMap(Map<String, dynamic>map){
    return Item(
        id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap()=>{
    "id":id,
    "name":name,
    "desc":desc,
    "price":price,
    "color":color,
    "image":image,
  };

}