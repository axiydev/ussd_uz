class InternetPackages{
  String? mb;
  String? about;
  String? desc;
  String? img;
  InternetPackages({this.mb,this.about,this.desc});
  InternetPackages.redir({this.mb,this.about,this.desc,this.img});
  InternetPackages.fromJson(Map<String,dynamic> json):
      this.mb=json['mb'],
      this.about=json['about'],
      this.desc=json['desc'];
  Map<String,dynamic> toJson()=>{
    "mb":this.mb,
    "about":this.about,
    'desc':this.desc,
  };
  Map<String,dynamic> toJsonRedirect()=>{
    "mb":this.mb,
    "about":this.about,
    'desc':this.desc,
    'img':this.img,
  };
  String? get getStrMb=>this.mb;
  String? get getStrAbout=>this.about;
  String? get getStrDesc=>this.desc;
  String? get getStrImg=>this.img;
}