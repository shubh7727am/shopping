import 'package:THATGIRL/View/widget/available_colors.dart';
import 'package:THATGIRL/View/widget/carousel.dart';
import 'package:THATGIRL/View/widget/customer_rating.dart';
import 'package:THATGIRL/View/widget/info.dart';
import 'package:THATGIRL/View/widget/size_choice.dart';
import 'package:THATGIRL/repo/static_data.dart';
import 'package:THATGIRL/utils/dimensions.dart';
import 'package:THATGIRL/utils/local_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final safePad = Dimensions.safePadding;
  final safeGaps = const SizedBox(height: 8);
  String originalPrice = StaticDataRepo.productDetails['price'].toString();
  String finalPrice = (double.parse(StaticDataRepo.productDetails['price'].toString()) *
      (1 - double.parse(StaticDataRepo.productDetails['discount'].toString()) / 100))
      .toString();


  String selectedSize = "M";// track of the selected size


  int currentIndex = 0; // To keep track of the current image index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Align(
            alignment: Alignment.center,
            child: Text(
              LocalStrings.appName,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink,fontFamily: "heading"),
            )),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined))
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: CarouselWithIndicators(imageUrls: StaticDataRepo.imageUrls),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: safePad,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  StaticDataRepo.productDetails['name'].toString(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                safeGaps,
                Row(
                  children: [
                    Text(
                      finalPrice,
                      style:const  TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      originalPrice,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.pink,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '- ${StaticDataRepo.productDetails["discount"]}%',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                safeGaps,
                const Text(
                  LocalStrings.taxes,
                  style: TextStyle(color: Colors.grey),
                ),
                safeGaps,
               Text(
                  StaticDataRepo.productDetails['shortDes'].toString(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: Colors.grey.shade700),
                ),
                const Divider(),
                safeGaps,
                const Text(
                  'COLOR:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                AvailableColorsWidget(colors: StaticDataRepo.productDetails["colors"]),
                safeGaps,
                Row(
                  children: [Text(
                    'SIZE: $selectedSize',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                    const Text("Size Guide",style: TextStyle(decoration: TextDecoration.underline,color: Colors.pink,decorationColor: Colors.pink),),

                  ]
                ),
                const SizedBox(height: 8),
                SizeChoice(
                  sizes: const ['XS', 'S', 'M', 'L', 'XL'],
                  onSizeSelected: (selected) {
                    // Handle the selected size

                  },
                ),

               safeGaps,
                const Divider(),
              safeGaps,
                const Text(
                  LocalStrings.deliver,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Pincode',
                          border: OutlineInputBorder(),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Text('CHECK',style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
                safeGaps,
                Row(
                  children: [
                    const Icon(Icons.local_shipping, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        StaticDataRepo.deliveryConfig['freeDes'].toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        InfoExpansionTile(aboutText: StaticDataRepo.productDetails["about"], washCareText: StaticDataRepo.productDetails["washCare"], serviceText: StaticDataRepo.productDetails["service"]),
        // Ratings & Reviews Section
        SliverToBoxAdapter(
          child: Padding(
            padding: safePad,
            child: const Column(
              children: [
                Divider(),
                Row(
                  children: [
                    Text(
                      LocalStrings.ratings,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                        LocalStrings.review,
                      style: TextStyle(decoration: TextDecoration.underline,color: Colors.pink,decorationColor: Colors.pink)
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '4.0/5',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                CustomRatingBar(
                  rating: 4.5,
                  itemCount: 5,
                  itemSize: 30.0,
                ),


                Text(
                  'Based on 237 Star Ratings',
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(),
                ]),),),

        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items in each row
            crossAxisSpacing: 5, // Horizontal space between grid items
            mainAxisSpacing: 5, // Vertical space between grid items
          ),
          delegate: SliverChildListDelegate(
            [
              const RatingWidget(
                title: 'Sizing',
                subtitle: 'True to Size',
                value: '<-->',
              ),
              const RatingWidget(
                title: 'Quality',
                subtitle: 'Out of 5',
                value: '4.5',
                scaleDown: true,
              ),
              const RatingWidget(
                title: 'Fit',
                subtitle: 'Out of 5',
                value: '4.1',
                scaleDown: true,
              ),
              const RatingWidget(
                title: 'Would Recommend',
                subtitle: 'Total 160 Recommendations',
                value: '87%',
              ),
            ],
          ),
        ),

                SliverToBoxAdapter(child: Padding(padding:safePad,child: Column(children: [


                const Divider(),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child:  Text(
                    'Review Photos(${StaticDataRepo.reviewImages.length})',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 500,
                  height: 150,
                  child: ListView.builder(

                      scrollDirection: Axis.horizontal,
                      itemCount: StaticDataRepo.reviewImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SizedBox(
                              width: 150,
                              child: Image.network(
                                  fit: BoxFit.cover, StaticDataRepo.reviewImages[index]),
                            ));
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Customer Reviews(800)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == StaticDataRepo.reviews.length) {
                    return Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.pink),
                      child: Center(
                          child: Text(
                            "SEE ALL REVIEWS",
                            style: TextStyle(color: Colors.white),
                          )),
                    );
                  }
                  else{
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RatingBarIndicator(
                              rating: StaticDataRepo.reviews[index]['rating'].toDouble(),
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.pink,
                              ),
                              itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              StaticDataRepo.reviews[index]["title"],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              StaticDataRepo.reviews[index]["review"],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          if (StaticDataRepo.reviews[index]["images"] != null)
                            SizedBox(
                              width: 500,
                              height: 150,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                  StaticDataRepo.reviews[index]['images'].length,
                                  itemBuilder: (context, index2) {
                                    return Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: SizedBox(
                                          width: 150,
                                          child: Image.network(
                                              fit: BoxFit.cover,
                                              StaticDataRepo.reviews[index]["images"]
                                              [index2]),
                                        ));
                                  }),
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              StaticDataRepo.reviews[index]["name"],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Row(children: [
                            Text(
                              StaticDataRepo.reviews[index]["date"],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Text("Helpful?"),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.thumb_up_outlined,
                                  color: Colors.pink,
                                )),
                            Text("2"),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert)),
                          ]),
                        ],
                      ),
                    );

                  }
            },
            childCount: StaticDataRepo.reviews.length + 1,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(children: [

              Divider(),
              SizedBox(height: 20,),
              const Text(
                'You Might Also Like',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: "heading"),
              ),
              Divider(color: Colors.pink,),
              SizedBox(height: 20,),
            ],)
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items in each row
            childAspectRatio: 2 / 3, // Adjust the aspect ratio as needed
            mainAxisSpacing: 8, // Vertical space between grid items
            crossAxisSpacing: 8, // Horizontal space between grid items
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              final item = StaticDataRepo.moreItems[index];
              return Card(
                color: Colors.white,
                elevation: 1, // Elevation of the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                        child: Image.network(
                          item["image"]!, // Fetch the image from the item
                          fit: BoxFit.cover, // Make sure the image covers the space
                          width: double.infinity, // Make the image fill the width of the card
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Padding around text
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["price"]!, // Display the price
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Make the price bold
                              fontSize: 16, // You can adjust the font size if needed
                            ),
                          ),
                          SizedBox(height: 4), // Space between price and name
                          Text(
                            item["name"]!, // Display the name
                            style: TextStyle(
                              fontSize: 14, // Adjust the font size if needed
                              color: Colors.black87, // Color of the item name text
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: StaticDataRepo.moreItems.length, // The number of items in the list
          ),
        ),

      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.black,
                onPressed: () {


                },
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  width: 120,
                  color: Colors.black,
                  child: Center(child: Text("ADD TO BAG",style: TextStyle(color: Colors.white),)),
                ),
              ),

              GestureDetector(
                onTap: (){},
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2,          // Border width
                    ),
                  ),

                  child: Center(child: Text("BUY NOW",)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to update index when a dot is tapped

}

class RatingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final bool scaleDown ;

  const RatingWidget({
    super.key,
    this.scaleDown = false,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                value: double.tryParse(value.replaceAll('%', '')) != null
                    ? scaleDown ? double.parse(value.replaceAll('%', '')) / 10 : double.parse(value.replaceAll('%', '')) / 100
                    : 1.0,
                color: Colors.pink,
                backgroundColor: Colors.grey[300],
                strokeWidth: 4,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }


}
