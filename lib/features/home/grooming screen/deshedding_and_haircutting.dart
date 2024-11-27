import 'package:flutter/material.dart';
import 'package:pet/constants/images.dart';
import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizes.dart';
import '../care screen/booking_screen/Booking_screen.dart';

class DesheddingAndCutting extends StatefulWidget {
  const DesheddingAndCutting({super.key});

  @override
  State<DesheddingAndCutting> createState() => _DesheddingAndCuttingState();
}

class _DesheddingAndCuttingState extends State<DesheddingAndCutting> {
  String? selectedPet;
  int currentPageIndex = 0;
  int catClickCount = 0; // Counter for Cat clicks
  int dogClickCount = 0; // Counter for Dog clicks
  int rabbitClickCount = 0;
  bool isCatLoading = false;  // Track loading state for Cat
  bool isDogLoading = false;  // Track loading state for Dog
  bool isRabbitLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deshedding & Haircutting', style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity, // Use double.infinity to fit the container width
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: backgrndclrpurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Image(
                          image: AssetImage(litterTraining),
                          fit: BoxFit.cover, // Ensure the image fits the container
                        ),
                      ),
                      SizedBox(height: Sizes.m),
                      Text('Select Pet Type', style: Theme.of(context).textTheme.headlineSmall),
                      SizedBox(height: Sizes.s),
                      RichText(
                        text: const TextSpan(
                          text: 'Note: ', style: TextStyle(color: Colors.red,fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Selecting a pet type helps us provide the most relevant vaccination tips for your pet.',style: body
                            ),
                          ],
                        ),
                      ),


                      SizedBox(height: Sizes.m),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isCatLoading = true; // Show loading indicator
                              });

                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  selectedPet = 'cat';
                                  catClickCount++;
                                  isCatLoading = false; // Hide loading indicator
                                });
                              });
                            }, // End of onTap (Cat)
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ), // End of BoxDecoration (Cat)
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const CircleAvatar(
                                    maxRadius: 45.0,
                                    backgroundImage: AssetImage(cat),
                                  ), // End of CircleAvatar (Cat)
                                  if (isCatLoading)
                                    const CircularProgressIndicator(
                                      color: Colors.purple,
                                    ), // End of CircularProgressIndicator (Cat)
                                ], // End of children in Stack (Cat)
                              ), // End of Stack (Cat)
                            ), // End of Container (Cat)
                          ), // End of GestureDetector (Cat)
                          const SizedBox(width: 15), // Add spacing between pet icons
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isDogLoading = true; // Show loading indicator
                              });

                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  selectedPet = 'dog';
                                  dogClickCount++;
                                  isDogLoading = false; // Hide loading indicator
                                });
                              });
                            }, // End of onTap (Dog)
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const CircleAvatar(
                                    maxRadius: 45.0,
                                    backgroundImage: AssetImage(dog),
                                  ), // End of CircleAvatar (Dog)
                                  if (isDogLoading)
                                    const CircularProgressIndicator(
                                      color: Colors.purple,
                                    ),
                                ], // End of children in Stack (Dog)
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isRabbitLoading = true; // Show loading indicator
                              });

                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  selectedPet = 'rabbit';
                                  rabbitClickCount++;
                                  isRabbitLoading = false; // Hide loading indicator
                                });
                              });
                            }, // End of onTap (Rabbit)
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ), // End of BoxDecoration (Rabbit)
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const CircleAvatar(
                                    maxRadius: 45.0,
                                    backgroundImage: AssetImage(rabbit),
                                  ), // End of CircleAvatar (Rabbit)
                                  if (isRabbitLoading)
                                    const CircularProgressIndicator(
                                      color: Colors.purple,
                                    ), // End of CircularProgressIndicator (Rabbit)
                                ], // End of children in Stack (Rabbit)
                              ), // End of Stack (Rabbit)
                            ), // End of Container (Rabbit)
                          ), // End of GestureDetector (Rabbit)
                        ], // End of children in Row
                      ),
                      const SizedBox(height: 20),
                      if (selectedPet != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150, // Fixed height for ListView
                              child: buildPetTips(selectedPet!),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      SizedBox(height: Sizes.defaultPadding),
                      Text('Nearby Service Providers', style: Theme.of(context).textTheme.headlineMedium),
                      SizedBox(height: Sizes.defaultPadding),
                      const PetClinicCard(clinicName:'Family Pet Clinic Isb ', location: 'Islamabad', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'Aliyan Pets Hospital', location: 'Islamabad', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'The Pets Hopital Islamabad', location: 'Islamabad', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'Alpha Pet care', location: 'Islamabad', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'MS Pet Clinic', location: 'RawalPindi', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'Meow pet Clinic', location: 'RawalPindi', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'Capital Veterinary Clinic ', location: 'RawalPindi', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
  Widget buildPetTips(String petType) {
    List<String> tips = [];

    switch (petType) {
      case 'cat':
        tips = catClickCount % 3 == 0
            ? [
          "1. Use a de-shedding tool designed specifically for cats to reduce loose hair.",
          "2. Regular brushing helps prevent matting and keeps your cat's coat smooth.",
          "3. If your cat's hair is prone to matting, consider a professional trim to avoid discomfort.",
          "4. During shedding season, increase the frequency of brushing to manage loose fur.",
          "5. Avoid cutting your cat's hair at home unless you're experienced; consult a groomer for trims.",
        ]
            : catClickCount % 3 == 1
            ? [
          "1. For long-haired cats, focus on de-shedding tools that reach undercoats without damaging top fur.",
          "2. Give your cat a haircut if their fur becomes too long or tangled, but seek professional grooming advice first.",
          "3. If you notice excessive shedding, consult your vet to rule out any health issues.",
          "4. Use grooming gloves to gently remove loose fur during de-shedding.",
          "5. Regular trims can help prevent fur from becoming unmanageable, especially in hot weather.",
        ]
            : [
          "1. When de-shedding, focus on areas like the belly and behind the ears, where fur tends to mat easily.",
          "2. Use a thinning shear to remove excess hair without causing discomfort during grooming.",
          "3. For cats that dislike grooming, break the session into smaller intervals.",
          "4. Ensure that your grooming tools are appropriate for your cat's fur length and texture.",
          "5. For heavily matted fur, professional grooming might be necessary to avoid hurting your cat.",
        ];
        break;

      case 'dog':
        tips = dogClickCount % 3 == 0
            ? [
          "1. De-shedding tools with fine bristles help remove your dog's loose undercoat without irritation.",
          "2. Regular haircuts for long-haired dogs help maintain their coats and reduce shedding.",
          "3. Focus on areas where your dog tends to shed the most, like their back and sides.",
          "4. Keep your dog comfortable during haircuts by using clippers with adjustable blade lengths.",
          "5. Consider professional grooming for complex haircuts or large dogs to ensure safety and quality.",
        ]
            : dogClickCount % 3 == 1
            ? [
          "1. During shedding season, brush your dog daily to manage loose hair and avoid mats.",
          "2. Professional haircuts can help keep your dog cool in warm weather and reduce shedding.",
          "3. Use de-shedding shampoos or treatments to minimize loose fur during baths.",
          "4. Haircuts should always match the breed’s coat type; ask your groomer for advice if unsure.",
          "5. For dogs with heavy shedding, a professional de-shedding treatment might be the best option.",
        ]
            : [
          "1. Regular haircuts help maintain coat health and reduce shedding in dogs with thick or long fur.",
          "2. Always use scissors and clippers designed for dog grooming to avoid accidental cuts.",
          "3. To manage shedding, consider using a high-velocity dryer after baths to remove loose fur.",
          "4. Focus on high-shed areas like the neck, chest, and tail when using de-shedding tools.",
          "5. If your dog is shedding excessively, consult a vet to check for underlying health conditions.",
        ];
        break;

      case 'rabbit':
        tips = rabbitClickCount % 3 == 0
            ? [
          "1. Use a soft de-shedding tool to remove loose fur from your rabbit’s coat.",
          "2. Trim any overgrown fur, especially in long-haired rabbits, to avoid tangling and matting.",
          "3. During shedding season, brush your rabbit more frequently to manage loose hair.",
          "4. Keep the grooming process gentle to prevent stress; rabbits can be sensitive during de-shedding.",
          "5. For excessive fur growth, a light trim may be necessary, but always consult a vet or groomer before cutting.",
        ]
            : rabbitClickCount % 3 == 1
            ? [
          "1. Use a soft brush to gently de-shed your rabbit without pulling on their delicate skin.",
          "2. Trimming excess fur around the rear and belly can help with hygiene and prevent matting.",
          "3. During heavy shedding periods, daily brushing is recommended to avoid fur buildup.",
          "4. If your rabbit's fur is long, consider professional grooming to prevent tangles.",
          "5. Make sure your rabbit feels safe during grooming to avoid stress; calm environments work best.",
        ]
            : [
          "1. For rabbits with long fur, use blunt-nose scissors to carefully trim areas prone to matting.",
          "2. A regular de-shedding routine helps maintain your rabbit’s fur health and reduces loose fur.",
          "3. Trimming fur around sensitive areas, like the rear, can help keep your rabbit clean and comfortable.",
          "4. If your rabbit is shedding excessively, check their diet or environment for stressors.",
          "5. Always avoid over-grooming, which can cause skin irritation and stress in rabbits.",
        ];
        break;
    }

    return ListView.builder(
      itemCount: tips.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tips[index],
            style: body, // Ensure the 'body' style is defined in your TextStyle
          ),
        );
      },
    );
  }

}
class PetClinicCard extends StatelessWidget {
  final String clinicName;
  final String location;
  final String imagePath;
  final Widget targetScreen;

  const PetClinicCard({super.key, 
    required this.clinicName,
    required this.location,
    required this.imagePath,
    required this.targetScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clinicName,
                    style:heading2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16.0,
                      );
                    }),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      text: 'Location: ',
                      style: bodybold,
                      children: <TextSpan>[
                        TextSpan(
                          text: location,
                          style:body,
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    title: 'Book Now',
                    targetScreen: targetScreen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}