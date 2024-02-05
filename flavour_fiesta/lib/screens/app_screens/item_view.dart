import 'package:flavour_fiesta/components/add_on.dart';
import 'package:flavour_fiesta/components/add_to_cart_button.dart';
import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
  final String name;
  final String imagePath;
  final double price;

  const ItemView({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
  });

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  // function to increase or decrease the count of items to buy
  int _countNumber = 1;

  void _increment() {
    setState(() {
      _countNumber++;
    });
  }

  void _decrement() {
    setState(() {
      if (_countNumber > 1) {
        _countNumber--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromRGBO(254, 55, 61, 0.9),
      body: SingleChildScrollView(
          child: Column(
        children: [
          // Image
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(3.0),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 20.0,
                ),
                child: Column(
                  children: [
                    //  rating button and price
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 18.0,
                        right: 28.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // container for ratings
                          SizedBox(
                            height: 40.0,
                            width: 80.0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(243, 231, 64, 0.898),
                                    size: 20.0,
                                  ),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //  price text
                          Text(
                            'Rwf ${widget.price * _countNumber}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(251, 198, 9, 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                    // description of the item with a counter to add or reduce count
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 18.0,
                        right: 2.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // name of the item
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          //  Increment and decrement buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                onPressed: _decrement,
                                // style: ButtonStyle(),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    const CircleBorder(
                                        side: BorderSide(
                                      color: Colors.red,
                                    )),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.red,
                                  size: 30.0,
                                ),
                              ),
                              Text(
                                '$_countNumber',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              OutlinedButton(
                                onPressed: _increment,
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    const CircleBorder(
                                        side: BorderSide(
                                      color: Colors.red,
                                    )),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.red,
                                  size: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //  add the description
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 30.0),
                      child: Text(
                        'Id dolore laborum dolore quis proident nostrud commodo. Id dolore laborum dolore quis',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    // add the items to add to cart
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 18.0,
                        right: 2.0,
                        top: 18.0,
                        bottom: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // name of the item
                          Text(
                            "Add Ons",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(
                        left: 18.0,
                        right: 2.0,
                        top: 18.0,
                        bottom: 10.0,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // create a list of all the add ons
                            AddOn(),
                            AddOn(),
                            AddOn(),
                          ],
                        ),
                      ),
                    ),

                    //  add the button to add to cart
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 60.0,
                        right: 40.0,
                        top: 18.0,
                        bottom: 10.0,
                      ),
                      child: AddToCart(),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),),
      // should show everything
    );
  }
}
