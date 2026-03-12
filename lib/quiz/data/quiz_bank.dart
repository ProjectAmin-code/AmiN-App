import '../models/quiz_interaction_type.dart';
import '../models/quiz_level.dart';
import '../models/quiz_option.dart';
import '../models/quiz_question.dart';

class QuizBank {
  static const List<QuizQuestion> questions = [
    QuizQuestion(
      id: 'q01',
      order: 1,
      title: 'Soalan 1',
      prompt:
          'Daripada senarai imbuhan awalan di bawah, pilih hanya imbuhan awalan meN-.',
      level: QuizLevel.easy,
      interactionType: QuizInteractionType.multiSelect,
      options: [
        QuizOption(id: 'me', label: 'me-'),
        QuizOption(id: 'mem', label: 'mem-'),
        QuizOption(id: 'men', label: 'men-'),
        QuizOption(id: 'meng', label: 'meng-'),
        QuizOption(id: 'menge', label: 'menge-'),
        QuizOption(id: 'meny', label: 'meny-'),
        QuizOption(id: 'ber', label: 'ber-'),
        QuizOption(id: 'di', label: 'di-'),
        QuizOption(id: 'ter', label: 'ter-'),
      ],
      correctOptionIds: {'me', 'mem', 'men', 'meng', 'menge', 'meny'},
      explanation:
          'Awalan meN- yang betul ialah me-, mem-, men-, meng-, menge-, dan meny-.',
    ),
    QuizQuestion(
      id: 'q02',
      order: 2,
      title: 'Soalan 2 - MCQ',
      prompt: 'Pilih perkataan yang mengandungi imbuhan awalan meN-.',
      level: QuizLevel.easy,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'dibaca'),
        QuizOption(id: 'B', label: 'melawat'),
        QuizOption(id: 'C', label: 'tulis'),
      ],
      correctOptionIds: {'B'},
      imageReferences: ['Gambar keluarga melawat zoo'],
      explanation: 'Perkataan yang mengandungi awalan meN- ialah melawat.',
    ),
    QuizQuestion(
      id: 'q03',
      order: 3,
      title: 'Soalan 3 - Padanan',
      prompt:
          'Padankan kata dasar dengan perkataan berimbuhan meN- yang betul.',
      level: QuizLevel.easy,
      interactionType: QuizInteractionType.matching,
      matchingLeft: ['lintas', 'baca', 'cipta'],
      matchingChoices: ['mencipta', 'melintas', 'membaca'],
      matchingAnswers: ['melintas', 'membaca', 'mencipta'],
      explanation: 'lintas -> melintas, baca -> membaca, cipta -> mencipta.',
    ),
    QuizQuestion(
      id: 'q04',
      order: 4,
      title: 'Soalan 4',
      prompt:
          'Pilih perkataan yang betul untuk melengkapkan ayat: Adik sedang ______ gambar di buku lukisan.',
      level: QuizLevel.easy,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'menari'),
        QuizOption(id: 'B', label: 'menyanyi'),
        QuizOption(id: 'C', label: 'melukis'),
        QuizOption(id: 'D', label: 'membaca'),
      ],
      correctOptionIds: {'C'},
      explanation:
          'Melukis ialah kata kerja berimbuhan awalan meN- (me- + lukis).',
    ),
    QuizQuestion(
      id: 'q05',
      order: 5,
      title: 'Soalan 5 - Susun Suku Kata',
      prompt:
          'Susun suku kata di bawah untuk membentuk perkataan berimbuhan awalan meN- yang betul: mem + bawa.',
      level: QuizLevel.easy,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'memawa'),
        QuizOption(id: 'B', label: 'membawa'),
        QuizOption(id: 'C', label: 'bawamem'),
        QuizOption(id: 'D', label: 'memabwa'),
      ],
      correctOptionIds: {'B'},
      explanation: 'meN- + bawa membentuk perkataan membawa.',
    ),
    QuizQuestion(
      id: 'q06',
      order: 6,
      title: 'Soalan 6 - Interaktif',
      prompt:
          'Susun semula huruf-huruf di bawah untuk membentuk perkataan berimbuhan awalan meN- yang betul.',
      level: QuizLevel.easy,
      interactionType: QuizInteractionType.textInput,
      acceptableTextAnswers: ['menggosok'],
      imageReferences: ['Visual: Budak sedang menggosok gigi'],
      explanation: 'Kata dasar gosok menerima imbuhan meN- menjadi menggosok.',
    ),
    QuizQuestion(
      id: 'q07',
      order: 7,
      title: 'Soalan 7 - MCQ Bergambar',
      prompt:
          'Lengkapkan ayat: Ibu sedang ______ sayur-sayuran di dapur untuk memasak makanan tengah hari.',
      level: QuizLevel.easy,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'memotong'),
        QuizOption(id: 'B', label: 'mengangkat'),
        QuizOption(id: 'C', label: 'mengelap'),
        QuizOption(id: 'D', label: 'menjerit'),
      ],
      correctOptionIds: {'A'},
      imageReferences: [
        'Gambar: Seorang kanak-kanak atau ibu sedang memotong sayur atau buah di dapur',
      ],
      explanation: 'Kata dasar potong menerima imbuhan meN- menjadi memotong.',
    ),
    QuizQuestion(
      id: 'q08',
      order: 8,
      title: 'Soalan 8 - Seret Imbuhan',
      prompt:
          'Seret imbuhan awalan meN- yang sesuai ke hadapan kata dasar berikut.',
      level: QuizLevel.easy,
      interactionType: QuizInteractionType.dragDrop,
      dragTargets: ['lancong', 'awas', 'jemput'],
      dragChoices: ['me-', 'men-', 'meng-'],
      dragAnswers: ['me-', 'meng-', 'men-'],
      helperLines: ['Jawapan: melancong, mengawas, menjemput'],
    ),
    QuizQuestion(
      id: 'q09',
      order: 9,
      title: 'Soalan 9 - Padanan menge-',
      prompt:
          'Tuliskan kata terbitan yang betul dengan menambah imbuhan awalan menge- pada kata dasar berikut.',
      level: QuizLevel.easy,
      interactionType: QuizInteractionType.matching,
      matchingLeft: ['cat', 'bom', 'lap'],
      matchingChoices: ['mengebom', 'mengelap', 'mengecat'],
      matchingAnswers: ['mengecat', 'mengebom', 'mengelap'],
    ),
    QuizQuestion(
      id: 'q10',
      order: 10,
      title: 'Soalan 10 - Seret Huruf Perubahan',
      prompt:
          'Seret huruf perubahan yang sesuai ke hadapan kata dasar untuk membentuk perkataan berimbuhan awalan meN- yang betul.',
      level: QuizLevel.easy,
      interactionType: QuizInteractionType.dragDrop,
      dragTargets: ['potong', 'tulis', 'kawal', 'sapu'],
      dragChoices: ['m', 'n', 'ng', 'ny'],
      dragAnswers: ['m', 'n', 'ng', 'ny'],
      helperLines: [
        'Jika salah: Oops! Cuba semula. Ingat perubahan huruf berlaku jika guna imbuhan meN-.',
        'Jika betul semua: Tahniah! Anda berjaya membentuk semua perkataan dengan betul!',
      ],
      explanation: 'p->m, t->n, k->ng, s->ny.',
    ),
    QuizQuestion(
      id: 'q11',
      order: 11,
      title: 'Soalan Tambahan Tahap Mudah 1',
      prompt:
          'Lihat gambar di atas. Apakah perkataan berimbuhan awalan meN- yang betul berdasarkan tindakan dalam gambar?',
      level: QuizLevel.easy,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'mepasak'),
        QuizOption(id: 'B', label: 'mensak'),
        QuizOption(id: 'C', label: 'memasak'),
        QuizOption(id: 'D', label: 'memaksak'),
      ],
      correctOptionIds: {'C'},
      imageReferences: ['Gambar: Seorang wanita sedang memasak di dapur'],
      explanation:
          'Perkataan memasak berasal daripada kata dasar masak + imbuhan meN-.',
    ),

    QuizQuestion(
      id: 'q12',
      order: 12,
      title: 'Soalan 11 (Tahap Sederhana)',
      prompt:
          'Seret huruf perubahan yang betul ke hadapan kata dasar untuk membentuk perkataan berimbuhan meN- yang tepat.',
      level: QuizLevel.medium,
      interactionType: QuizInteractionType.dragDrop,
      dragTargets: ['pusing', 'tarik', 'kerat', 'sapu'],
      dragChoices: ['m', 'n', 'ng', 'ny'],
      dragAnswers: ['m', 'n', 'ng', 'ny'],
      helperLines: ['Jawapan: memusing, menarik, mengerat, menyapu'],
    ),
    QuizQuestion(
      id: 'q13',
      order: 13,
      title: 'Soalan 12',
      prompt:
          'Pilih perkataan berimbuhan awalan meN- yang betul untuk melengkapkan ayat: Siti mula ______ selepas terjatuh dari basikal.',
      level: QuizLevel.medium,
      interactionType: QuizInteractionType.textInput,
      acceptableTextAnswers: ['menangis'],
    ),
    QuizQuestion(
      id: 'q14',
      order: 14,
      title: 'Soalan 13 - MCQ Bergambar',
      prompt:
          'Lihat gambar di bawah. Pilih perkataan berimbuhan meN- yang paling sesuai berdasarkan situasi dalam gambar. Apakah murid itu sedang lakukan?',
      level: QuizLevel.medium,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'menari'),
        QuizOption(id: 'B', label: 'menyusun'),
        QuizOption(id: 'C', label: 'membaca'),
        QuizOption(id: 'D', label: 'melukis'),
      ],
      correctOptionIds: {'B'},
      imageReferences: ['Gambar: Murid menyusun buku di rak'],
      explanation:
          'Menyusun berasal daripada kata dasar susun dengan awalan meN-.',
    ),
    QuizQuestion(
      id: 'q15',
      order: 15,
      title: 'Soalan 14 - Drag and Drop',
      prompt:
          'Seret imbuhan awalan meN- yang sesuai ke hadapan kata dasar berikut untuk membentuk perkataan yang betul.',
      level: QuizLevel.medium,
      interactionType: QuizInteractionType.dragDrop,
      dragTargets: ['nilai', 'bina', 'curi', 'hafal'],
      dragChoices: ['me-', 'mem-', 'men-', 'meng-'],
      dragAnswers: ['men-', 'mem-', 'men-', 'meng-'],
      helperLines: ['Jawapan: menilai, membina, mencuri, menghafal'],
    ),
    QuizQuestion(
      id: 'q16',
      order: 16,
      title: 'Soalan 15 - Ayat Konteks',
      prompt:
          'Setiap pagi, Puan Aisyah akan masuk ke dapur seawal jam 6.00 pagi. Beliau akan menyediakan sarapan untuk keluarganya. Selepas itu, beliau akan ______ rumah sebelum keluar bekerja.',
      level: QuizLevel.medium,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'menyusun'),
        QuizOption(id: 'B', label: 'menggosok'),
        QuizOption(id: 'C', label: 'mengemas'),
        QuizOption(id: 'D', label: 'mengangkat'),
      ],
      correctOptionIds: {'C'},
      explanation:
          'Perkataan yang paling sesuai dalam konteks petikan ialah mengemas.',
    ),
    QuizQuestion(
      id: 'q17',
      order: 17,
      title: 'Soalan 16 - Isi Tempat Kosong',
      prompt:
          'Isikan tempat kosong dalam ayat berikut dengan perkataan berimbuhan meN- yang paling sesuai: Adik selalu ______ duit lebihan belanja ke dalam tabung berbentuk kucing.',
      level: QuizLevel.medium,
      interactionType: QuizInteractionType.textInput,
      acceptableTextAnswers: ['menabung'],
    ),
    QuizQuestion(
      id: 'q18',
      order: 18,
      title: 'Soalan 17 - MCQ',
      prompt:
          'Pilih perkataan berimbuhan meN- yang paling sesuai untuk melengkapkan ayat berikut: Sebaik tiba di rumah, Lokman terus ______ tangan ibunya sebagai tanda hormat.',
      level: QuizLevel.medium,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'mencium'),
        QuizOption(id: 'B', label: 'mengangkat'),
        QuizOption(id: 'C', label: 'menjemur'),
        QuizOption(id: 'D', label: 'memadam'),
      ],
      correctOptionIds: {'A'},
    ),
    QuizQuestion(
      id: 'q19',
      order: 19,
      title: 'Soalan 18 - MCQ',
      prompt:
          'Pilih perkataan berimbuhan meN- yang paling sesuai untuk melengkapkan ayat berikut: Adik ketawa riang sambil ______ di taman permainan bersama rakan-rakannya.',
      level: QuizLevel.medium,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'menggelongsor'),
        QuizOption(id: 'B', label: 'mengangkat'),
        QuizOption(id: 'C', label: 'menjerit'),
        QuizOption(id: 'D', label: 'memotong'),
      ],
      correctOptionIds: {'A'},
    ),
    QuizQuestion(
      id: 'q20',
      order: 20,
      title: 'Soalan 19 - MCQ Bergambar',
      prompt:
          'Lihat gambar di bawah. Pilih perkataan berimbuhan meN- yang paling sesuai berdasarkan situasi dalam gambar. Apakah tindakan yang dilakukan oleh murid itu?',
      level: QuizLevel.medium,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'memetik'),
        QuizOption(id: 'B', label: 'mengemas'),
        QuizOption(id: 'C', label: 'menari'),
        QuizOption(id: 'D', label: 'melukis'),
      ],
      correctOptionIds: {'A'},
      imageReferences: [
        'Gambar: Seorang murid sedang memetik bunga di taman sekolah',
      ],
    ),
    QuizQuestion(
      id: 'q21',
      order: 21,
      title: 'Soalan 20 - Seret ke Ruang',
      prompt:
          'Seret perkataan berimbuhan meN- ke ruang kosong dalam petikan berikut. Gunakan setiap perkataan sekali sahaja.',
      level: QuizLevel.medium,
      interactionType: QuizInteractionType.dragDrop,
      dragTargets: [
        'Kakak akan ______ pakaian yang telah kering.',
        'Saya pula akan ______ pokok bunga yang terdapat di halaman rumah.',
        'Ayah pula akan ______ kereta kesayangannya.',
      ],
      dragChoices: ['melipat', 'menyiram', 'mencuci'],
      dragAnswers: ['melipat', 'menyiram', 'mencuci'],
    ),
    QuizQuestion(
      id: 'q22',
      order: 22,
      title: 'Soalan Tambahan Sederhana 1',
      prompt:
          'Pilih perkataan berimbuhan awalan meN- yang paling sesuai untuk melengkapkan ayat berikut: Setiap pagi Sabtu, ibu akan membawa saya ke pasar untuk ______ sayur dan buah-buahan segar.',
      level: QuizLevel.medium,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'memetik'),
        QuizOption(id: 'B', label: 'membeli'),
        QuizOption(id: 'C', label: 'membawa'),
        QuizOption(id: 'D', label: 'menyusun'),
      ],
      correctOptionIds: {'B'},
    ),

    QuizQuestion(
      id: 'q23',
      order: 23,
      title: 'Soalan 21 - Tahap Tinggi',
      prompt:
          'Lengkapkan dialog berikut dengan perkataan berimbuhan awalan meN- yang paling sesuai. "Aiman, apa yang kamu buat itu?" "Oh, saya sedang ______ nota yang cikgu beri."',
      level: QuizLevel.hard,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'menonton'),
        QuizOption(id: 'B', label: 'menyalin'),
        QuizOption(id: 'C', label: 'mendaki'),
        QuizOption(id: 'D', label: 'menari'),
      ],
      correctOptionIds: {'B'},
    ),
    QuizQuestion(
      id: 'q24',
      order: 24,
      title: 'Soalan 22 - Isian Berganda',
      prompt:
          'Lengkapkan petikan berikut dengan perkataan berimbuhan awalan meN- yang paling sesuai. Gunakan setiap perkataan sekali sahaja.',
      level: QuizLevel.hard,
      interactionType: QuizInteractionType.dragDrop,
      dragTargets: [
        'Sebelum membuat kek, ibu akan ______ bahan-bahan kering seperti tepung dan gula.',
        'Selepas itu, beliau akan ______ semua bahan di dalam mangkuk besar.',
        'Apabila bahan-bahan telah diadun, ibu akan ______ adunan tersebut dengan cermat.',
      ],
      dragChoices: ['menapis', 'mengadun', 'membakar'],
      dragAnswers: ['menapis', 'mengadun', 'membakar'],
    ),
    QuizQuestion(
      id: 'q25',
      order: 25,
      title: 'Soalan 23 - MCQ Bergambar',
      prompt:
          'Lihat gambar di bawah. Pilih perkataan berimbuhan awalan meN- yang paling sesuai berdasarkan tindakan dalam gambar.',
      level: QuizLevel.hard,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'memanjat'),
        QuizOption(id: 'B', label: 'memasang'),
        QuizOption(id: 'C', label: 'menonton'),
        QuizOption(id: 'D', label: 'membungkus'),
      ],
      correctOptionIds: {'B'},
      imageReferences: [
        'Gambar: Seorang lelaki sedang memasang langsir menggunakan tangga dan batang besi',
      ],
    ),
    QuizQuestion(
      id: 'q26',
      order: 26,
      title: 'Soalan 24 - Seret Imbuhan',
      prompt:
          'Seret imbuhan awalan meN- yang paling sesuai ke hadapan kata dasar berikut. Tidak semua imbuhan boleh digunakan.',
      level: QuizLevel.hard,
      interactionType: QuizInteractionType.dragDrop,
      dragTargets: ['lintas', 'pandu', 'brek', 'kejut'],
      dragChoices: ['me-', 'mem-', 'men-', 'meng-', 'menge-', 'tiada'],
      dragAnswers: ['me-', 'mem-', 'tiada', 'menge-'],
      helperLines: ['Jawapan: melintas, memandu, brek, mengejut'],
    ),
    QuizQuestion(
      id: 'q27',
      order: 27,
      title: 'Soalan 25 - Ayat Konteks Panjang',
      prompt:
          'Dalam sesi tersebut, setiap kumpulan perlu menggunakan aplikasi khas untuk ______ data suhu dan kelembapan yang diperoleh daripada sensor.',
      level: QuizLevel.hard,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'memproses'),
        QuizOption(id: 'B', label: 'membungkus'),
        QuizOption(id: 'C', label: 'memadam'),
        QuizOption(id: 'D', label: 'menyusun'),
      ],
      correctOptionIds: {'A'},
    ),
    QuizQuestion(
      id: 'q28',
      order: 28,
      title: 'Soalan 26 - Betulkan Perkataan Salah',
      prompt:
          'Pilih perkataan berimbuhan awalan meN- yang betul bagi menggantikan perkataan salah: Sara telah mempinjam buku cerita itu daripada perpustakaan sekolah.',
      level: QuizLevel.hard,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'meminjam'),
        QuizOption(id: 'B', label: 'menyimpan'),
        QuizOption(id: 'C', label: 'mengambil'),
        QuizOption(id: 'D', label: 'mendapatkan'),
      ],
      correctOptionIds: {'A'},
      explanation: 'Bentuk yang betul ialah meminjam, bukan mempinjam.',
    ),
    QuizQuestion(
      id: 'q29',
      order: 29,
      title: 'Soalan 27 - Padanan Kontekstual',
      prompt:
          'Padankan perkataan berimbuhan awalan meN- yang paling sesuai untuk melengkapkan setiap ayat.',
      level: QuizLevel.hard,
      interactionType: QuizInteractionType.matching,
      matchingLeft: [
        'Tentera itu berjaya ______ bandar tersebut selepas pertempuran sengit.',
        'Adik sedang ______ botol plastik untuk projek kitar semula.',
        'Pelayan itu sibuk ______ pelanggan di restoran mewah itu.',
        'Dia suka ______ pakaian yang berwarna cerah ketika hujung minggu.',
      ],
      matchingChoices: ['mengitar', 'menawan', 'memakai', 'melayan'],
      matchingAnswers: ['menawan', 'mengitar', 'melayan', 'memakai'],
    ),
    QuizQuestion(
      id: 'q30',
      order: 30,
      title: 'Soalan 28 - Padanan Kontekstual',
      prompt:
          'Padankan perkataan berimbuhan awalan meN- yang paling sesuai untuk melengkapkan setiap ayat.',
      level: QuizLevel.hard,
      interactionType: QuizInteractionType.matching,
      matchingLeft: [
        'Suara merdu Aina ketika ______ lagu kebangsaan menarik perhatian semua.',
        'Dia terus ______ hadiah itu tanpa membaca kad ucapan.',
        'Penjaga gol itu pantas ______ bola yang menuju ke arah gawang.',
        'Kami perlu ______ senarai nama peserta sebelum mendaftar.',
      ],
      matchingChoices: ['membuka', 'menangkap', 'menyanyi', 'menyemak'],
      matchingAnswers: ['menyanyi', 'membuka', 'menangkap', 'menyemak'],
    ),
    QuizQuestion(
      id: 'q31',
      order: 31,
      title: 'Soalan 29 - MCQ',
      prompt:
          'Pilih perkataan berimbuhan awalan meN- yang paling sesuai untuk melengkapkan ayat berikut: Aminah ______ sehelai kertas untuk membuat origami.',
      level: QuizLevel.hard,
      interactionType: QuizInteractionType.singleChoice,
      options: [
        QuizOption(id: 'A', label: 'menggunting'),
        QuizOption(id: 'B', label: 'menulis'),
        QuizOption(id: 'C', label: 'membaca'),
        QuizOption(id: 'D', label: 'menari'),
      ],
      correctOptionIds: {'A'},
    ),
    QuizQuestion(
      id: 'q32',
      order: 32,
      title: 'Soalan 30 - Betulkan Kesalahan',
      prompt:
          'Cari perkataan berimbuhan awalan meN- yang salah dalam ayat di bawah dan betulkan: menbaca, memdengar, mengcari.',
      level: QuizLevel.hard,
      interactionType: QuizInteractionType.textInput,
      acceptableTextAnswers: ['membaca', 'mendengar', 'mencari'],
      helperLines: ['Taip jawapan dipisahkan dengan koma.'],
      explanation: 'Jawapan betul: membaca, mendengar, mencari.',
    ),
  ];
}
