import 'package:dating_demo/all_file/all_file.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @GET("/data/v1/user")
  Future<UserResp?> getUsers({
        @Query("limit") String? limit = AppConstant.PAGE_SIZE_DEFAULT_STRING,
        @Query("page") String? page
      });
}
