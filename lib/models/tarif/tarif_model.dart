class TarifMod{
  final List<TarifSingleMod> list;
  TarifMod.fromJson(Map<String,dynamic> json):
        this.list=List<TarifSingleMod>.from(json['list'].map((i)=>TarifSingleMod.fromJson(i)));
  Map<String,dynamic> toJson()=>{
    'list':List<dynamic>.from(list.map((i)=>i.toJson())),
  };
}

class TarifSingleMod{
  final int id;
  final String name;
  final String nameRu;
  final String nameKr;
  final String description;
  final String descriptionRu;
  final String descriptionKr;
  final String batafsil;
  final String batafsilRu;
  final String batafsilKr;
  final String ussdCode;
  final int order;
  final int operator;
  final String image;
  final int price;
  final int minut;
  final int sms;
  final int network;
  final String createdAt;
  final String updatedAt;

  TarifSingleMod.fromJson(Map<String,dynamic> json,):
        this.id=json['id'],
        this.name=json['name'],
        this.nameRu=json['nameRu'],
        this.nameKr=json['nameKr'],
        this.description=json['description'],
        this.descriptionRu=json['descriptionRu'],
        this.descriptionKr=json['descriptionKr'],
        this.batafsil=json['batafsil'],
        this.batafsilRu=json['batafsilRu'],
        this.batafsilKr=json['batafsilKr'],
        this.ussdCode=json['ussdCode'],
        this.order=json['order'],
        this.operator=json['operator'],
        this.image=json['image'],
        this.price=json['price'],
        this.minut=json['minut'],
        this.sms=json['sms'],
        this.network=json['network'],
        this.createdAt=json['createdAt'],
        this.updatedAt=json['updatedAt'];

  Map<String,dynamic> toJson()=>{
    'id':this.id,
    'name':this.name,
    'nameRu':this.nameRu,
    'nameKr':this.nameKr,
    'description':this.description,
    'descriptionRu':this.descriptionRu,
    'descriptionKr':this.descriptionKr,
    'batafsil':this.batafsil,
    'batafsilRu':this.batafsilRu,
    'batafsilKr':this.batafsilKr,
    'ussdCode':this.ussdCode,
    'order':this.order,
    'operator':this.operator,
    'image':this.image,
    'price':this.price,
    'minut':this.minut,
    'sms':this.sms,
    'network':this.network,
    'createdAt':this.createdAt,
    'updatedAt':this.updatedAt,
  };
}