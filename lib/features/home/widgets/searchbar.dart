import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/features/home/widgets/pet_shop.dart';

import '../care screen/dentalscreen.dart';
import '../care screen/illnessandinjuries.dart';
import '../care screen/litter training.dart';
import '../care screen/pet sitting.dart';
import '../care screen/pet walking.dart';
import '../care screen/routinecheckup.dart';
import '../care screen/vaccinescreen.dart';
import '../grooming screen/bathing_and_brushing.dart';
import '../grooming screen/deshedding_and_haircutting.dart';
import '../grooming screen/styling_and_touches.dart';



// Search Bar Widget with Embedded IconButton
class ServiceSearchBar extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  ServiceSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search for services',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              final searchText = controller.text.toLowerCase().trim();
              final targetScreen = keywordToScreen[searchText];
              if (targetScreen != null) {
                // Navigate to the target screen
                Get.to(() => targetScreen);
              } else {
                // Show an error message if the service is not found
                Get.snackbar(
                  "Service Not Found",
                  "No service matches your search query.",
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

// Keyword-to-Screen Mapping
final Map<String, Widget> keywordToScreen = {
  // Pet Shop
  "pet food": const PetShop(),
  "food": const PetShop(),
  "products": const PetShop(),
  "pet shop": const PetShop(),

  // Grooming Services
  "bathing": const BathingAndBrushing(),
  "brushing": const BathingAndBrushing(),
  "deshedding": const DesheddingAndCutting(),
  "haircutting": const DesheddingAndCutting(),
  "styling": const StylingAndTouches(),
  "finishing touches": const StylingAndTouches(),

  // Care Services
  "vaccination": const VaccinationScreen(),
  "dental care": const DentalCare(),
  "routine checkup": const RoutineCheckup(),
  "illness and injuries": const IllnessAndInjuries(),
  "treatment of illness": const IllnessAndInjuries(),
  "pet sitting": const PetSitting(),
  "pet walking": const PetWalking(),
  "litter training": const LitterTraining(),
  "training": const LitterTraining(),

  // Miscellaneous Keywords
  "checkup": const RoutineCheckup(),
  "illness": const IllnessAndInjuries(),
  "injuries": const IllnessAndInjuries(),
  "walking": const PetWalking(),
  "sitting": const PetSitting(),
  "care": const RoutineCheckup(),
};

