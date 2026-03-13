class faqQuestionModel {
  faqQuestionModel({required this.question, required this.answer});
  String question;
  String answer;
  static List<faqQuestionModel> faqsTazId = [
    faqQuestionModel(
      question: 'What is a Tazkarti ID?',
      answer:
          'Tazkarti ID is a unique identification card used to identify a fan registered in Tazkarti system. It allows access to any sports stadium for matches around Egypt. Besides the ticket, it acts as an entry pass and an access tool to stadiums.',
    ),
    faqQuestionModel(
      question: 'Why do I need to register for a Tazkarti ID?',
      answer:
          'Fans MUST  apply for a Tazkarti ID to be able to book tickets and attend matches.',
    ),
    faqQuestionModel(
      question: 'How much does a Tazkarti ID cost?',
      answer:
          'It costs 100 Egyptian pounds to obtain Tazkarti ID. However, to get Tazkarti ID, you must purchase a ticket.',
    ),
    faqQuestionModel(
      question: 'How can I get my Tazkarti ID card?',
      answer:
          'In order to be able to get your ticket you must first register and then buy a ticket, after that you can collect your ticket with your ticket from any authorized outlet. Visit our stores page for more information.',
    ),
    faqQuestionModel(
      question: 'Where can I receive my Tazkarti ID?',
      answer:
          'You can pick it up from any of our authorized outlets.Visit Our Stores page for more information.',
    ),
    faqQuestionModel(
      question: 'What if I lost my Tazkarti ID card?',
      answer:
          'In case of losing your Tazkarti ID card, you must go to one of our authorized outlets and request a reprint, along with payment for the cost of the extraction, by presenting a valid national ID card or a valid passport.',
    ),
    faqQuestionModel(
      question: 'Can someone else receive my Tazkarti ID card? ',
      answer:
          'Yes, you can authorize someone else to receive your Tazkarti ID card from an authorized outlet, whether this person has a Tazkarti ID or not. However, you have to first purchase your first ticket to be eligible for a Tazkarti ID.',
    ),
  ];
static List<faqQuestionModel> faqsTazIdRegister=[

];
static List<faqQuestionModel> faqsMyAccount=[
  
];
static List<faqQuestionModel> faqsFamily=[
  
];
static List<faqQuestionModel> faqsMatchesAndTickets=[
  
];

}
