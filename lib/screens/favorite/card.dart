import 'package:flutter/material.dart';
import '/models/Cart.dart';

import '../../constants.dart';
import '../../size_config.dart';

class Cardt extends StatefulWidget {
  const Cardt({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<Cardt> createState() => _CardtState();
}

class _CardtState extends State<Cardt> {
  int number=1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 88,
                  child: AspectRatio(
                    aspectRatio: 0.88,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(widget.cart.product.images[0]),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cart.product.title,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: "\$${widget.cart.product.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                        children: [
                          TextSpan(
                              text: " x${widget.cart.numOfItem}",
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 50,top: 11),
              child: Column(
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      number+=1;
                    });
                  }, icon:const Icon(Icons.add)),
                  Text('$number'),
                  IconButton(onPressed: (){
                    setState(() {
                      if(number!=1) {
                        number-=1;
                      }
                    });
                  }, icon: const Icon(Icons.remove))
                ],
              ),
            )
          ]
        ),
        Positioned(
          top: -5,
          right: 5,
          child: Checkbox(
            value: widget.cart.product.isFavourite,
            activeColor: kPrimaryColor,
            onChanged: (value) {
              setState(() {
                widget.cart.product.isFavourite = value!;
              });
            },
          ),
        )
      ]
    );
  }
}
