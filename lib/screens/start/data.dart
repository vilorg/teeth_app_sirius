class DataQuestion {
  String title;
  List<String> variants;
  List<double> weight;
  bool isMany;
  bool isLow;

  DataQuestion(this.title, this.variants, this.weight,
      {this.isMany = false, this.isLow = false});
}

List<DataQuestion> getQuestions() {
  return [
    DataQuestion(
      "Сколько месяцев продолжалось грудное вскармливание Вашего ребенка?",
      ["Менее 2 месяцев", "3-6 месяцев", "7-12 месяцев", ">12 месяцев"],
      [0.2, 0, -0.1, -0.2],
    ),
    DataQuestion(
      "Добавляли ли Вы сахар в детское питание?",
      ["Да", "Нет"],
      [0.1, -0.1],
    ),
    DataQuestion(
      "Какое детское питание Вы считали полезным для здоровых зубов?",
      ["Несладкое", "Умеренно сладкое", "Очень сладкое"],
      [-0.1, 0.1, 0.2],
    ),
    DataQuestion(
      "Были ли назначены Вашему ребенку средства профилактики кариеса зубов?",
      ["Да", "Нет"],
      [-0.2, 0.2],
      isLow: true,
    ),
    DataQuestion(
      "Если да, то какие средства профилактики вам  были назначены?",
      [
        "Осмотр у стоматолога",
        "Отказ от засыпания с бутылочкой",
        "Отказ от пустышки",
        "Отказ от искусственного вскармливания",
        "Ограничение потребления сладостей",
        "Применение зубных паст с фторидами",
        "Применение реминерализующего геля",
        "Замена щётки",
        "Применение зубной нити",
        "Лечение кариеса",
        "Герметизация фиссур",
        "Фторирование",
        "Профессиональная гигиена",
        "Серебрение зубов",
        "Другое",
      ],
      [
        -0.01,
        -0.02,
        -0.02,
        -0.02,
        -0.02,
        -0.02,
        -0.02,
        -0.02,
        -0.02,
        -0.03,
        -0.03,
        -0.03,
        -0.03,
        0.02,
        -0.01,
      ],
      isMany: true,
      isLow: true,
    ),
  ];
}

class Area {
  String name;
  int value;

  Area(this.name, this.value);
}

List<Area> getAreas() {
  return [];
}