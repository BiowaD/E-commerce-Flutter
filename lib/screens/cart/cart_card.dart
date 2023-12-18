import 'package:flutter/material.dart';
import '/models/Cart.dart';

import '../../constants.dart';
import '../../size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _CartCard createState() => _CartCard();
}

class _CartCard extends State<CartCard>{

  int val = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Positioned(
            top: 14,
            right: 14,
            child: Transform.scale(
              scale: 1.2,
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
        ),
        Positioned(
            right: 20,
            bottom: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        val++;
                      });
                    },
                    icon: const Icon(
                        Icons.add,
                      size: 30,
                      color: Colors.grey,
                    )
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15),vertical: getProportionateScreenHeight(3)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: val.toString(),
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: kPrimaryColor),
                    )
                  )
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if(val!=1)
                          val--;
                      });
                    },
                    icon: const Icon(
                      Icons.remove,
                      size: 30,
                      color: Colors.grey,
                    )
                ),
              ],
            )
        ),
      Row(
          children: [

            SizedBox(
              width: 88,
              //height: 125,
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
                    /*children: [
                      TextSpan(
                          text: " x${widget.cart.numOfItem}",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],*/
                  ),
                )
              ],
            )
          ],
        ),
      ]
    );
  }


}
