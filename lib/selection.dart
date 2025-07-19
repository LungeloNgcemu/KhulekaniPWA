import 'package:flutter/material.dart';
import 'package:khulekani_app/components/subtitle.dart';
import 'components/subtitle.dart';
import 'package:khulekani_app/data_base.dart';

class Selection extends StatefulWidget {
  Selection(
      {this.onTap1,
      this.onTap2,
      this.onTap3,
      this.onTap4,
      this.onTap5,
      this.onTap6,
      this.onTap7,
      this.onTap8,
      this.onTap9,
      this.onTap10,
      this.onTap11,
      this.onTap12,
      this.color1,
      this.color2,
      this.color3,
      this.color4,
      this.color5,
      this.color6,
      this.color7,
      this.color8,
      this.color9,
      this.color10,
      this.color11,
      this.color12,
      key});

  VoidCallback? onTap1;
  VoidCallback? onTap2;
  VoidCallback? onTap3;
  VoidCallback? onTap4;
  VoidCallback? onTap5;
  VoidCallback? onTap6;
  VoidCallback? onTap7;
  VoidCallback? onTap8;
  VoidCallback? onTap9;
  VoidCallback? onTap10;
  VoidCallback? onTap11;
  VoidCallback? onTap12;

  Color? color1;
  Color? color2;
  Color? color3;
  Color? color4;
  Color? color5;
  Color? color6;
  Color? color7;
  Color? color8;
  Color? color9;
  Color? color10;
  Color? color11;
  Color? color12;

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  void createImageTable() async {
    final conn = await connectToDatabase();
    try {
      await conn.execute('CREATE TABLE IF NOT EXISTS "Pictures" ('
          ' "Id" SERIAL PRIMARY KEY,'
          ' "Information Id" INTEGER,'
          ' image1 VARCHAR(500),'
          ' image2 VARCHAR(500),'
          ' image3 VARCHAR(500),'
          ' image4 VARCHAR(500),'
          ' image5 VARCHAR(500),'
          ' image6 VARCHAR(500),'
          ' image7 VARCHAR(500),'
          ' image8 VARCHAR(500),'
          ' image9 VARCHAR(500),'
          ' image10 VARCHAR(500),'
          ' FOREIGN KEY ("Information Id") REFERENCES "Information"("Information Id")'
          ')');
      conn.close();
      print("created pictures table");
    } catch (error) {
      print(error);
    }
  }

  void createChildrenTable() async {
    final conn = await connectToDatabase();
    try {
      await conn.execute('CREATE TABLE IF NOT EXISTS "Children" ('
          ' "Id" SERIAL PRIMARY KEY,'
          ' "Information Id" INTEGER,'
          ' "Name" VARCHAR(45),'
          ' "Birthdate" VARCHAR(45),'
          ' "Gender" VARCHAR(45),'
          ' "Age" VARCHAR(45),'
          ' "School" VARCHAR(45),'
          ' "Grade" VARCHAR(45),'
          ' "Shoe Size" VARCHAR(45),'
          ' "Uniform Size" VARCHAR(45),'
          ' "Additional Information" VARCHAR(45),'
          ' FOREIGN KEY ("Information Id") REFERENCES "Information"("Information Id")'
          ')');
      conn.close();
      print("created children table");
    } catch (error) {
      print(error);
    }
  }

  void createFull() async {
    final conn = await connectToDatabase();

    try {
      await conn.execute('CREATE TABLE IF NOT EXISTS "Information" ('
          '  "Information Id" SERIAL PRIMARY KEY, ' // Added quotes around info_id
          '  "District Municipality" VARCHAR(255), ' // Added quotes around District Municipality
          '  "Local Municipality" VARCHAR(255), ' // Added quotes around Local Municipality
          '  "Ward" VARCHAR(255), ' // Added quotes around Ward
          '  "Name of Area/Location (House No./Isigodi)" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Specify street address where possible/applicable" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Ward Councillor" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Ward Councillor Number" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Date of Incident" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Date Reported" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Date Responded" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Time of Incident" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Time Reported" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Time Responded" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Longitude (E)" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Latitude (S)" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Early warning received (Yes/No)" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Type of Incident" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Other Incident" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Cause of Incident" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Other Cause" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Name of Family" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Head of Household" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Identity Number" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Contact Number" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Alternitive Number" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Number of household member(s)" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Senior Citizen (Pensioners)" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Woman" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Men" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Children (under 18 years)" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "People with Disability" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Any Injured" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "No. of injuries" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Emergency Assistance Required" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Evacuated To" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Mode of Transport" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Any Fatalities" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "No. of Fatalities" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Fatalities Confirmed" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Any Scholars Effeccted" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Textbook Damage" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Any Lost Document" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Lost Document Amount" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Items Lost" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "No. of structures in a household" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "No. of partially damaged structures" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Any Homeless" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "No. of Homeless" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Temporal Accomidation" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Other Damages" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "No. of Mud house/structure" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "No. of shack/ informal settlement structure" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "No. of totally destroyed structures" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Number of RDP" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Roof Damages" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "structuralDamages" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Essential Services Damaged" VARCHAR(255)[], ' // Remove [] after VARCHAR(255)
          '  "Assistance Issued" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Temporal Shelter" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Soup Kitchen" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Food Parcels" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Tents" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Blankets" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Sponges" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Plastic Sheeting" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Stove" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Pots" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Other" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Type of Intervention" VARCHAR(256)[], ' // Remove [] after VARCHAR(256)
          '  "Infrastructure" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Livestock" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Croplosses" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Soil Degradation" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Job Opportunities" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Veld" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Mattresses" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Repair" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Other Intervention" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "Notes" VARCHAR(255), ' // Surround column name with quotes due to spaces
          '  "No. of formal house/structure" VARCHAR(255) '
          ')');
      print("successful");
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isSmallScreen = screenWidth < 900;

    return Padding(
      padding: const EdgeInsets.all(23.0),
      child: isSmallScreen
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 1.0),
                  //   child: Divider(
                  //     color: Colors.black26,
                  //   ),
                  // ),
                  // SubTitle2(
                  //   title: 'Sections',
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 1.0),
                  //   child: Divider(
                  //     color: Colors.black26,
                  //   ),
                  // ),
                  // Divider(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ButtonSelection(
                          inSide: "1. SPATIAL LOCATION",
                          onTap: widget.onTap1,
                          color: widget.color1!,
                        ),
                        ButtonSelection(
                          inSide: "2. INCIDENT DETAILS",
                          onTap: widget.onTap2,
                          color: widget.color2!,
                        ),
                        ButtonSelection(
                          inSide: "3. HOUSEHOLD EFFECTED",
                          onTap: widget.onTap3,
                          color: widget.color3!,
                        ),
                        ButtonSelection(
                          inSide:
                              "4. WELLBEING IMPACT ON THE HOUSEHOLD MEMBERS",
                          onTap: widget.onTap4,
                          color: widget.color4!,
                        ),
                        ButtonSelection(
                          inSide: "5. CONDITION OF THE INFRASTRUCTURE",
                          onTap: widget.onTap5,
                          color: widget.color5!,
                        ),
                        ButtonSelection(
                          inSide: "6. SOCIAL RELIEF SUPPORT",
                          onTap: widget.onTap6,
                          color: widget.color6!,
                        ),
                        ButtonSelection(
                          inSide: "7. AGRICULTURAL DAMAGE – PRELIMINARY SURVEY",
                          onTap: widget.onTap7,
                          color: widget.color7!,
                        ),
                        ButtonSelection(
                          inSide: "8. Pictures Selection",
                          onTap: widget.onTap8,
                          color: widget.color8,
                        ),
                        ButtonSelection(
                          inSide: "9. Special Notes       ",
                          onTap: widget.onTap9,
                          color: widget.color9,
                        ),
                        ButtonSelection(
                          inSide: "10. Submit               ",
                          onTap: widget.onTap10,
                          color: widget.color10,
                        ),
                        ButtonSelection2(
                          inSide: "View Map",
                          size: 24.0,
                          color: widget.color11,
                          onTap: widget.onTap11,
                        ),
                        ButtonSelection2(
                          inSide: "View Beneficiary               ",
                          onTap: widget.onTap12,
                          color: widget.color12,
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: ElevatedButton(
                  //           onPressed: () {
                  //             createFull();
                  //           },
                  //           child: Text("CREATE MAIN DATABASE"),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: ElevatedButton(
                  //           onPressed: () {
                  //             createChildrenTable();
                  //           },
                  //           child: Text("CREAT CHILD DATABASE"),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: ElevatedButton(
                  //           onPressed: () {
                  //             createImageTable();
                  //           },
                  //           child: Text("CREAT IMAGE DATABASE"),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 1.0),
                      child: Divider(
                        color: Colors.black26,
                      ),
                    ),
                    SubTitle2(
                      title: 'Sections',
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 1.0),
                      child: Divider(
                        color: Colors.black26,
                      ),
                    ),
                    // Divider(),
                    ButtonSelection(
                      inSide: "1. SPATIAL LOCATION",
                      onTap: widget.onTap1,
                      color: widget.color1!,
                    ),
                    ButtonSelection(
                      inSide: "2. INCIDENT DETAILS",
                      onTap: widget.onTap2,
                      color: widget.color2!,
                    ),
                    ButtonSelection(
                      inSide: "3. HOUSEHOLD EFFECTED",
                      onTap: widget.onTap3,
                      color: widget.color3!,
                    ),
                    ButtonSelection(
                      inSide: "4. WELLBEING IMPACT ON THE HOUSEHOLD MEMBERS",
                      onTap: widget.onTap4,
                      color: widget.color4!,
                    ),
                    ButtonSelection(
                      inSide: "5. CONDITION OF THE INFRASTRUCTURE",
                      onTap: widget.onTap5,
                      color: widget.color5!,
                    ),
                    ButtonSelection(
                      inSide: "6. SOCIAL RELIEF SUPPORT",
                      onTap: widget.onTap6,
                      color: widget.color6!,
                    ),
                    ButtonSelection(
                      inSide: "7. AGRICULTURAL DAMAGE – PRELIMINARY SURVEY",
                      onTap: widget.onTap7,
                      color: widget.color7!,
                    ),
                    ButtonSelection(
                      inSide: "8. Pictures Selection",
                      onTap: widget.onTap8,
                      color: widget.color8,
                    ),
                    ButtonSelection(
                      inSide: "9. Special Notes       ",
                      onTap: widget.onTap9,
                      color: widget.color9,
                    ),
                    ButtonSelection(
                      inSide: "10. Submit               ",
                      onTap: widget.onTap10,
                      color: widget.color10,
                    ),
                    ButtonSelection2(
                      inSide: "View Map",
                      size: 24.0,
                      color: widget.color11,
                      onTap: widget.onTap11,
                    ),
                    ButtonSelection2(
                      inSide: "View Beneficiary               ",
                      onTap: widget.onTap12,
                      color: widget.color12,
                    ),
                    Divider(),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: ElevatedButton(
                    //           onPressed: () {
                    //             createFull();
                    //           },
                    //           child: Text("CREATE MAIN DATABASE"),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: ElevatedButton(
                    //           onPressed: () {
                    //             createChildrenTable();
                    //           },
                    //           child: Text("CREAT CHILD DATABASE"),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: ElevatedButton(
                    //           onPressed: () {
                    //             createImageTable();
                    //           },
                    //           child: Text("CREAT IMAGE DATABASE"),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
    );
  }
}

class ButtonSelection extends StatelessWidget {
  ButtonSelection({
    this.color,
    this.onTap,
    this.inSide,
    this.size,
    super.key,
  });

  VoidCallback? onTap;
  String? inSide;
  Color? color;
  double? size;

  String extractLeadingNumber(String input) {
    final match = RegExp(r'^(\d+)\.').firstMatch(input);
    return match != null ? match.group(1)! : '';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 900;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          alignment: isSmallScreen ? Alignment.center : Alignment.centerLeft,
          margin: EdgeInsets.only(left: 8.0),
          decoration: isSmallScreen
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  color: color!,
                  //todo remember this
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  color: color!,
                  //todo remember this
                ),
          height: isSmallScreen ? 50 : 85.0,
          child: Padding(
            padding: isSmallScreen
                ? const EdgeInsets.only(
                    left: 10.0, top: 10, bottom: 10, right: 10.0)
                : const EdgeInsets.only(
                    left: 30.0, top: 10, bottom: 10, right: 15.0),
            child: Center(
              child: Align(
                alignment:
                    isSmallScreen ? Alignment.center : Alignment.centerLeft,
                child: isSmallScreen
                    ? Text(
                        extractLeadingNumber(inSide!) ?? "",
                        style: TextStyle(fontSize: size ?? 18.0),
                        textAlign: TextAlign.start,
                      )
                    : Text(
                        inSide ?? "",
                        style: TextStyle(fontSize: size ?? 18.0),
                        textAlign: TextAlign.start,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonSelection2 extends StatelessWidget {
  ButtonSelection2({
    this.color,
    this.onTap,
    this.inSide,
    this.size,
    super.key,
  });

  VoidCallback? onTap;
  String? inSide;
  Color? color;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            color: color!,
          ),
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    inSide ?? "",
                    style: TextStyle(
                        fontSize: size ?? 18.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
