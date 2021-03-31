class ComInter{
  final List<MyInterMod> list;
  ComInter.fromJson(Map<String,dynamic> json):
      this.list=List<MyInterMod>.from(json['list'].map((i)=>MyInterMod.fromJson(i)));
  Map<String,dynamic> toJson()=>{
    'list':List<dynamic>.from(list.map((i)=>i.toJson())),
  };
}

class MyInterMod{
 final int id;
 final String name;
 final String nameRu;
 final String nameKr;
 final String price;
 final String priceRu;
 final String priceKr;
 final String hajmi;
 final String hajmiRu;
 final String hajmiKr;
 final String muddat;
 final String muddatRu;
 final String muddatKr;
 final String description;
 final String descriptionRu;
 final String descriptionKr;
 final String ussdCode;
 final int order;
 final int operator;
 final int category;
 final String createdAt;
 final String updatedAt;
 
 MyInterMod.fromJson(Map<String,dynamic> json):
    this.id=json['id'],
    this.name=json['name'],
    this.nameRu=json['nameRu'],
    this.nameKr=json['nameKr'],
    this.price=json['price'],
    this.priceRu=json['priceRu'],
    this.priceKr=json['priceKr'],
    this.hajmi=json['hajmi'],
    this.hajmiRu=json['hajmiRu'],
    this.hajmiKr=json['hajmiKr'],
    this.muddat=json['muddat'],
    this.muddatRu=json['muddatRu'],
    this.muddatKr=json['muddatKr'],
    this.description=json['description'],
    this.descriptionRu=json['descriptionRu'],
    this.descriptionKr=json['descriptionKr'],
    this.ussdCode=json['ussdCode'],
    this.order=json['order'],
    this.operator=json['operator'],
    this.category=json['category'],
    this.createdAt=json['createdAt'],
    this.updatedAt=json['updatedAt'];

 Map<String,dynamic> toJson()=>{
   'id':this.id,
   'name':this.name,
   'nameRu':this.nameRu,
   'nameKr':this.nameKr,
   'price':this.price,
   'priceRu':this.priceRu,
   'priceKr':this.priceKr,
   'hajmi':this.hajmi,
   'hajmiRu':this.hajmiRu,
   'hajmiKr':this.hajmiKr,
   'muddat':this.muddat,
   'muddatRu':this.muddatRu,
   'muddatKr':this.muddatKr,
   'description':this.description,
   'descriptionRu':this.descriptionRu,
   'descriptionKr':this.descriptionKr,
   'ussdCode':this.ussdCode,
   'order':this.order,
   'operator':this.operator,
   'category':this.category,
   'createdAt':this.createdAt,
   'updatedAt':this.updatedAt,
   };
}