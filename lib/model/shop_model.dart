// ignore_for_file: non_constant_identifier_names

class ShopModel {
  int? id;
  String? nombre;
  String? direccion;
  String? localidad;
  double? latitud;
  double? longitud;
  String? facebookURL;
  String? instagramURL;
  int? estrellas;
  int? ratingPrecios;
  bool? productosDiabeticos;
  List<String>? categorias;
  String? horario;
  String? URL;
  bool? productosVeganos;
  String? telefono;
  String? imagenURL;
  int? validado;
  double? distance;
  bool? isFavourite;

  ShopModel(
      {this.id,
      this.nombre,
      this.direccion,
      this.localidad,
      this.latitud,
      this.longitud,
      this.facebookURL,
      this.instagramURL,
      this.estrellas,
      this.ratingPrecios,
      this.productosDiabeticos,
      this.categorias,
      this.horario,
      this.URL,
      this.productosVeganos,
      this.telefono,
      this.imagenURL,
      this.validado,
      this.distance,
      this.isFavourite
      });

  ShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    direccion = json['direccion'];
    localidad = json['localidad'];
    latitud = json['latitud'];
    longitud = json['longitud'];
    facebookURL = json['facebookURL'];
    instagramURL = json['instagramURL'];
    estrellas = json['estrellas'];
    ratingPrecios = json['ratingPrecios'];
    productosDiabeticos = json['productosDiabeticos'];
    categorias = json['categorias'].cast<String>();
    horario = json['horario'];
    URL = json['URL'];
    productosVeganos = json['productosVeganos'];
    telefono = json['telefono'];
    imagenURL = json['imagenURL'];
    validado = json['validado'];
    distance = json['distance'];
    isFavourite = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['direccion'] = direccion;
    data['localidad'] = localidad;
    data['latitud'] = latitud;
    data['longitud'] = longitud;
    data['facebookURL'] = facebookURL;
    data['instagramURL'] = instagramURL;
    data['estrellas'] = estrellas;
    data['ratingPrecios'] = ratingPrecios;
    data['productosDiabeticos'] = productosDiabeticos;
    data['categorias'] = categorias;
    data['horario'] = horario;
    data['URL'] = URL;
    data['productosVeganos'] = productosVeganos;
    data['telefono'] = telefono;
    data['imagenURL'] = imagenURL;
    data['validado'] = validado;
    data['distance'] = distance;
    return data;
  }

}