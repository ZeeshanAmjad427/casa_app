import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class ProductionOrderScreen extends StatefulWidget {
  const ProductionOrderScreen({super.key});

  @override
  _ProductionOrderScreenState createState() => _ProductionOrderScreenState();
}

class _ProductionOrderScreenState extends State<ProductionOrderScreen> {
  String? _itemCode, _itemName, _unit, _productionLine, _actualQuantity;
  int _planQuantity = 0;
  String? _selectedWarehouse = '12345';

  final List<Map<String, String>> _handlingUnits = [
    {'level': 'Level 01', 'size': 'Size 1 x 1"'},
    {'level': 'Level 02', 'size': 'Size 1 x 1"'},
    {'level': 'Level 03', 'size': 'Size 1 x 1"'},
    {'level': 'Level 04', 'size': 'Size 1 x 1"'},
    {'level': 'Level 05', 'size': 'Size 1 x 1"'},
  ];

  final List<Map<String, String>> _warehouses = [
    {'number': '12345', 'name': 'Warehouse 01'},
    {'number': '56547', 'name': 'Warehouse 02'},
    {'number': '65765', 'name': 'Warehouse 03'},
    {'number': '43222', 'name': 'Warehouse 04'},
    {'number': '43223', 'name': 'Warehouse 05'},
    {'number': '43224', 'name': 'Warehouse 06'},
    {'number': '43225', 'name': 'Warehouse 07'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = screenWidth > screenHeight;
    final isLargeTablet = screenWidth > 1024;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(80),
      //   child: ClipRRect(
      //     borderRadius: const BorderRadius.only(
      //       bottomLeft: Radius.circular(24),
      //       bottomRight: Radius.circular(24),
      //     ),
      //     child: AppBar(
      //       backgroundColor: const Color(0xFF2F80ED),
      //       toolbarHeight: 80,
      //       leading: Padding(
      //         padding: const EdgeInsets.all(12.0),
      //         child: IconButton(
      //           icon: const Icon(Icons.dashboard_outlined,
      //               color: Colors.white, size: 32),
      //           onPressed: () {},
      //         ),
      //       ),
      //       title: const Text(
      //         'Logo',
      //         style: TextStyle(
      //           fontSize: 24,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white,
      //         ),
      //       ),
      //       centerTitle: true,
      //       actions: [
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //           child: IconButton(
      //             icon: const Icon(Icons.notifications_outlined,
      //                 color: Colors.white, size: 28),
      //             onPressed: () {},
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(right: 20.0),
      //           child: CircleAvatar(
      //             backgroundColor: Colors.white,
      //             radius: 20,
      //             child: ClipOval(
      //               child: Image.network(
      //                 'https://via.placeholder.com/40',
      //                 fit: BoxFit.cover,
      //                 errorBuilder: (context, error, stackTrace) {
      //                   return Container(
      //                     color: Colors.grey[300],
      //                     child: const Icon(Icons.person, color: Colors.grey),
      //                   );
      //                 },
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isLargeTablet ? 32.0 : 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section - Responsive layout
            Container(
              margin: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                children: [
                  // Container(
                  //   height: 44,
                  //   width: 44,
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue.shade50,
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: IconButton(
                  //     icon: const Icon(Icons.arrow_back_ios,
                  //         color: Colors.black, size: 20),
                  //     onPressed: () {},
                  //     padding: const EdgeInsets.only(left: 4),
                  //   ),
                  // ),
                  const SizedBox(width: 16),
                  Expanded( // Prevent overflow
                    child: Text(
                      "Production Order",
                      style: TextStyle(
                        fontSize: isLandscape ? 28 : 24, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            // Document Info - Responsive layout
            Container(
              margin: const EdgeInsets.only(bottom: 28.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: isLandscape
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoItem("Document No:", "#12345", const Color(0xFF007BFF)),
                  _buildInfoItem("Date:", "5/30/2025", const Color(0xFF007BFF)),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoItem("Document No:", "#12345", const Color(0xFF007BFF)),
                  const SizedBox(height: 12),
                  _buildInfoItem("Date:", "5/30/2025", const Color(0xFF007BFF)),
                ],
              ),
            ),

            // Main Form Card - Enhanced design
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Form Fields - Responsive layout
                    _buildFormFields(isLandscape, isLargeTablet),

                    const SizedBox(height: 32),

                    // Divider
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.shade200,
                            Colors.grey.shade300,
                            Colors.grey.shade200,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Warehouse Section - Responsive header
                    _buildWarehouseHeader(isLandscape),

                    const SizedBox(height: 24),

                    // Warehouse Grid - Responsive columns
                    _buildWarehouseGrid(isLandscape),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Handling Unit Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Handling Unit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Handling Units Grid - Responsive columns
                    _buildHandlingUnitsGrid(isLandscape, isLargeTablet),

                    const SizedBox(height: 32),

                    // Action Buttons - Responsive layout
                    _buildActionButtons(isLandscape),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFields(bool isLandscape, bool isLargeTablet) {
    if (isLandscape) {
      // Landscape: 3 fields per row
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildInput("Item Code", (v) => _itemCode = v)),
              SizedBox(width: isLargeTablet ? 32 : 24),
              Expanded(child: _buildInput("Item Name", (v) => _itemName = v)),
              SizedBox(width: isLargeTablet ? 32 : 24),
              Expanded(child: _buildInput("Unit of Measurement", (v) => _unit = v)),
            ],
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  "Production Line",
                  _productionLine,
                  ['Line A', 'Line B'],
                      (v) => setState(() => _productionLine = v),
                ),
              ),
              SizedBox(width: isLargeTablet ? 32 : 24),
              Expanded(child: _buildPlanQuantityField()),
              SizedBox(width: isLargeTablet ? 32 : 24),
              Expanded(child: _buildInput("Actual Quantity", (v) => _actualQuantity = v)),
            ],
          ),
        ],
      );
    } else {
      // Portrait: 2 fields per row or stacked
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildInput("Item Code", (v) => _itemCode = v)),
              const SizedBox(width: 20),
              Expanded(child: _buildInput("Item Name", (v) => _itemName = v)),
            ],
          ),
          const SizedBox(height: 24),
          _buildInput("Unit of Measurement", (v) => _unit = v),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  "Production Line",
                  _productionLine,
                  ['Line A', 'Line B'],
                      (v) => setState(() => _productionLine = v),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(child: _buildPlanQuantityField()),
            ],
          ),
          const SizedBox(height: 24),
          _buildInput("Actual Quantity", (v) => _actualQuantity = v),
        ],
      );
    }
  }

  Widget _buildWarehouseHeader(bool isLandscape) {
    if (isLandscape) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
              "Warehouse",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.black87,
              )
          ),
          SizedBox(
            width: 240,
            height: 48,
            child: _buildSearchField(),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "Warehouse",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.black87,
              )
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 48,
            child: _buildSearchField(),
          ),
        ],
      );
    }
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search warehouses...',
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 16,
        ),
        prefixIcon: Icon(
          CupertinoIcons.search,
          size: 24,
          color: Colors.grey.shade500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 14, horizontal: 16
        ),
      ),
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _buildWarehouseGrid(bool isLandscape) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        int crossAxisCount;

        if (isLandscape) {
          // Landscape: More columns
          final minItemWidth = 140;
          crossAxisCount = (screenWidth / minItemWidth).floor();
          crossAxisCount = crossAxisCount < 3 ? 3 : crossAxisCount;
        } else {
          // Portrait: Fewer columns
          final minItemWidth = 160;
          crossAxisCount = (screenWidth / minItemWidth).floor();
          crossAxisCount = crossAxisCount < 2 ? 2 : crossAxisCount;
          crossAxisCount = crossAxisCount > 3 ? 3 : crossAxisCount;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _warehouses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 1.0,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final wh = _warehouses[index];
            final isSelected = _selectedWarehouse == wh['number'];

            return GestureDetector(
              onTap: () => setState(() => _selectedWarehouse = wh['number']),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF007BFF)
                        : Colors.grey.shade300,
                    width: isSelected ? 1.0 : 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: const Color(0xFF007BFF).withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ] : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF007BFF).withOpacity(0.1)
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.warehouse_outlined,
                        color: isSelected
                            ? const Color(0xFF007BFF)
                            : Colors.grey.shade600,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      wh['number']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isSelected
                            ? const Color(0xFF007BFF)
                            : Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      wh['name']!,
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected
                            ? const Color(0xFF007BFF)
                            : Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHandlingUnitsGrid(bool isLandscape, bool isLargeTablet) {
    int crossAxisCount;
    if (isLandscape) {
      crossAxisCount = isLargeTablet ? 3 : 3;
    } else {
      crossAxisCount = 2; // Portrait: 2 columns
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _handlingUnits.length + 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 2.0,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      itemBuilder: (_, index) {
        if (index == _handlingUnits.length) {
          return _buildAddLevelCard();
        }
        final unit = _handlingUnits[index];
        return _buildHandlingUnitCard(unit, index);
      },
    );
  }

  Widget _buildActionButtons(bool isLandscape) {
    if (isLandscape) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildCancelButton(),
          const SizedBox(width: 20),
          _buildSaveButton(),
        ],
      );
    } else {
      // Portrait: Stack buttons or make them full width
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildCancelButton()),
              const SizedBox(width: 16),
              Expanded(child: _buildSaveButton()),
            ],
          ),
        ],
      );
    }
  }

  Widget _buildCancelButton() {
    return SizedBox(
      height: 52,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFFFFEBEE),
          side: const BorderSide(
              color: Color(0xFFE53E3E),
              width: 2
          ),
          foregroundColor: const Color(0xFFE53E3E),
          padding: const EdgeInsets.symmetric(
              horizontal: 32, vertical: 12
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
        ),
        child: const Text(
          "Cancel",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF007BFF),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
              horizontal: 32, vertical: 12
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          elevation: 4,
        ),
        child: const Text(
          "Save",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Keep all the existing helper methods (_buildInfoItem, _buildInput, etc.)
  // with the same implementation as before...

  Widget _buildInfoItem(String label, String value, Color labelColor) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyle(
              color: labelColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: " $value",
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(String label, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            )
        ),
        const SizedBox(height: 12),
        TextFormField(
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF007BFF), width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'Enter your answer',
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 16, horizontal: 16
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items,
      Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            )
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: value,
          isExpanded: true,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF007BFF), width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 16, horizontal: 16
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
          hint: Text(
            'Select your answer',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
            ),
          ),
          items: items
              .map((e) => DropdownMenuItem(
              value: e,
              child: Text(e, style: const TextStyle(fontSize: 16))
          ))
              .toList(),
          onChanged: onChanged,
        )
      ],
    );
  }

  Widget _buildPlanQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            "Plan Quantity",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            )
        ),
        const SizedBox(height: 12),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.remove, color: Colors.grey, size: 20),
                  onPressed: () {
                    if (_planQuantity > 0) {
                      setState(() => _planQuantity--);
                    }
                  },
                  padding: EdgeInsets.zero,
                ),
              ),
              Text(
                '$_planQuantity',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add, color: Colors.grey, size: 20),
                  onPressed: () => setState(() => _planQuantity++),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCircularIcon(IconData icon, Color color, Color backgroundColor) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 18, color: color),
    );
  }

  Widget _buildAddLevelCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _handlingUnits.add({
            'level': 'Level ${_handlingUnits.length + 1}',
            'size': 'Size 1 x 1"',
          });
        });
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(16),
        dashPattern: const [12, 8],
        color: const Color(0xFF007BFF),
        strokeWidth: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF007BFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Add Level",
                  style: TextStyle(
                    // color: Color(0xFF007BFF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHandlingUnitCard(Map<String, String> unit, int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    unit['level']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    _buildCircularIcon(
                      CupertinoIcons.pen,
                      const Color(0xFF2B6CB0),
                      const Color(0xFFEBF8FF),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _handlingUnits.removeAt(index);
                        });
                      },
                      child: _buildCircularIcon(
                        CupertinoIcons.trash,
                        const Color(0xFFE53E3E),
                        const Color(0xFFFFEBEE),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFEBF8FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    unit['size']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF007BFF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}