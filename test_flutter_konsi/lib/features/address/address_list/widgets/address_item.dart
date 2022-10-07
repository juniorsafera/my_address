import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/models/address_model.dart';
import 'package:test_flutter_konsi/core/utils/colors.dart';

class AddressItemWidget extends StatelessWidget {
  final AddressModel addressModel;
  final Function()? onTap;
  const AddressItemWidget({
    super.key,
    required this.addressModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: myPrimaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 3,
                blurRadius: 12,
                offset: const Offset(2, 5), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.route,
                color: Colors.white,
              ),
              Column(
                children: [
                  Text(
                    addressModel.postalCode == null
                        ? 'Cep indispoível'
                        : UtilBrasilFields.obterCep(addressModel.postalCode!),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: Get.width * 0.7,
                    child: Text(
                      addressModel.streetName ?? '-',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    addressModel.neighborhood ?? '-',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${addressModel.city ?? '-'} - ${addressModel.state ?? '-'}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
