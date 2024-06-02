import 'Products Class.dart';
import 'constants.dart';
class Database {
  static List<Products> generatedata()
  {
    List<Products> productlist = [
      Products(constants.K1, "YARN DYED STRIPE SHIRT", "1,500", "M", "White"),
      Products(constants.K2, "SOLID CO ORD", "1,200", "S", "Red"),
      Products(constants.K3, "SHORTS SLEEVE LINEN SHIRT", "1,800", "L", "Sky Blue"),
      Products(constants.K4, "RELAXED BUTTONUP SHIRT", "2,000", "M", "Red"),
      Products(constants.K5, "SUIT WITH GRAPHIC TEE", "1,550", "L", "Pink"),
      Products(constants.K6, "GRAPHIC TANK TOP", "2,700", "M", "Red"),
      Products(constants.K7, "GRAPHIC SUIT", "1,990", "S", "Yellow"),
      Products(constants.K8, "CROCODILE PRINTED SUIT", "2,800", "L", "Blue"),
      Products(constants.K9, "CONTRAST SLOGAN PRINT T-SHIRT", "2,700", "S", "White"),
      Products(constants.K10, "CHARACTER PRNT DENIM", "2,250", "M", "Blue"),
      Products(constants.K11, "BASIC RUFFLED ", "3,000", "S", "White"),
      Products(constants.K1, "YARN DYED STRIPE SHIRT", "1,500", "L", "White"),
    ];
    return productlist;
  }
}