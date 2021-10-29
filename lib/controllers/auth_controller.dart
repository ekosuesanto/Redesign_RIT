class AuthController {
  String username='';
  String password='';
  String token='';

  AuthController(String username, String password, String token){
    if(username.isEmpty){
    }else if(password.isEmpty){
    }else if(token.isEmpty){
    }else{
      AuthManager();
    }
  }

}

class AuthManager {

}