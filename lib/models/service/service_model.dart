class ServiceMod{
  final List<ServiceSingleMod> list;
  ServiceMod.fromJson(Map<String,dynamic> json):
        this.list=List<ServiceSingleMod>.from(json['list'].map((i)=>ServiceSingleMod.fromJson(i)));
  Map<String,dynamic> toJson()=>{
    'list':List<dynamic>.from(list.map((i)=>i.toJson())),
  };
}

class ServiceSingleMod{
  final int id;
  final String name;
  final String nameRu;
  final String nameKr;
  final String description;
  final String descriptionRu;
  final String descriptionKr;
  final String ussdCode;
  final int order;
  final int operator;
  final int category;
  final String createdAt;
  final String updatedAt;

  ServiceSingleMod.fromJson(Map<String,dynamic> json):
        this.id=json['id'],
        this.name=json['name'],
        this.nameRu=json['nameRu'],
        this.nameKr=json['nameKr'],
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



//#service category
class ServiceModCategory{
  final List<ServiceSingleModCategory> list;
  ServiceModCategory.fromJson(Map<String,dynamic> json):
        this.list=List<ServiceSingleModCategory>.from(json['list'].map((i)=>ServiceSingleModCategory.fromJson(i)));
  Map<String,dynamic> toJson()=>{
    'list':List<dynamic>.from(list.map((i)=>i.toJson())),
  };
}

class ServiceSingleModCategory{
  final int id;
  final String name;
  final String nameRu;
  final String nameKr;
  final String info;
  final String infoRu;
  final String infoKr;
  final int order;
  final int operator;
  final String createdAt;
  final String updatedAt;

  ServiceSingleModCategory.fromJson(Map<String,dynamic> json):
        this.id=json['id'],
        this.name=json['name'],
        this.nameRu=json['nameRu'],
        this.nameKr=json['nameKr'],
        this.info=json['info'],
        this.infoRu=json['infoRu'],
        this.infoKr=json['infoKr'],
        this.order=json['order'],
        this.operator=json['operator'],
        this.createdAt=json['createdAt'],
        this.updatedAt=json['updatedAt'];

  Map<String,dynamic> toJson()=>{
    'id':this.id,
    'name':this.name,
    'nameRu':this.nameRu,
    'nameKr':this.nameKr,
    'info':this.info,
    'infoRu':this.infoRu,
    'infoKr':this.infoKr,
    'order':this.order,
    'operator':this.operator,
    'createdAt':this.createdAt,
    'updatedAt':this.updatedAt,
  };
}