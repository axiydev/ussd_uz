class USSD_UZ{
  final int id;
  final String name;
  final String nameRu;
  final String nameKr;
  final String ussdCode;
  final int order;
  final int operator;
  final String createdAt;
  final String updatedAt;
  USSD_UZ.fromJson(Map<String,dynamic> json):
       this.id=json['id'],
       this.name=json['name'],
       this.nameRu=json['nameRu'],
       this.nameKr=json['nameKr'],
       this.ussdCode=json['ussdCode'],
       this.order=json['order'],
       this.operator=json['operator'],
       this.createdAt=json['createdAt'],
       this.updatedAt=json['updatedAt'];
  Map<String,dynamic> toJson()=>{
    'id':this.id,
    'name':this.name,
    'nameRu':this.nameRu,
    'nameKr':this.nameKr,
    'ussdCode':this.ussdCode,
    'order':this.order,
    'operator':this.operator,
    'createdAt':this.createdAt,
    'updatedAt':this.updatedAt,
  };
 }