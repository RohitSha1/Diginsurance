class DoctorOld {
  final String name;
  final String specialist;
  final String rating;
  final String reviews;
  final String academy;
  final String image;
  DoctorOld({
    required this.academy,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.specialist,
    required this.image,
  });
}

class Consultation {
  final String title;
  final String subtitle;
  final String price;
  Consultation({
    required this.price,
    required this.subtitle,
    required this.title,
  });
}

List<Consultation> consultationList = [
  Consultation(
    title: "Cardio Issues?",
    price: "400",
    subtitle:
        "For cardio patient here can easily contact with doctorOld. Can chat & live chat.",
  ),
  Consultation(
    title: "Dental trouble?",
    price: "30",
    subtitle:
        "For dental patient here can easily contact with doctor. Can chat & live chat.",
  ),
  Consultation(
    title: "Heart Issues?",
    price: "350",
    subtitle:
        "For heart patient here can easily contact with doctor. Can chat & live chat.",
  ),
  Consultation(
    title: "Eyes Issues?",
    price: "500",
    subtitle:
        "For eyes patient here can easily contact with doctor. Can chat & live chat.",
  ),
  Consultation(
    title: "Therapist?",
    price: "250",
    subtitle:
        "For therapist patient here can easily contact with doctor. Can chat & live chat.",
  ),
];

List<DoctorOld> doctorList = [
  DoctorOld(
      name: "Dr. Jessica Vania",
      rating: "4.5",
      reviews: "80",
      specialist: "Cardiologist",
      academy: "Harvard Medical College Hospital",
      image:
          "images/5-Ways-to-Help-Employees-Choose-the-Right-Primary-Care-Doctor--e1543342970537.jpg"),
  DoctorOld(
      name: "Dr. Mahmud Nik Hasan",
      rating: "4.9",
      reviews: "27",
      specialist: "Heart Surgeon",
      academy: "Dhaka Medical College Hospital",
      image: "images/92019175-happy-doctor-with-clipboard-at-clinic.jpg"),
  DoctorOld(
      name: "Dr. Jessie McCaffrey",
      rating: "4.9",
      reviews: "27",
      specialist: "Therapist",
      academy: "Los Angeles Medical College Hospital",
      image: "images/doctor-in-branding-article.jpg"),
  DoctorOld(
      name: "Dr. Justin Lathia",
      rating: "4.9",
      reviews: "27",
      specialist: "Dental",
      academy: "Miami Medical College Hospital",
      image: "images/eIFBqS61.jpg"),
  DoctorOld(
      name: "Dr. Hayley Williams",
      rating: "4.9",
      reviews: "27",
      specialist: "Cardiologist",
      academy: "New York Medical College Hospital",
      image: "images/file-20191203-66986-im7o5.jpg"),
  DoctorOld(
      name: "Dr. Sakura Miyawaki",
      rating: "4.9",
      reviews: "27",
      specialist: "Cardiologist",
      academy: "Tokyo University Medical College Hospital",
      image: "images/national-doctors-day-1-920x518.jpg"),
];
