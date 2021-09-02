import 'package:flutter/material.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/filterOptions.dart';
import 'package:medical_app/Patients/Widgets/docFiltersPage/specialistHeader.dart';

class DocFilters extends StatefulWidget {
  static const String routes = 'filterPage';

  @override
  _DocFiltersState createState() => _DocFiltersState();
}

class _DocFiltersState extends State<DocFilters> {
  bool advSettings = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: [
              DiscountContainer(),
              Positioned(
                top: size.height * 0.039,
                child: FilterOptions2(
                  size: size,
                  advSettings: advSettings,
                  press: () {
                    setState(() {
                      advSettings = !advSettings;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
