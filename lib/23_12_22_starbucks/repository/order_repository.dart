import '../model/order.dart';

class OrderRepository {
  List<StarbucksOrder> orders = [
    StarbucksOrder(
      orderId: 101,
      menuName: '카페 아메리카노',
      option: 'HOT \u2502 Tall',
      kind: 'coffee',
      startOrderDate: DateTime(2023, 1, 1),
      endOrderDate: DateTime(2023, 1, 1),
      imageUrl:
          'https://i.namu.wiki/i/0eYzXtIj8UG29RMWIqr9FvE7wwMHrJv9lXMcGA1P21ne5T3IbmP-kO-wFP3tAENq2IJ51upw0liZnBg287Tx2ARyJVK7aOeFzfUDXGM-8N5kxB7MT94wHLqp6O8r_lx3ASP7MR-yPR9OJGvAS2KSzw.webp',
      location: '가재울뉴타운',
      liked: 1,
    ),
    StarbucksOrder(
      orderId: 201,
      menuName: '쇼트케이크',
      option: '',
      kind: 'coffee',
      startOrderDate: DateTime(2023, 1, 1),
      endOrderDate: DateTime(2023, 1, 1),
      imageUrl:
          'https://i.namu.wiki/i/OQp2aO47mV95ZqHPaza9YNOIQrgWX24xtkXw8DvAoBwZlTBEFxOonkfXSFMNrAfYrH5EaA8NKO2f19Hq5sGPokjvN-BxvdstlbWmRfjJz1EWFHRMUwoshn0lXziCjrc2gZWX6s398B1psOMDs9zNdw.webp',
      location: '신사역',
      liked: 0,
    ),
    StarbucksOrder(
      orderId: 202,
      menuName: '초콜릿 케이크',
      option: '',
      kind: 'coffee',
      startOrderDate: DateTime(2023, 1, 1),
      endOrderDate: DateTime(2023, 1, 1),
      imageUrl:
          'https://i.namu.wiki/i/8V_f39CpcYx82arEyVA7ZnT9HMUmghwfT2RIX9HlwlzfxAn7EpshlykIZ7gepEje63MOCvNBAaFx3rAUORDtBRy5sVdgp6DNuRBfL8DcG0LHe2Exo64iYR6oaUHzO63nLTNWPGF9F66TI4Zbwha2WQ.webp',
      location: '가로수길',
      liked: 1,
    ),
  ];

  List<StarbucksOrder> getAllOrders() => orders;
}
