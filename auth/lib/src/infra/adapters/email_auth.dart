// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:async/async.dart';
import 'package:async/src/result/result.dart';
import 'package:auth/src/domain/auth_service_contract.dart';
import 'package:auth/src/domain/credential.dart';
import 'package:auth/src/domain/signup_service_contract.dart';
import 'package:auth/src/domain/token.dart';
import 'package:auth/src/infra/api/auth_api_contract.dart';

class EmailAuth implements IAuthService, ISignUpService {

  final IAuthApi _api;
  Credential _credential;
  EmailAuth(
    this._api,
    this._credential,
  );


    void credential({
    required String email,
    required String password,
  }) {
    _credential = Credential(
      type: AuthType.email,
      email: email,
      password: password, 
      name: '',
    );
  }


  @override
  Future<Result<Token>> signIn() async {
    assert(_credential != null);
    var result = await _api.signIn(_credential);
    if(result.isError) return result.asError!;
    return Result.value(Token(result.asValue!.value));
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<Token>> signUp(String name, String email, String password) {

  }
  
}
