class InfoModel{
  final String name;
  final String info;
  InfoModel({required this.name,required this.info});
  Map<String,dynamic> toJson()=>{
    'name':this.name,
    'info':this.info,
  };
}