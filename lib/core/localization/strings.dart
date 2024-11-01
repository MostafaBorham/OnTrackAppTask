import 'package:easy_localization/easy_localization.dart';

abstract class AppStrings {
  static const String _appName = 'appName';
  static const String _myGellary = 'myGellary';
  static const String _signin = 'signin';
  static const String _signup = 'signup';
  static const String _userName = 'userName';
  static const String _password = 'password';
  static const String _yourPassword = 'yourPassword';
  static const String _name = 'name';
  static const String _yourName = 'yourName';
  static const String _submit = 'submit';
  static const String _copiedToClipboard = "copiedToClipboard";
  static const String _copy = "copy";
  static const String _noInternetConnection = "noInternetConnection";
  static const String _yes = "yes";
  static const String _cancel = "cancel";
  static const String _areYouSure = "areYouSure";
  static const String _deleteChat = "deleteChat";
  static const String _online = 'online';
  static const String _offline = 'offline';
  static const String _sending = 'sending';
  static const String _successSend = 'successSend';
  static const String _failSend = 'failSend';
  static const String _hi = 'hi';
  static const String _anonymousUser = 'anonymousUser';
  static const String _showMore = 'showMore';
  static const String _noProductsFound = 'noProductsFound';
  static const String _filterByCategory = 'filterByCategory';
  static const String _searchInProducts = 'searchInProducts';
  static const String _rating = 'rating';
  static const String _sortByPrice = 'sortByPrice';
  static const String _sortByName = 'sortByName';
  static const String _aToZ = 'aToZ';
  static const String _zToA = 'zToA';
  static const String _lowToHigh = 'lowToHigh';
  static const String _highToLow = 'highToLow';
  static const String _addProduct = 'addProduct';
  static const String _addProductName = 'addProductName';
  static const String _addProductPrice = 'addProductPrice';
  static const String _addProductDescription = 'addProductDescription';
  static const String _uploadImage = 'uploadImage';
  static const String _saveAndPublish = 'saveAndPublish';

  ///errors
  static const String _offlineError = 'offlineErrorMsg';
  static const String _serverError = 'serverErrorMsg';
  static const String _cacheError = 'cacheErrorMsg';
  static const String _invalidPageNumberError = 'invalidPageNumberErrorMsg';
  static const String _timeoutError = 'timeoutErrorMsg';
  static const String _noCurrentUser = 'noCurrentUser';
  static const String _noDeviceToken = 'noDeviceToken';
  static const String _noImagePicked = 'noImagePicked';

  ///
  static const String _noMessage = 'noMessage';
  static const String _upload = 'upload';
  static const String _welcome = 'welcome';
  static const String _gellary = 'gellary';
  static const String _camera = 'camera';
  static const String _successLoginMsg = 'successLoginMsg';
  static const String _successPayment = 'successPayment';
  static const String _successSave = 'successSave';
  static const String _languageBtnTxt = 'languageBtnTxt';
  static const String _welcomeToChatGPT = 'welcomeToChatGPT';
  static const String _donotHaveAccount = 'donotHaveAccount';
  static const String _haveAccount = 'haveAccount';
  static const String _next = 'next';
  static const String _edit = 'edit';
  static const String _yourEmail = 'yourEmail';
  static const String _email = 'email';
  static const String _delete = 'delete';
  static const String _letsChat = 'letsChat';
  static const String _loginAsGuest = 'loginAsGuest';
  static const String _newChat = 'newChat';
  static const String _clearConversations = 'clearConversations';
  static const String _upgradeToPlus = 'upgradeToPlus';
  static const String _plusVersion = 'plusVersion';
  static const String _lightMode = 'lightMode';
  static const String _updateProfile = 'updateProfile';
  static const String _updatesAndFAQ = 'updatesAndFAQ';
  static const String _logout = 'logout';
  static const String _newTxt = 'new';
  static const String _back = 'back';
  static const String _noChatStartChatNow = 'noChatStartChatNow';

  ///Local Data
  static const String _examples = 'examples';
  static const String _examplesService1 = 'examplesService1';
  static const String _examplesService2 = 'examplesService2';
  static const String _examplesService3 = 'examplesService3';
  static const String _capabilities = 'capabilities';
  static const String _capabilitiesService1 = 'capabilitiesService1';
  static const String _capabilitiesService2 = 'capabilitiesService2';
  static const String _capabilitiesService3 = 'capabilitiesService3';
  static const String _limitations = 'limitations';
  static const String _limitationsService1 = 'limitationsService1';
  static const String _limitationsService2 = 'limitationsService2';
  static const String _limitationsService3 = 'limitationsService3';

  ///

  ///Validation Messages
  static const String _nameRequired = 'nameRequired';
  static const String _descriptionRequired = 'descriptionRequired';
  static const String _priceShouldBeDigits = 'priceShouldBeDigits';
  static const String _priceRequired = 'priceRequired';
  static const String _nameTooShort = 'nameTooShort';
  static const String _descriptionTooShort = 'descriptionTooShort';
  static const String _nameAlphabetOnly = 'nameAlphabetOnly';
  static const String _nameFormatInvalid = 'nameFormatInvalid';
  static const String _emailRequired = 'emailRequired';
  static const String _emailTooShort = 'emailTooShort';
  static const String _emailFormatInvalid = 'emailFormatInvalid';
  static const String _passwordRequired = 'passwordRequired';
  static const String _passwordTooShort = 'passwordTooShort';
  static const String _passwordFormatInvalid = 'passwordFormatInvalid';
  static const String _password1Uppercase = 'password1Uppercase';
  static const String _password1Lowercase = 'password1Lowercase';
  static const String _password1SpecialCharacter = 'password1SpecialCharacter';
  static const String _password1Digit = 'password1Digit';
  static const String _phoneRequired = 'phoneRequired';
  static const String _phoneTooShort = 'phoneTooShort';
  static const String _phoneFormatInvalid = 'phoneFormatInvalid';
  static const String _productCategoryIsRequired = 'productCategoryIsRequired';
  static const String _productImageIsRequired = 'productImageIsRequired';

  /////////////////////////////////////////////////////////////////

  static String get nameRequired => _nameRequired.tr();
  static String get descriptionRequired => _descriptionRequired.tr();
  static String get priceShouldBeDigits => _priceShouldBeDigits.tr();
  static String get priceRequired => _priceRequired.tr();
  static String get nameTooShort => _nameTooShort.tr();
  static String get descriptionTooShort => _descriptionTooShort.tr();
  static String get nameAlphabetOnly => _nameAlphabetOnly.tr();
  static String get nameFormatInvalid => _nameFormatInvalid.tr();
  static String get emailRequired => _emailRequired.tr();
  static String get emailTooShort => _emailTooShort.tr();
  static String get emailFormatInvalid => _emailFormatInvalid.tr();
  static String get passwordRequired => _passwordRequired.tr();
  static String get passwordTooShort => _passwordTooShort.tr();
  static String get passwordFormatInvalid => _passwordFormatInvalid.tr();
  static String get phoneRequired => _phoneRequired.tr();
  static String get phoneTooShort => _phoneTooShort.tr();
  static String get phoneFormatInvalid => _phoneFormatInvalid.tr();
  static String get password1Lowercase => _password1Lowercase.tr();
  static String get password1Uppercase => _password1Uppercase.tr();
  static String get password1Digit => _password1Digit.tr();
  static String get password1SpecialCharacter =>
      _password1SpecialCharacter.tr();

  static String get appName => _appName.tr();

  static String get newChat => _newChat.tr();

  static String get edit => _edit.tr();

  static String get yourEmail => _yourEmail.tr();
  static String get yourEmailKey => _yourEmail;

  static String get email => _email.tr();
  static String get emailKey => _email;

  static String get next => _next.tr();

  static String get letsChat => _letsChat.tr();

  static String get loginAsGuest => _loginAsGuest.tr();

  static String get limitationsKey => _limitations;
  static String get limitations => _limitations.tr();

  static String get capabilitiesKey => _capabilities;
  static String get capabilities => _capabilities.tr();

  static String get examplesKey => _examples;
  static String get examples => _examples.tr();

  static String get donotHaveAccount => _donotHaveAccount.tr();
  static String get donotHaveAccountKey => _donotHaveAccount;

  static String get haveAccount => _haveAccount.tr();
  static String get haveAccountKey => _haveAccount;

  static String get myGellary => _myGellary.tr();

  static String get signin => _signin.tr();
  static String get signinKey => _signin;

  static String get signup => _signup.tr();
  static String get signupKey => _signup;

  static String get userName => _userName.tr();

  static String get password => _password.tr();
  static String get passwordKey => _password;

  static String get yourPassword => _yourPassword.tr();
  static String get yourPasswordKey => _yourPassword;

  static String get name => _name.tr();
  static String get nameKey => _name;

  static String get yourName => _yourName.tr();
  static String get yourNameKey => _yourName;

  static String get submit => _submit.tr();

  static String get copiedToClipboard => _copiedToClipboard.tr();

  static String get copy => _copy.tr();

  static String get noInternetConnection => _noInternetConnection.tr();

  static String get yes => _yes.tr();

  static String get cancel => _cancel.tr();

  static String get areYouSure => _areYouSure.tr();

  static String get deleteChat => _deleteChat.tr();

  static String get offlineError => _offlineError.tr();

  static String get welcomeToChatGPT => _welcomeToChatGPT.tr();

  static String get serverError => _serverError.tr();

  static String get cacheError => _cacheError.tr();

  static String get invalidPageNumberError => _invalidPageNumberError.tr();

  static String get timeoutError => _timeoutError.tr();

  static String get noCurrentUser => _noCurrentUser.tr();

  static String get noDeviceToken => _noDeviceToken.tr();

  static String get noImagePicked => _noImagePicked.tr();

  static String get noMessage => _noMessage.tr();

  static String get logout => _logout.tr();

  static String get upload => _upload.tr();

  static String get welcome => _welcome.tr();

  static String get gellary => _gellary.tr();

  static String get camera => _camera.tr();

  static String get successLoginMsg => _successLoginMsg.tr();

  static String get successPayment => _successPayment.tr();
  static String get successSave => _successSave.tr();

  static String get languageBtnTxt => _languageBtnTxt.tr();

  static String get limitationsService3 => _limitationsService3.tr();
  static String get limitationsService3Key => _limitationsService3;

  static String get limitationsService2 => _limitationsService2.tr();
  static String get limitationsService2Key => _limitationsService2;

  static String get limitationsService1 => _limitationsService1.tr();
  static String get limitationsService1Key => _limitationsService1;

  static String get capabilitiesService3 => _capabilitiesService3.tr();
  static String get capabilitiesService3Key => _capabilitiesService3;

  static String get capabilitiesService2 => _capabilitiesService2.tr();
  static String get capabilitiesService2Key => _capabilitiesService2;

  static String get capabilitiesService1 => _capabilitiesService1.tr();
  static String get capabilitiesService1Key => _capabilitiesService1;

  static String get examplesService3 => _examplesService3.tr();
  static String get examplesService3Key => _examplesService3;

  static String get examplesService2 => _examplesService2.tr();
  static String get examplesService2Key => _examplesService2;

  static String get examplesService1 => _examplesService1.tr();
  static String get examplesService1Key => _examplesService1;

  static String get delete => _delete.tr();

  static String get updatesAndFAQ => _updatesAndFAQ.tr();

  static String get lightMode => _lightMode.tr();

  static String get updateProfile => _updateProfile.tr();

  static String get upgradeToPlus => _upgradeToPlus.tr();
  static String get plusVersion => _plusVersion.tr();

  static String get clearConversations => _clearConversations.tr();

  static String get newTxt => _newTxt.tr();

  static String get back => _back.tr();
  static String get backKey => _back;

  static String get offline => _offline.tr();

  static String get sending => _sending.tr();

  static String get successSend => _successSend.tr();

  static String get failSend => _failSend.tr();

  static String get hi => _hi.tr();

  static String get anonymousUser => _anonymousUser.tr();

  static String get showMore => _showMore.tr();

  static String get noProductsFound => _noProductsFound.tr();

  static String get filterByCategory => _filterByCategory.tr();

  static String get searchInProducts => _searchInProducts.tr();

  static String get rating => _rating.tr();

  static String get sortByName => _sortByName.tr();

  static String get zToA => _zToA.tr();

  static String get lowToHigh => _lowToHigh.tr();

  static String get highToLow => _highToLow.tr();

  static String get addProduct => _addProduct.tr();

  static String get addProductName => _addProductName.tr();

  static String get addProductPrice => _addProductPrice.tr();

  static String get addProductDescription => _addProductDescription.tr();

  static String get uploadImage => _uploadImage.tr();

  static String get saveAndPublish => _saveAndPublish.tr();

  static String get aToZ => _aToZ.tr();

  static String get sortByPrice => _sortByPrice.tr();

  static String get online => _online.tr();

  static String get noChatStartChatNow => _noChatStartChatNow.tr();

  static String get productCategoryIsRequired =>
      _productCategoryIsRequired.tr();

  static String get productImageIsRequired => _productImageIsRequired.tr();
}
