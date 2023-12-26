import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_22_starbucks/repository/order_repository.dart';

class QuickOrderCardListWidget extends StatefulWidget {
  const QuickOrderCardListWidget({
    super.key,
  });

  @override
  State<QuickOrderCardListWidget> createState() =>
      _QuickOrderCardListWidgetState();
}

class _QuickOrderCardListWidgetState extends State<QuickOrderCardListWidget> {
  final orders = OrderRepository().getAllOrders();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: orders.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 340.0,
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              orders[index].liked =
                                  orders[index].liked == 1 ? 0 : 1;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                orders[index].liked == 1
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              child: Image.network(
                                orders[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  orders[index].menuName,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(orders[index].option),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 2.0,
                        thickness: 2.0,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.person_pin_circle_outlined,
                                ),
                                Text(
                                  orders[index].location,
                                  style: const TextStyle(
                                    color: Colors.brown,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // print('press button');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              child: const Text(
                                '바로 주문하기',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
