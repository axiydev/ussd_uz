import 'package:http/http.dart' as http;

class NetworkD{
static final String BASE_URL="greatcentralasia1.uz";


static String API_INTERNET='/api/network';

static Map<String,String> headers={
  'Content-type': 'application/json; charset=UTF-8',
};

static Future<String?> GET(String api,Map<String,String> params)async{

   var uri=Uri.http(BASE_URL,api,params);
   http.Response response=await http.get(uri,headers:headers);
   if(response.statusCode==200){
     return response.body;
   }
   return null;
 }

 static Map<String,String> paramsEmpty(){
  Map<String,String> mp=new Map();
  return mp;
 }
}
