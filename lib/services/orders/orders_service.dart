import 'dto/order.dart';

class OrdersService {
  final List<Order> _orders = [
    Order('ТГ-бот', '50\$', '1 Просмотр', '22.11.2024', ['Java', 'SQL', 'Spring']),
    //Order('Веб-сайт', '3000\$', '232 Просмотра', '15.12.2024', ['HTML', 'CSS']),
    Order('Блокчейн система', '2500\$', '1 Просмотр', '29.05.2024', ['gRPC', 'Go', 'Cosmos'])
  ];

  List<Order> getOrders() {
    return _orders;
  }

  void addOrder(Order order) {
    _orders.add(order);
  }
}