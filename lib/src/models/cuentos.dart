List<CartModel> cuentosList = [
  CartModel(foto: 'assets/img/1.jpg', nombre: 'Cuento de algo', detail: ''),
  CartModel(foto: 'assets/img/2.jpg', nombre: 'Cuento de algo', detail: ''),
  CartModel(foto: 'assets/img/3.jpg', nombre: 'Cuento de algo', detail: ''),
  CartModel(foto: 'assets/img/4.jpg', nombre: 'Cuento de algo', detail: ''),
  CartModel(foto: 'assets/img/5.jpg', nombre: 'Cuento de algo', detail: ''),
  CartModel(foto: 'assets/img/6.jpg', nombre: 'Cuento de algo', detail: ''),
  CartModel(foto: 'assets/img/7.jpg', nombre: 'Cuento de algo', detail: ''),
  CartModel(foto: 'assets/img/8.jpg', nombre: 'Cuento de algo', detail: ''),
  CartModel(foto: 'assets/img/9.jpg', nombre: 'Cuento de algo', detail: ''),
];

class CartModel {
  String? foto;
  String? nombre;
  String? detail;

  CartModel({
    this.foto,
    this.nombre,
    this.detail,
  });
}
