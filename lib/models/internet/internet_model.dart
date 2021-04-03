class InternetPackages{
  String? mb;
  String? about;
  String? desc;
  InternetPackages({this.mb,this.about,this.desc});
  InternetPackages.fromJson(Map<String,dynamic> json):
      this.mb=json['mb'],
      this.about=json['about'],
      this.desc=json['desc'];
  Map<String,dynamic> toJson()=>{
    "mb":this.mb,
    "about":this.about,
    'desc':this.desc,
  };
  String? get getStrMb=>this.mb;
  String? get getStrAbout=>this.about;
  String? get getStrDesc=>this.desc;
}