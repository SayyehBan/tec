import 'package:tec/gen/assets.gen.dart';
import 'package:tec/model/model/data_models.dart';

//blog fake data

List<HashTagModel> tagList = [
  HashTagModel(title: 'جاوا'),
  HashTagModel(title: 'کاتلین'),
  HashTagModel(title: 'وب'),
  HashTagModel(title: 'هوش مصنوعی'),
  HashTagModel(title: 'سی شارپ'),
  HashTagModel(title: 'ریکت'),
  HashTagModel(title: 'iot'),
  HashTagModel(title: 'فلاتر'),
];

late List<HashTagModel> myCatTagList;

List<BlogModel> blogList = [
  BlogModel(
      id: 1,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/FvCadqHXgAEjJpk-330x200.jpg",
      title:
          "پدرخوانده هوش مصنوعی با استعفا از گوگل، از تلاش‌های قبلی خود در این زمینه ابراز پشیمانی کرد",
      writer: "ایمان صاحبی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/226797-32x32.jpg",
      date: "29 دقیقه قبل",
      content: "هیچ‌کس دوست ندارد اوپنهایمر بعدی باشد!",
      views: "85"),
  BlogModel(
      id: 2,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/Browser-market-330x200.jpg",
      title:
          "سافاری با کنارزدن مایکروسافت اج، حالا دومین مرورگر محبوب دسکتاپ است",
      writer: "محمد قریشی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/210361-32x32.jpg",
      date: "1 ساعت قبل",
      content:
          "کروم همچنان در تمام بخش‌ها محبوب‌ترین مرورگر است و سافاری هم توانسته با کنارزدن اج، دومین مرورگر محبوب دنیای دسکتاپ‌ها شود.",
      views: "69"),
  BlogModel(
      id: 3,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/tax-crypto-330x200.jpg",
      title: "رمزارزها مشمول مالیات بر عایدی سرمایه شدند",
      writer: "مجتبی آستانه",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/223622-32x32.jpg",
      date: "2 ساعت قبل",
      content:
          "نمایندگان مجلس در ادامه رسیدگی به طرح مالیات بر عایدی سرمایه، انواع رمزارزها را مشمول مالیات بر عایدی سرمایه دانستند.",
      views: "46"),
  BlogModel(
      id: 3,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/FvCadqHXgAEjJpk-330x200.jpg",
      title:
          "پدرخوانده هوش مصنوعی با استعفا از گوگل، از تلاش‌های قبلی خود در این زمینه ابراز پشیمانی کرد",
      writer: "ایمان صاحبی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/226797-32x32.jpg",
      date: "29 دقیقه قبل",
      content: "هیچ‌کس دوست ندارد اوپنهایمر بعدی باشد!",
      views: "85"),
  BlogModel(
      id: 4,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/Browser-market-330x200.jpg",
      title:
          "سافاری با کنارزدن مایکروسافت اج، حالا دومین مرورگر محبوب دسکتاپ است",
      writer: "محمد قریشی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/210361-32x32.jpg",
      date: "1 ساعت قبل",
      content:
          "کروم همچنان در تمام بخش‌ها محبوب‌ترین مرورگر است و سافاری هم توانسته با کنارزدن اج، دومین مرورگر محبوب دنیای دسکتاپ‌ها شود.",
      views: "69"),
  BlogModel(
      id: 5,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/tax-crypto-330x200.jpg",
      title: "رمزارزها مشمول مالیات بر عایدی سرمایه شدند",
      writer: "مجتبی آستانه",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/223622-32x32.jpg",
      date: "2 ساعت قبل",
      content:
          "نمایندگان مجلس در ادامه رسیدگی به طرح مالیات بر عایدی سرمایه، انواع رمزارزها را مشمول مالیات بر عایدی سرمایه دانستند.",
      views: "46"),
  BlogModel(
      id: 6,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/FvCadqHXgAEjJpk-330x200.jpg",
      title:
          "پدرخوانده هوش مصنوعی با استعفا از گوگل، از تلاش‌های قبلی خود در این زمینه ابراز پشیمانی کرد",
      writer: "ایمان صاحبی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/226797-32x32.jpg",
      date: "29 دقیقه قبل",
      content: "هیچ‌کس دوست ندارد اوپنهایمر بعدی باشد!",
      views: "85"),
  BlogModel(
      id: 7,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/Browser-market-330x200.jpg",
      title:
          "سافاری با کنارزدن مایکروسافت اج، حالا دومین مرورگر محبوب دسکتاپ است",
      writer: "محمد قریشی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/210361-32x32.jpg",
      date: "1 ساعت قبل",
      content:
          "کروم همچنان در تمام بخش‌ها محبوب‌ترین مرورگر است و سافاری هم توانسته با کنارزدن اج، دومین مرورگر محبوب دنیای دسکتاپ‌ها شود.",
      views: "69"),
  BlogModel(
      id: 8,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/tax-crypto-330x200.jpg",
      title: "رمزارزها مشمول مالیات بر عایدی سرمایه شدند",
      writer: "مجتبی آستانه",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/223622-32x32.jpg",
      date: "2 ساعت قبل",
      content:
          "نمایندگان مجلس در ادامه رسیدگی به طرح مالیات بر عایدی سرمایه، انواع رمزارزها را مشمول مالیات بر عایدی سرمایه دانستند.",
      views: "46"),
  BlogModel(
      id: 9,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/FvCadqHXgAEjJpk-330x200.jpg",
      title:
          "پدرخوانده هوش مصنوعی با استعفا از گوگل، از تلاش‌های قبلی خود در این زمینه ابراز پشیمانی کرد",
      writer: "ایمان صاحبی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/226797-32x32.jpg",
      date: "29 دقیقه قبل",
      content: "هیچ‌کس دوست ندارد اوپنهایمر بعدی باشد!",
      views: "85"),
  BlogModel(
      id: 10,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/Browser-market-330x200.jpg",
      title:
          "سافاری با کنارزدن مایکروسافت اج، حالا دومین مرورگر محبوب دسکتاپ است",
      writer: "محمد قریشی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/210361-32x32.jpg",
      date: "1 ساعت قبل",
      content:
          "کروم همچنان در تمام بخش‌ها محبوب‌ترین مرورگر است و سافاری هم توانسته با کنارزدن اج، دومین مرورگر محبوب دنیای دسکتاپ‌ها شود.",
      views: "69"),
  BlogModel(
      id: 11,
      imageUrl:
          "https://static.digiato.com/digiato/2023/05/tax-crypto-330x200.jpg",
      title: "رمزارزها مشمول مالیات بر عایدی سرمایه شدند",
      writer: "مجتبی آستانه",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/avatars/223622-32x32.jpg",
      date: "2 ساعت قبل",
      content:
          "نمایندگان مجلس در ادامه رسیدگی به طرح مالیات بر عایدی سرمایه، انواع رمزارزها را مشمول مالیات بر عایدی سرمایه دانستند.",
      views: "46"),
];

Map homePagePosterMap = {
  "imageAssets": Assets.images.programming.path,
  "writer": "مهسا امینی",
  "date": "یک روز پیش",
  "title": "دوازده قدم برنامه نویسی یک دوره",
  "view": "1500"
};
