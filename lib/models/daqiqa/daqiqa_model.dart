class DaqiqaMod{
  final List<DaqiqaSingleMod> list;
  DaqiqaMod.fromJson(Map<String,dynamic> json):
        this.list=List<DaqiqaSingleMod>.from(json['list'].map((i)=>DaqiqaSingleMod.fromJson(i)));
  Map<String,dynamic> toJson()=>{
    'list':List<dynamic>.from(list.map((i)=>i.toJson())),
  };
}

class DaqiqaSingleMod{
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

  DaqiqaSingleMod.fromJson(Map<String,dynamic> json):
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
class DaqiqaModCategory{
  final List<DaqiqaSingleModCategory> list;
  DaqiqaModCategory.fromJson(Map<String,dynamic> json):
        this.list=List<DaqiqaSingleModCategory>.from(json['list'].map((i)=>DaqiqaSingleModCategory.fromJson(i)));
  Map<String,dynamic> toJson()=>{
    'list':List<dynamic>.from(list.map((i)=>i.toJson())),
  };
}

class DaqiqaSingleModCategory{
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

  DaqiqaSingleModCategory.fromJson(Map<String,dynamic> json):
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