import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:my_app/constance.dart';
import '../../core/view_model/checkout_view_model.dart';
import '../../helper/enum.dart';
import '../widgets/custom_bottom_button.dart';
import 'widgets/add_address_widget.dart';
import 'widgets/delevery_time_widget.dart';
import 'widgets/summary_widget.dart';

class BuyStepperView extends StatefulWidget {
  const BuyStepperView({super.key});

  @override
  // ignore_for_file: library_private_types_in_public_api
  _BuyStepperView createState() => _BuyStepperView();
}

class _BuyStepperView extends State<BuyStepperView> {
  int dotCount = 3;
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 10),
          child: Column(
            children: [
              controller.header(),
              const SizedBox(
                height: 15,
              ),
              DotStepper(
                dotCount: dotCount,
                dotRadius: 15,
                activeStep: activeStep,
                shape: Shape.circle,
                spacing: 100,
                indicator: Indicator.blink,
                lineConnectorsEnabled: true,
                onDotTapped: (tappedDotIndex) {
                  controller.displayIndex(tappedDotIndex);
                  activeStep = controller.index;
                },
                fixedDotDecoration: FixedDotDecoration(
                  color: Colors.grey.shade300,
                  strokeWidth: 1,
                ),
                indicatorDecoration: const IndicatorDecoration(
                  color: primaryColor,
                ),
              ),
              Container(
                  child: controller.pages == Pages.deliveryTimeScreen
                      ? const DeliveryTime()
                      : controller.pages == Pages.addAddressScreen
                          ? const AddAddress()
                          : const Summary()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (controller.index > 1)
                      CustomBottomButton(
                        text: 'BACK',
                        fontSize: 20,
                        onPressed: () {
                          if (activeStep > 0) {
                            setState(() {
                              controller.changeIndex(
                                controller.index - 1,
                              );

                              activeStep = controller.index;
                            });
                          } else {
                            return;
                          }
                        },
                        color: Colors.white,
                        textColor: Colors.black,
                      ),
                    if (controller.index < 2) Expanded(child: Container()),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomBottomButton(
                      text: 'NEXT',
                      fontSize: 20,
                      onPressed: () {
                        if (activeStep < dotCount) {
                          setState(() {
                            controller.changeIndex(
                              controller.index + 1,
                            );
                            activeStep = controller.index;
                          });
                        } else {
                          return;
                        }
                      },
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
