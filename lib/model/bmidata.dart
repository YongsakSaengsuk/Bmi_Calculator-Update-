import 'package:bmi_calculator/model/bmi.dart';

List<Bmi> bmiLevels = [
  Bmi(
    "น้ำหนักต่ำกว่าเกณฑ์ (Underweight)",
    "ค่าดัชนีมวลกายของคุณต่ำกว่า 18.5 ซึ่งแสดงถึงน้ำหนักที่ต่ำกว่าเกณฑ์มาตรฐาน ควรเพิ่มการรับประทานอาหารและสารอาหารให้เพียงพอ",
  ),
  Bmi(
    "น้ำหนักปกติ (Normal weight)",
    "ค่าดัชนีมวลกายของคุณอยู่ในช่วง 18.5-24.9 ซึ่งแสดงถึงน้ำหนักที่เหมาะสมและสุขภาพที่ดี",
  ),
  Bmi(
    "น้ำหนักเกินเกณฑ์ ระดับ 1 (Overweight Level 1)",
    "ค่าดัชนีมวลกายของคุณอยู่ในช่วง 25.0-29.9 ซึ่งแสดงถึงน้ำหนักที่มากกว่าเกณฑ์ ควรเริ่มควบคุมอาหารและออกกำลังกาย",
  ),
  Bmi(
    "น้ำหนักเกินเกณฑ์ ระดับ 2 (Overweight Level 2)",
    "ค่าดัชนีมวลกายของคุณอยู่ในช่วง 30.0-34.9 ซึ่งเป็นระดับที่เริ่มเสี่ยงต่อปัญหาสุขภาพ ควรปรึกษาแพทย์เพื่อจัดการน้ำหนัก",
  ),
  Bmi(
    "โรคอ้วน (Obesity)",
    "ค่าดัชนีมวลกายของคุณเกิน 35.0 ซึ่งแสดงถึงความเสี่ยงสูงต่อโรคเรื้อรัง เช่น เบาหวาน ความดันโลหิตสูง และโรคหัวใจ ควรรับคำปรึกษาทางการแพทย์",
  ),
];
