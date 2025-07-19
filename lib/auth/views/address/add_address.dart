// import 'package:consultation_app/auth/views/provider/address_provider.dart';
// import 'package:consultation_app/model/address_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // Import your Address model and AddressProvider
// // import 'address_model.dart';
// // import 'address_provider.dart';

// class AddAddress extends StatefulWidget {
//   final Address? address; // For editing existing address
  
//   const AddAddress({super.key, this.address});
  
//   @override
//   State<AddAddress> createState() => _AddAddressState();
// }

// class _AddAddressState extends State<AddAddress> {
//   final _formKey = GlobalKey<FormState>();
  
//   late TextEditingController _streetController;
//   late TextEditingController _cityController;
//   late TextEditingController _stateController;
//   late TextEditingController _countryController;
//   late TextEditingController _postalCodeController;
  
//   String _selectedAddressType = 'Home';
//   final List<String> _addressTypes = ['Home', 'Work', 'Hostel', 'Other'];
  
//   bool _isLoading = false;
  
//   @override
//   void initState() {
//     super.initState();
    
//     // Initialize controllers with existing data if editing
//     _streetController = TextEditingController(text: widget.address?.street ?? '');
//     _cityController = TextEditingController(text: widget.address?.city ?? '');
//     _stateController = TextEditingController(text: widget.address?.state ?? '');
//     _countryController = TextEditingController(text: widget.address?.country ?? '');
//     _postalCodeController = TextEditingController(text: widget.address?.postalCode ?? '');
    
//     if (widget.address != null) {
//       _selectedAddressType = widget.address!.addressType;
//     }
//   }
  
//   @override
//   void dispose() {
//     _streetController.dispose();
//     _cityController.dispose();
//     _stateController.dispose();
//     _countryController.dispose();
//     _postalCodeController.dispose();
//     super.dispose();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     final isEditing = widget.address != null;
    
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           isEditing ? 'Edit Address' : 'Add Address',
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Address Type Dropdown
//               const Text(
//                 'Address Type',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.grey.shade300),
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     value: _selectedAddressType,
//                     isExpanded: true,
//                     items: _addressTypes
//                         .map((type) => DropdownMenuItem(
//                               value: type,
//                               child: Text(type),
//                             ))
//                         .toList(),
//                     onChanged: (value) {
//                       if (value != null) {
//                         setState(() {
//                           _selectedAddressType = value;
//                         });
//                       }
//                     },
//                   ),
//                 ),
//               ),
              
//               const SizedBox(height: 20),
              
//               // Street Address Field
//               _buildTextField(
//                 label: 'Street Address',
//                 controller: _streetController,
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'Please enter street address';
//                   }
//                   return null;
//                 },
//               ),
              
//               const SizedBox(height: 16),
              
//               // City Field
//               _buildTextField(
//                 label: 'City',
//                 controller: _cityController,
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'Please enter city';
//                   }
//                   return null;
//                 },
//               ),
              
//               const SizedBox(height: 16),
              
//               // State and Postal Code Row
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildTextField(
//                       label: 'State',
//                       controller: _stateController,
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter state';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _buildTextField(
//                       label: 'Postal Code',
//                       controller: _postalCodeController,
//                       keyboardType: TextInputType.number,
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter postal code';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
              
//               const SizedBox(height: 16),
              
//               // Country Field
//               _buildTextField(
//                 label: 'Country',
//                 controller: _countryController,
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'Please enter country';
//                   }
//                   return null;
//                 },
//               ),
              
//               const SizedBox(height: 32),
              
//               // Save Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: _isLoading ? null : _saveAddress,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     elevation: 2,
//                   ),
//                   child: _isLoading
//                       ? const SizedBox(
//                           height: 20,
//                           width: 20,
//                           child: CircularProgressIndicator(
//                             strokeWidth: 2,
//                             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                           ),
//                         )
//                       : Text(
//                           isEditing ? 'Update Address' : 'Save Address',
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                 ),
//               ),
              
//               const SizedBox(height: 16),
              
//               // Cancel Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: OutlinedButton(
//                   onPressed: _isLoading ? null : () => Navigator.pop(context),
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(color: Colors.grey.shade400),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text(
//                     'Cancel',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
  
//   Widget _buildTextField({
//     required String label,
//     required TextEditingController controller,
//     required String? Function(String?) validator,
//     TextInputType? keyboardType,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 8),
//         TextFormField(
//           controller: controller,
//           validator: validator,
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: Colors.blue, width: 2),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: Colors.red),
//             ),
//             contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//           ),
//         ),
//       ],
//     );
//   }
  
//   Future<void> _saveAddress() async {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }
    
//     setState(() {
//       _isLoading = true;
//     });
    
//     try {
//       final addressProvider = Provider.of<AddressProvider>(context, listen: false);
      
//       final address = Address(
//         id: widget.address?.id, // Keep existing id if editing
//         street: _streetController.text.trim(),
//         city: _cityController.text.trim(),
//         state: _stateController.text.trim(),
//         country: _countryController.text.trim(),
//         postalCode: _postalCodeController.text.trim(),
//         addressType: _selectedAddressType,
//       );
      
//       if (widget.address != null) {
//         // Update existing address
//         await addressProvider.updateAddress(widget.address!.id!, address);
//       } else {
//         // Add new address
//         await addressProvider.addAddress(address);
//       }
      
//       if (mounted) {
//         Navigator.pop(context, true); // Return true to indicate success
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error saving address: ${e.toString()}'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }
// }











import 'package:consultation_app/auth/views/provider/address_provider.dart';
import 'package:consultation_app/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import your Address model and AddressProvider
// import 'address_model.dart';
// import 'address_provider.dart';

class AddAddress extends StatefulWidget {
  final Address? address; // For editing existing address
  
  const AddAddress({super.key, this.address});
  
  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _streetController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _countryController;
  late TextEditingController _postalCodeController;
  
  String _selectedAddressType = 'Home';
  final List<String> _addressTypes = ['Home', 'Work', 'Office', 'Other'];
  
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    
    // Initialize controllers with existing data if editing
    _streetController = TextEditingController(text: widget.address?.street ?? '');
    _cityController = TextEditingController(text: widget.address?.city ?? '');
    _stateController = TextEditingController(text: widget.address?.state ?? '');
    _countryController = TextEditingController(text: widget.address?.country ?? '');
    _postalCodeController = TextEditingController(text: widget.address?.postalCode ?? '');
    
    if (widget.address != null) {
      _selectedAddressType = widget.address!.addressType;
    }
  }
  
  @override
  void dispose() {
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final isEditing = widget.address != null;
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          isEditing ? 'Edit Address' : 'Add Address',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Address Type Dropdown
              const Text(
                'Address Type',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedAddressType,
                    isExpanded: true,
                    items: _addressTypes
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedAddressType = value;
                        });
                      }
                    },
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Street Address Field
              _buildTextField(
                label: 'Street Address',
                controller: _streetController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter street address';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16),
              
              // City Field
              _buildTextField(
                label: 'City',
                controller: _cityController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter city';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16),
              
              // State and Postal Code Row
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: 'State',
                      controller: _stateController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter state';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                      label: 'Postal Code',
                      controller: _postalCodeController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter postal code';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Country Field
              _buildTextField(
                label: 'Country',
                controller: _countryController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter country';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 32),
              
              // Save Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _saveAddress,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          isEditing ? 'Update Address' : 'Save Address',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Cancel Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: _isLoading ? null : () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
        ),
      ],
    );
  }
  
  Future<void> _saveAddress() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    
    setState(() {
      _isLoading = true;
    });
    
    try {
      final addressProvider = Provider.of<AddressProvider>(context, listen: false);
      
      final address = Address(
        id: widget.address?.id, // Keep existing id if editing
        street: _streetController.text.trim(),
        city: _cityController.text.trim(),
        state: _stateController.text.trim(),
        country: _countryController.text.trim(),
        postalCode: _postalCodeController.text.trim(),
        addressType: _selectedAddressType,
      );
      
      print('Saving address: ${address.toJson()}'); // Debug print
      
      bool success;
      if (widget.address != null) {
        // Update existing address
        success = await addressProvider.updateAddress(widget.address!.id!, address);
      } else {
        // Add new address
        success = await addressProvider.addAddress(address);
      }
      
      print('Save operation success: $success'); // Debug print
      
      if (mounted) {
        if (success) {
          Navigator.pop(context, true); // Return true to indicate success
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(addressProvider.errorMessage.isNotEmpty 
                  ? addressProvider.errorMessage 
                  : 'Failed to save address'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      print('Exception in _saveAddress: $e'); // Debug print
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving address: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}