abstract class ApiDao{
  //for api GET method response
  Future<dynamic> getApiResponse(String uri);
  //for api POST method response
  Future<dynamic> postApiResponse(String uri, dynamic body);
}