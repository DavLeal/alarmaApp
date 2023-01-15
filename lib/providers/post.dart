class Post {
  late int _userID;
  late double _latitud, _longitud;
  Post(this._userID, this._latitud, this._longitud);

  //Getters
  get getUserID => this._userID;
  get getLatitud => this._latitud;
  get getLongitud => this._longitud;

  //Setters
  set setUserID(int value) => this._userID = value;
  set setLatitud(double value) => this._latitud = value;
  set setLongitud(double value) => this._longitud = value;

  //Get Data
  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(int.parse(json['userID'].toString()), json['latitud'],
        json['longitud']);
  }
  //Send Data
  Map<String, dynamic> toJSON() {
    return {
      'userID': this._userID,
      'latitud': this._latitud,
      'longitud': this._longitud
    };
  }
}
