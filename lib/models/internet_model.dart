class InternetPackages{
  String? mb;
  String? about;
  InternetPackages({this.mb,this.about});
  InternetPackages.fromJson(Map<String,dynamic> json):
      this.mb=json['mb'],
      this.about=json['about'];
  Map<String,dynamic> toJson()=>{
    "mb":this.mb,
    "about":this.about,
  };
  String? get getStrMb=>this.mb;
  String? get getStrAbout=>this.about;
}