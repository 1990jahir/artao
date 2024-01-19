class ApiManager {
  ApiManager._();

  //Base URL
  //static const baseUrl = 'https://hair-app.onrender.com/api/v1/';
  static const baseUrl = 'http://54.177.51.232:3000/api/v1/';
  static const imageBaseUrl = 'https://crowningglorylm.com/api/v1/';
  static const imageUrl = 'https://crowningglorylm.com/hair-backend/';
  //Authentication URL
  static const signUp = 'register';
  static const signIn = 'login';
  static const sendVerificationEmail = 'forgetPassword';
  static const verifyForgotEmail = 'veified-code';
  static const resetPassword = 'reset-password';

  //Profile URL
  static const getProfile = 'user/';
  static const editProfile = 'update-user/';
  static const updateProfile = '/api/auth/update-profile';
  static const imageUpload = 'uploads/imageProfile';

  //Miscellaneous URL
  static const termsCondition = 'get-content';
  static const taskResults = 'https://www.ailabapi.com/api/common/query-async-task-result';
  static const privacyPolicy = '/api/cms/app/privacy-policy';
  static const tips = '/api/tips/app/list';
  static const offset = '/api/offset/app/list';
  static const notification = '/api/fcm/app/get-all-notification';
  static const deleteAccount = '/api/auth/app/block-user';
  static const saveImage = 'https://crowningglorylm.com/api/v1/uploads/user-hair-image/';
  static const getSaveImage = 'https://crowningglorylm.com/api/v1/uploads/user-hair-image-get/';
}
