// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RestaurantOrderView extends HookWidget {
  const RestaurantOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    // Reactive cart data
    final cart = useCart(AppSection.restaurant);
    final storage = useMemoized(() => StorageProvider());

    // Calculate total
    final total = cart.entries.fold<double>(0.0, (sum, entry) {
      final product = getProductById(entry.key, AppSection.restaurant);
      return product == null ? sum : sum + product.price * entry.value;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'My Order',
          style: AppTextStyle.text().lg().bold().withColor(Colors.black),
        ),
        SizedBox(height: 20),
        if (cart.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restaurant_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Sargydyňyz boş',
                    style: AppTextStyle.text().lg().semiBold().withColor(
                      Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sargydyňyzy doldurmak üçin harytlar goşuň',
                    style: AppTextStyle.text().md().withColor(Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final productId = cart.keys.elementAt(index);
                      final quantity = cart[productId]!;
                      final product = getProductById(
                        productId,
                        AppSection.restaurant,
                      );

                      if (product == null) return SizedBox.shrink();

                      return AppCartItem(
                        onRemove: () {
                          storage.updateCartQuantity(
                            productId,
                            0,
                            AppSection.restaurant,
                          );
                        },
                        onQuantityChanged: (newQuantity) {
                          storage.updateCartQuantity(
                            productId,
                            newQuantity,
                            AppSection.restaurant,
                          );
                        },
                        name: product.name,
                        price: product.price,
                        description: product.description,
                        quantity: quantity,
                        image: Image.asset(
                          product.imagePath,
                          fit: BoxFit.cover,
                        ),
                        section: AppSection.restaurant,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                  ),
                ),

                // Checkout Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Total Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jemi:',
                            style: AppTextStyle.text().md().bold().withColor(
                              Colors.black,
                            ),
                          ),
                          Text(
                            'TMT ${total.toStringAsFixed(2)}',
                            style: AppTextStyle.text().md().bold().withColor(
                              Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Promotional Text
                      Text(
                        'Hormatly müşderi eger sizin sargyt sanyñyz 15 kan bolsa indiki sargyt mugt!',
                        style: AppTextStyle.text().sm().withColor(Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      // Place Order Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Show order modal bottom sheet
                            _showOrderModalBottomSheet(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.getSectionAccent(
                              AppSection.restaurant,
                            ),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Sargyt taýýarla',
                            style: AppTextStyle.text().md().bold().withColor(
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  void _showOrderModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          _CheckoutModalBottomSheet(section: AppSection.restaurant),
    );
  }
}

class _CheckoutModalBottomSheet extends HookWidget {
  const _CheckoutModalBottomSheet({required this.section});

  final AppSection section;

  @override
  Widget build(BuildContext context) {
    final paymentMethod = useState('Nagt');
    final deliveryType = useState('Standart eltip bermek (10.00)');
    final fullName = useState('Amanow Aman');
    final address = useState('Aşgabat ş.');
    final phone = useState('+993 62 122112');
    final note = useState('Sag boluň!');

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Sebet',
              style: AppTextStyle.text().lg().bold().withColor(Colors.black),
            ),
          ),

          // Form Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Payment Method Section
                  _buildSection(
                    'Töleg görnüşi',
                    Column(
                      children: [
                        _buildRadioTile(
                          'Nagt',
                          paymentMethod.value == 'Nagt',
                          (value) => paymentMethod.value = value,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Delivery Type Section
                  _buildSection(
                    'Eltip bermegiň görnüşi',
                    Column(
                      children: [
                        _buildRadioTile(
                          'Standart eltip bermek (10.00)',
                          deliveryType.value == 'Standart eltip bermek (10.00)',
                          (value) => deliveryType.value = value,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Customer Details Sections
                  _buildSection('Doly adyňyz', _buildTextField(fullName)),

                  const SizedBox(height: 20),

                  _buildSection('Siziň salgyňyz', _buildTextField(address)),

                  const SizedBox(height: 20),

                  _buildSection('Telefon belgiňiz', _buildTextField(phone)),

                  const SizedBox(height: 20),

                  _buildSection('Bellik', _buildTextField(note)),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Order Button
          Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showOrderSuccessDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.getSectionAccent(section),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Sargyt et',
                  style: AppTextStyle.text().md().bold().withColor(
                    Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.text().md().bold().withColor(Colors.black),
        ),
        const SizedBox(height: 12),
        content,
      ],
    );
  }

  Widget _buildRadioTile(String title, bool value, Function(String) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: value
              ? AppColors.getSectionAccent(section)
              : Colors.grey.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Radio<String>(
            value: title,
            groupValue: value ? title : null,
            onChanged: (newValue) => onChanged(newValue!),
            activeColor: AppColors.getSectionAccent(section),
          ),
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.text().md().withColor(Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(ValueNotifier<String> controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2), width: 1),
      ),
      child: TextFormField(
        initialValue: controller.value,
        onChanged: (value) => controller.value = value,
        style: AppTextStyle.text().md().withColor(Colors.black),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  void _showOrderSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.getSectionAccent(
                    section,
                  ).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.restaurant,
                  color: AppColors.getSectionAccent(section),
                  size: 48,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Order Placed Successfully!',
                style: AppTextStyle.text().lg().bold().withColor(Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                'Your food is being prepared and will be ready soon.',
                style: AppTextStyle.text().md().withColor(Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Clear cart after successful order
                    final storage = StorageProvider();
                    storage.clearCart(section);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.getSectionAccent(section),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Continue Browsing',
                    style: AppTextStyle.text().md().bold().withColor(
                      Colors.white,
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
}
