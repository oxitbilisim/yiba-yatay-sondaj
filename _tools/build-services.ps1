param([string]$Root)
$utf8 = New-Object System.Text.UTF8Encoding $false
$domain = "http://yiba.oxit.net.tr"
New-Item -ItemType Directory -Force "$Root\hizmetler" | Out-Null
$preloader = [regex]::Match([System.IO.File]::ReadAllText("$Root\kurumsal.html", [System.Text.Encoding]::UTF8), '(?s)<div class="preloader".*?</div></div></div>').Value.Replace('src="assets/','src="../assets/')

$services = @(
  @{ slug="yonlendirilebilir-yatay-sondaj"; title="Yönlendirilebilir Yatay Sondaj"; icon="drill"; num="01";
     lead="Yolların, dere yataklarının ve yapıların altından, yüzeyi açmadan ve trafiği kesmeden kontrollü hat geçişi.";
     p1="Yönlendirilebilir yatay sondaj (HDD), altyapı borularının planlanan bir güzergâhta yer altından yönlendirilerek geçirilmesini sağlayan kazısız bir yöntemdir. Giriş ve çıkış noktası dışında kazı yapılmaz; pilot delgi, genişletme ve boru çekme aşamaları tek makine hattında tamamlanır.";
     p2="Doğalgaz, içme suyu, kanalizasyon, elektrik ve fiber optik hatlarında; karayolu, demiryolu, dere ve kanal geçişlerinde tercih edilir. Yiba, 2000'den bu yana farklı zemin ve mesafelerde yönlendirilebilir yatay sondaj uygulamaları gerçekleştirmektedir.";
     areas=@("Yol altı geçişleri","Dere ve kanal geçişleri","Doğalgaz hatları","İçme suyu hatları","Fiber optik ve telekom","Elektrik kabloları");
     cards=@(@("road","Trafik kesilmez","Yol kapanmaz, asfalt sökülmez; şehir yaşamı uygulama boyunca akmaya devam eder."),@("target","Hassas yönlendirme","Güzergâh yer altında izlenir ve yönlendirilir; mevcut hatlara zarar verilmez."),@("waves","Çevreye duyarlı","Daha az hafriyat, daha az makine hareketi, korunan peyzaj ve su yapıları."),@("bolt","Hızlı uygulama","Açık kazıya göre çok daha kısa sürede tamamlanır; sosyal maliyet düşer."));
     faq=@(@("Yönlendirilebilir yatay sondaj hangi zeminlerde uygulanır?","Kil, kum, çakıl, dolgu ve uygun kaya zeminlerde uygulanabilir. Zemin sınıfına göre matkap ucu, rayba ve sondaj sıvısı seçimi yapılır."),@("Hangi boru türleri çekilebilir?","HDPE, PE100, çelik ve koruma kılıf boruları çekilebilir. Boru çapı ve uzunluğu makine kapasitesine göre planlanır."),@("Uygulama ne kadar sürer?","Kısa yol altı geçişleri çoğunlukla günler içinde tamamlanır; süre geçiş uzunluğu, boru çapı ve zemin koşullarına bağlıdır.")) },
  @{ slug="yatay-delgi"; title="Yatay Delgi"; icon="drill"; num="02";
     lead="Boru veya kılıf geçişi için farklı zemin ve proje koşullarında planlanan yatay delgi uygulamaları.";
     p1="Yatay delgi; helezonlu (auger) ve yönlendirmeli sistemlerle, belirlenen kotta ve doğrultuda yatay bir delik açılarak boru ya da kılıf yerleştirilmesini kapsar. Kısa ve orta mesafeli geçişlerde, özellikle yük altındaki yol ve demiryolu kesitlerinde yaygın olarak kullanılır.";
     p2="Delgi çapı, uzunluğu ve zemin yapısı keşifte belirlenir; buna göre makine, delgi takımı ve kılıf borusu seçilir. Uygulama giriş ve çıkış çukurları arasında, yüzeye dokunmadan tamamlanır.";
     areas=@("Karayolu kesitleri","Demiryolu kesitleri","Sanayi tesisleri","OSB altyapıları","Kılıf boru yerleştirme");
     cards=@(@("layers","Kotta hassasiyet","Delgi, projede belirlenen kot ve doğrultuda sabit eğimle ilerler."),@("steel","Kılıf ile koruma","Çelik veya HDPE kılıf borular geçişi uzun yıllar korur."),@("road","Yük altında güvenli","Yol ve ray yükü altındaki kesitlerde açık kazıya güvenli alternatif."),@("gear","Doğru ekipman","Zemin ve çapa göre helezon ya da yönlendirmeli sistem seçimi."));
     faq=@(@("Yatay delgi ile yönlendirilebilir yatay sondaj arasındaki fark nedir?","Yatay delgi genellikle düz ve sabit eğimli kısa geçişlerde, yönlendirilebilir yatay sondaj ise yer altında yönlendirme gerektiren daha uzun ve eğrisel güzergâhlarda kullanılır."),@("Hangi çaplarda kılıf yerleştirilebilir?","Proje ihtiyacına göre küçük çaplı koruma borularından büyük çaplı çelik kılıflara kadar uygulama yapılabilir; kesin aralık keşif sonrası belirlenir."),@("Giriş ve çıkış çukurları ne kadar alan ister?","Delgi çapı ve makine boyutuna göre değişir; dar şehir içi alanlara uygun kompakt sistemler de kullanılır.")) },
  @{ slug="yatay-sondaj-borulari"; title="Yatay Sondaj Boruları"; icon="pipe"; num="03";
     lead="Uygulamaya göre seçilen HDPE, PE100, çelik ve koruma kılıf borularıyla hat geçişinin proje ölçülerine uygun hazırlanması.";
     p1="Yatay sondajda boru seçimi, geçişin ömrünü belirler. Çekme kuvveti, zemin yükü, taşınacak akışkan veya kablo türü ve güzergâh eğriliği dikkate alınarak boru malzemesi, çapı ve et kalınlığı belirlenir.";
     p2="Boru hattı yüzeyde kaynak veya bağlantı ile hazırlanır, çekme başlığı ve fırdöndü ile delgi takımına bağlanarak genişletilmiş delikten tek seferde çekilir. Yiba, boru tedarikinde ve hazırlığında projeye özel çözüm sunar.";
     areas=@("HDPE / PE100 borular","Çelik kılıf borular","Koruma ve kablo boruları","Doğalgaz hattı boruları","Su ve kanalizasyon boruları");
     cards=@(@("pipe","Doğru malzeme","Akışkan, basınç ve zemin yüküne göre HDPE, PE100 veya çelik seçimi."),@("target","Proje ölçüsüne uygun","Çap, et kalınlığı ve uzunluk proje verileriyle doğrulanır."),@("gear","Yüzeyde hazırlık","Kaynak ve bağlantılar yüzeyde kontrollü koşullarda yapılır."),@("check","Tek seferde çekim","Hazırlanan hat genişletilmiş delikten kesintisiz çekilir."));
     faq=@(@("Boru tedarikini siz mi yapıyorsunuz?","Proje ihtiyacına göre boru tedariki ve hazırlığı tarafımızca yapılabilir ya da sahibi tarafından sağlanan borular uygulanır."),@("Hangi boru çapları çekilebilir?","Makine kapasitesi ve zemin koşullarına göre değişir; kesin aralık keşif sonrasında belirlenir."),@("Çelik boru mu HDPE mi tercih edilmeli?","Yük altındaki kesitlerde ve kılıf ihtiyacında çelik; esneklik ve korozyon direnci istenen hatlarda HDPE/PE100 öne çıkar.")) },
  @{ slug="boru-surme-ve-itme"; title="Boru Sürme ve İtme"; icon="pipe"; num="04";
     lead="Açık kazının uygun olmadığı alanlarda boru hatlarının kontrollü sürülmesi ve itilmesiyle altyapı geçişi.";
     p1="Boru sürme (pipe jacking) ve itme yöntemlerinde boru, giriş çukurundan hidrolik güçle zemine itilir; zemin boru içinden helezon veya kazıcı başlıkla alınır. Yüzeyde açılma olmadan, yük altındaki kesitlerde güvenli geçiş sağlar.";
     p2="Özellikle karayolu, demiryolu ve sanayi sahalarında, hassas kot ve doğrultu gerektiren geçişlerde tercih edilir. Yiba, boru çapına ve geçiş uzunluğuna uygun sürme ünitesiyle uygulama yapar.";
     areas=@("Karayolu altı geçişler","Demiryolu altı geçişler","Sanayi ve OSB sahaları","Büyük çaplı kılıf geçişleri");
     cards=@(@("steel","Yük altında dayanım","Çelik kılıf, üstteki yol ve ray yüküne karşı hattı korur."),@("target","Sabit kot ve doğrultu","Hidrolik itme ile hassas, düz geçiş."),@("road","Yüzey açılmaz","Trafik ve yüzey kullanımı etkilenmez."),@("gear","Projeye özel ünite","Boru çapı ve mesafeye uygun sürme ekipmanı."));
     faq=@(@("Boru sürme hangi çaplarda uygulanır?","Küçük çaplı koruma borularından büyük çaplı çelik kılıflara kadar uygulanabilir; kesin aralık keşifte belirlenir."),@("Yönlendirilebilir sondaja göre ne zaman tercih edilir?","Düz, kısa ve hassas kot gerektiren, yük altındaki geçişlerde boru sürme; uzun ve eğrisel güzergâhlarda yönlendirilebilir sondaj öne çıkar."),@("Giriş çukuru ne kadar derin olur?","Geçiş kotuna göre değişir; çukur iksa ile güvenli hale getirilir.")) },
  @{ slug="celik-boru-surme"; title="Çelik Boru Sürme"; icon="steel"; num="05";
     lead="Yük ve saha koşulları dikkate alınarak çelik kılıf boruların geçiş güzergâhına uygun şekilde sürülmesi.";
     p1="Çelik boru sürme, özellikle karayolu ve demiryolu altındaki geçişlerde, hattı koruyan çelik kılıfın zemine kademeli olarak itilmesiyle yapılır. Kılıf içine daha sonra taşıyıcı boru, kablo veya hat yerleştirilir.";
     p2="Çelik kılıfın et kalınlığı, çapı ve kaynak detayları ilgili kurum şartnamelerine göre belirlenir. Uygulama giriş ve çıkış çukurları arasında, yüzeyi açmadan tamamlanır.";
     areas=@("Karayolu altı çelik kılıf","Demiryolu altı çelik kılıf","Doğalgaz hatları kılıfı","Enerji kabloları kılıfı");
     cards=@(@("steel","Dayanıklı kılıf","Çelik kılıf hattı yük, darbe ve zemin hareketinden korur."),@("check","Şartnameye uygun","Et kalınlığı ve kaynak detayları kurum şartlarına göre."),@("road","Kurum geçişlerinde tercih","Karayolu ve demiryolu idarelerinin kabul ettiği yöntem."),@("gear","Kontrollü itme","Hidrolik ünite ile kademeli, hassas ilerleme."));
     faq=@(@("Çelik kılıf içine hangi hatlar yerleştirilir?","Doğalgaz, su, enerji kabloları ve fiber optik hatlar kılıf içinde korunarak geçirilir."),@("Kaynak işleri sahada mı yapılır?","Evet, kılıf boyları giriş çukurunda sürme sırasında kaynakla eklenir."),@("Hangi kurumların izni gerekir?","Karayolu ve demiryolu geçişlerinde ilgili idarenin izni ve şartname uyumu gerekir; süreçte destek veriyoruz.")) },
  @{ slug="altyapi-boru-gecisleri"; title="Altyapı Boru Geçişleri"; icon="layers"; num="06";
     lead="Doğalgaz, su, kanalizasyon, enerji ve haberleşme hatlarına yönelik boru geçişi uygulamalarının koordinasyonu ve uygulaması.";
     p1="Altyapı boru geçişleri; farklı kurumlara ait hatların yol, dere, demiryolu ve yapı altından güvenli biçimde geçirilmesini kapsar. Her hat türünün teknik şartı farklıdır: doğalgazda kılıf ve derinlik, suda eğim, fiberde koruma borusu öne çıkar.";
     p2="Yiba, projenin başından itibaren kurum, yüklenici ve saha ekibi arasında koordinasyon sağlar; uygun kazısız yöntemi belirler ve uygular.";
     areas=@("Doğalgaz dağıtım hatları","İçme suyu ve kanalizasyon","Elektrik dağıtım kabloları","Fiber optik ve telekom","Sulama hatları");
     cards=@(@("flame","Doğalgaz","Kurum şartnamesine uygun kılıf ve derinlikte geçiş."),@("droplet","Su ve kanalizasyon","Eğim ve kot hassasiyetiyle hat geçişi."),@("bolt","Enerji","Kablo koruma borularının yol altı geçişleri."),@("fiber","Fiber optik","Koruyucu kılıf ile kesintisiz haberleşme altyapısı."));
     faq=@(@("Birden fazla hat aynı geçişte geçirilebilir mi?","Uygun çapta kılıf veya çoklu boru çekimiyle aynı güzergâhta birden fazla hat geçirilebilir."),@("Kurum izinlerinde destek veriyor musunuz?","Evet, geçiş için gerekli teknik dosya ve kurum süreçlerinde deneyimimizle destek oluyoruz."),@("Mevcut altyapıya zarar riski nasıl yönetilir?","Keşifte mevcut hatlar belirlenir, güzergâh buna göre planlanır ve yer altında izlenerek uygulanır.")) },
  @{ slug="kazisiz-teknoloji"; title="Kazısız Teknoloji Uygulamaları"; icon="layers"; num="07";
     lead="Yüzeydeki trafik, peyzaj ve günlük yaşam üzerindeki etkiyi azaltan kazısız altyapı teknolojileri.";
     p1="Kazısız teknolojiler (trenchless), altyapı hatlarının yüzeyi açmadan yer altından geçirilmesini, yenilenmesini veya onarılmasını kapsayan yöntemler bütünüdür. Yönlendirilebilir yatay sondaj, boru sürme ve yatay delgi bu ailenin en yaygın üyeleridir.";
     p2="Yiba, projenin zemin, mesafe ve hat gereksinimlerine göre en uygun kazısız yöntemi belirler; böylece hem süre hem de sosyal maliyet en aza iner.";
     areas=@("Şehir içi altyapı yenileme","Tarihi ve korunan alanlar","Yoğun trafikli caddeler","Park ve yeşil alanlar");
     cards=@(@("road","Minimum yüzey etkisi","Giriş ve çıkış noktası dışında yüzeye dokunulmaz."),@("waves","Çevre dostu","Daha az hafriyat, gürültü ve emisyon."),@("bolt","Daha kısa süre","Açık kazıya göre çok daha hızlı tamamlanır."),@("target","Doğru yöntem seçimi","HDD, boru sürme veya delgi: projeye göre karar."));
     faq=@(@("Kazısız teknoloji her projede uygulanabilir mi?","Çoğu projede uygulanabilir; uygunluk zemin, mesafe ve hat türüne göre keşifte değerlendirilir."),@("Açık kazıya göre maliyeti nasıl?","Doğrudan maliyet yakın olsa da trafik, yüzey onarımı ve süre kayıpları hesaba katıldığında toplam maliyet genellikle daha düşüktür."),@("Hangi yöntemi seçeceğinize nasıl karar veriyorsunuz?","Zemin yapısı, geçiş uzunluğu, boru çapı, kot hassasiyeti ve saha erişimi birlikte değerlendirilir.")) },
  @{ slug="yol-alti-gecis"; title="Yol Altı Geçiş Uygulamaları"; icon="road"; num="08";
     lead="Karayolu ve şehir içi yol altı geçişlerinde trafiği kesmeden, asfaltı bozmadan altyapı geçişi.";
     p1="Yol altı geçişleri, yatay sondajın en sık uygulandığı alandır. Cadde, bulvar ve karayolu kesitlerinde açık kazı; trafik kesintisi, asfalt onarımı ve güvenlik riski demektir. Yatay sondaj ile hat yolun altından, yüzeye dokunmadan geçirilir.";
     p2="Karayolları Genel Müdürlüğü ve belediyelerin geçiş şartları (derinlik, kılıf, geri dolgu) projeye işlenir; uygulama gece veya gündüz, trafik akışını etkilemeden yapılır.";
     areas=@("Şehir içi cadde ve bulvarlar","Karayolu kesitleri","Kavşak ve refüj geçişleri","Otoyol bağlantı yolları");
     cards=@(@("road","Trafik akmaya devam eder","Yol kapatma, şerit daraltma ve asfalt onarımı gerekmez."),@("steel","Kılıflı güvenli geçiş","Gerekli kesitlerde çelik kılıf ile hat korunur."),@("check","Kurum şartlarına uyum","KGM ve belediye şartnamelerine uygun derinlik ve detay."),@("bolt","Kısa sürede teslim","Çoğu şehir içi geçiş günler içinde tamamlanır."));
     faq=@(@("Yol altı geçiş için izin gerekir mi?","Evet; karayolu veya belediye yolu olmasına göre ilgili idareden geçiş izni alınır. Teknik dosya hazırlığında destek veriyoruz."),@("Uygulama sırasında trafik etkilenir mi?","Giriş ve çıkış çukurları yol dışında konumlandırılır; trafik akışı etkilenmez."),@("Minimum derinlik ne kadar?","İdarenin şartnamesine ve yol kesitine göre belirlenir; genellikle yol tabanının yeterince altında planlanır.")) },
  @{ slug="demiryolu-alti-gecis"; title="Demiryolu Altı Geçiş Uygulamaları"; icon="rail"; num="09";
     lead="Demiryolu koridorlarında hat emniyetini bozmadan, ilgili kurum şartlarına uygun planlı altyapı geçişleri.";
     p1="Demiryolu altı geçişleri, ray hattının ve balast yapısının korunmasını gerektiren hassas uygulamalardır. Çelik kılıf ile boru sürme veya yönlendirilebilir yatay sondaj, hat emniyetini bozmadan geçişi mümkün kılar.";
     p2="TCDD ve ilgili işletmecilerin teknik şartları (derinlik, kılıf, oturma kontrolü) projeye işlenir; uygulama planı tren trafiğine göre koordine edilir.";
     areas=@("Konvansiyonel demiryolu hatları","Yüksek hızlı tren koridorları","Liman ve sanayi demiryolları","İstasyon çevresi altyapıları");
     cards=@(@("rail","Hat emniyeti","Ray ve balast yapısı korunur, oturma riski kontrol altında tutulur."),@("steel","Çelik kılıf","Ray yükü altında hattı koruyan kılıf sürme."),@("check","TCDD şartlarına uyum","Kurum şartnamesine uygun derinlik, kılıf ve izleme."),@("target","Planlı koordinasyon","Tren trafiğiyle uyumlu çalışma planı."));
     faq=@(@("Demiryolu geçişi için hangi izinler gerekir?","TCDD ve ilgili hat işletmecisinin teknik onayı ve geçiş izni gerekir; süreçte deneyimimizle destek oluyoruz."),@("Tren trafiği durdurulur mu?","Kazısız yöntemlerle çoğu geçiş tren trafiği durdurulmadan yapılır; plan kurumla koordine edilir."),@("Oturma riski nasıl önlenir?","Uygun kılıf, kontrollü ilerleme ve gerektiğinde izleme ölçümleriyle yüzey oturması engellenir.")) },
  @{ slug="dere-ve-kanal-alti-gecis"; title="Dere ve Kanal Altı Geçişleri"; icon="waves"; num="10";
     lead="Su yapılarının ve çevresinin korunmasına özen gösterilerek dere ve kanal altından yapılan altyapı geçişleri.";
     p1="Dere, kanal ve sulama yapılarının altından geçişlerde açık kazı; su akışını bozar, yatağı tahrip eder ve mevsimsel kısıtlara takılır. Yönlendirilebilir yatay sondaj ile hat, su yatağının yeterince altından, yatağa dokunmadan geçirilir.";
     p2="DSİ ve ilgili idarelerin şartları (derinlik, koruma, geçiş noktaları) projeye işlenir; uygulama kuru veya akışlı dönemde, su yapısı etkilenmeden tamamlanır.";
     areas=@("Dere ve çay geçişleri","Sulama kanalları","Drenaj ve tahliye kanalları","Göl ve gölet kıyı geçişleri");
     cards=@(@("waves","Su yatağı korunur","Yatağa, şev ve kıyı yapısına dokunulmaz."),@("droplet","Akış kesilmez","Uygulama su akışını etkilemeden yapılır."),@("check","DSİ şartlarına uyum","Kurum şartnamesine uygun derinlik ve koruma."),@("layers","Uzun ömürlü hat","Yatak hareketlerinden etkilenmeyen güvenli derinlik."));
     faq=@(@("Dere altı geçiş için hangi izin gerekir?","DSİ veya ilgili su idaresinin geçiş izni ve teknik onayı gerekir."),@("Su akarken uygulama yapılabilir mi?","Evet; kazısız yöntemde su yatağına girilmediği için akış varken de uygulama yapılabilir."),@("Hangi derinlikten geçilir?","Yatak kotu, taşkın ve oyulma riskine göre idarenin belirlediği güvenli derinlikten geçilir.")) },
  @{ slug="ozel-gecis-projeleri"; title="Özel Geçiş Projeleri"; icon="target"; num="11";
     lead="Standart uygulamalardan farklı saha kısıtları ve zorlu zemin koşulları için projeye özel yöntem ve ekipman planlaması.";
     p1="Her geçiş standart değildir: dar şehir içi alanlar, kayalık zeminler, uzun mesafeler, büyük çaplar veya birden fazla hattın aynı güzergâhta geçmesi özel çözüm ister. Bu projelerde yöntem, ekipman ve takım dizilimi sıfırdan planlanır.";
     p2="Yiba, 2000'den bu yana edindiği tecrübeyle özel geçiş projelerinde keşiften teslimata tek ekip olarak çalışır; gerektiğinde farklı kazısız yöntemleri aynı projede birleştirir.";
     areas=@("Uzun mesafeli geçişler","Büyük çaplı borular","Kayalık ve karışık zeminler","Dar şehir içi sahalar","Çoklu hat geçişleri");
     cards=@(@("target","Projeye özel planlama","Yöntem ve ekipman sahanın koşullarına göre seçilir."),@("gear","Özel takım dizilimi","Zemin ve çapa uygun uç, rayba ve çekme planı."),@("layers","Yöntem kombinasyonu","Gerektiğinde HDD, boru sürme ve delgi birlikte."),@("check","Tek ekip, tek sorumluluk","Keşiften teslimata aynı ekip, net sorumluluk."));
     faq=@(@("Zorlu zeminde uygulama mümkün mü?","Kaya ve karışık zeminlerde uygun uç ve rayba seçimiyle uygulama yapılabilir; uygunluk keşifte belirlenir."),@("Çok uzun mesafeler için ne yapıyorsunuz?","Makine kapasitesi, sondaj sıvısı yönetimi ve ara çıkış noktalarıyla uzun mesafeler kademeli planlanır."),@("Teklif süreci nasıl işler?","Proje verileri ve saha keşfi sonrasında yöntem belirlenir ve projeye özel teklif hazırlanır.")) }
)

$template = @'
<!doctype html>
<html lang="tr">
<head>
  <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{TITLE}} | Hizmetlerimiz - Yiba Yatay Sondaj</title>
  <meta name="description" content="{{TITLE}}: {{LEAD}} Yiba Yatay Sondaj, Ankara merkezli, 81 ilde hizmet.">
  <link rel="canonical" href="{{DOMAIN}}/hizmetler/{{SLUG}}">
  <meta property="og:title" content="{{TITLE}} | Yiba Yatay Sondaj">
  <meta property="og:description" content="{{LEAD}}">
  <meta property="og:image" content="{{DOMAIN}}/assets/images/yiba-logo.png">
  <meta property="og:url" content="{{DOMAIN}}/hizmetler/{{SLUG}}">
  <meta property="og:type" content="website">
  <meta property="og:locale" content="tr_TR">
  <link rel="icon" href="../assets/images/favicon.svg" type="image/svg+xml"><link rel="stylesheet" href="../assets/site.css?v=202610161437"><script src="../assets/site.js?v=202610161437" defer></script>
  <script type="application/ld+json">{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"{{TITLE}}","serviceType":"{{TITLE}}","url":"{{DOMAIN}}/hizmetler/{{SLUG}}","provider":{"@type":"HomeAndConstructionBusiness","name":"Yiba Yatay Sondaj","telephone":"+903122714747","url":"{{DOMAIN}}/"},"areaServed":"Türkiye"},{"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Ana Sayfa","item":"{{DOMAIN}}/"},{"@type":"ListItem","position":2,"name":"Hizmetlerimiz","item":"{{DOMAIN}}/hizmetler"},{"@type":"ListItem","position":3,"name":"{{TITLE}}","item":"{{DOMAIN}}/hizmetler/{{SLUG}}"}]},{"@type":"FAQPage","mainEntity":[{{FAQ_LD}}]}]}</script>
</head>
<body data-page="services">
  {{PRELOADER}}
  <div id="site-header"></div>
  <main>
    <section class="page-hero" style="background-image:url('../assets/images/banner.jpg')"><div class="container page-hero-content"><p class="eyebrow eyebrow-pill eyebrow-pill-dark" data-icon="bolt">Hizmetlerimiz · {{NUM}}</p><h1>{{TITLE}}</h1><div class="breadcrumbs"><a href="../">Ana Sayfa</a><span>/</span><a href="../hizmetler">Hizmetlerimiz</a><span>/</span> {{TITLE}}</div></div></section>

    <section class="section-pad about-section corp-page service-page">
      <div class="container service-detail-grid">
        <div class="service-media">
          <div class="service-media-frame"><img src="../assets/images/placeholder.svg" alt="{{TITLE}} uygulama görseli (eklenecek)"></div>
          <div class="service-highlights">
            <div><span class="service-highlight-icon" data-icon="road"></span><strong>Yüzey açılmaz</strong><small>Trafik ve peyzaj korunur</small></div>
            <div><span class="service-highlight-icon" data-icon="target"></span><strong>Hassas güzergâh</strong><small>Kot ve doğrultu kontrolü</small></div>
            <div><span class="service-highlight-icon" data-icon="check"></span><strong>Keşif sonrası teklif</strong><small>Projeye özel yöntem</small></div>
          </div>
        </div>
        <div class="service-copy">
          <p class="eyebrow eyebrow-pill" data-icon="{{ICON}}">{{TITLE}}</p>
          <h2>{{TITLE}} <em>nedir, nerede kullanılır?</em></h2>
          <p class="about-lead">{{LEAD}}</p>
          <p class="about-text">{{P1}}</p>
          <p class="about-text">{{P2}}</p>
          <div class="service-areas"><span>Uygulama alanları</span>{{AREAS}}</div>
          <div class="intro-actions"><a class="button button-dark" href="../iletisim">Bu hizmet için teklif alın <span>↗︎</span></a><a class="text-link" href="../hizmetler">Tüm hizmetlerimiz <span>↗︎</span></a></div>
        </div>
      </div>
    </section>

    <section class="section-pad section-soft corp-cards-section corp-page-cards">
      <div class="container">
        <div class="sectors-head"><p class="eyebrow eyebrow-pill" data-icon="bolt">Neden Yiba?</p><h2>{{TITLE}} için <em>avantajlarımız.</em></h2></div>
        <div class="corp-cards corp-cards-4 corp-cards-compact">{{CARDS}}</div>
      </div>
    </section>


    <section class="section-pad corp-page">
      <div class="container service-faq-grid">
        <div><p class="eyebrow eyebrow-pill" data-icon="bolt">Sık sorulan sorular</p><h2>{{TITLE}} hakkında <em>merak edilenler.</em></h2><div class="corp-links"><span>Diğer hizmetler</span>{{OTHERS}}</div></div>
        <div class="city-faq">{{FAQ}}</div>
      </div>
    </section>

  </main>
  <div id="site-footer"></div>
</body>
</html>
'@

$count = 0
foreach ($sv in $services) {
  $cards = ($sv.cards | ForEach-Object { "<article><span class=`"corp-card-icon`" data-icon=`"$($_[0])`"></span><h3>$($_[1])</h3><p>$($_[2])</p></article>" }) -join ""
  $areas = ($sv.areas | ForEach-Object { "<a href=`"../sektorler`">$_</a>" }) -join ""
  $others = ($services | Where-Object { $_.slug -ne $sv.slug } | Select-Object -First 6 | ForEach-Object { "<a href=`"$($_.slug)`">$($_.title)</a>" }) -join ""
  $faq = ($sv.faq | ForEach-Object { "<details><summary>$($_[0])</summary><p>$($_[1])</p></details>" }) -join ""
  $faqLd = ($sv.faq | ForEach-Object { '{"@type":"Question","name":"' + $_[0].Replace('"','\"') + '","acceptedAnswer":{"@type":"Answer","text":"' + $_[1].Replace('"','\"') + '"}}' }) -join ","
  $html = $template.Replace('{{TITLE}}',$sv.title).Replace('{{SLUG}}',$sv.slug).Replace('{{DOMAIN}}',$domain).Replace('{{PRELOADER}}',$preloader).Replace('{{NUM}}',$sv.num).Replace('{{ICON}}',$sv.icon).Replace('{{LEAD}}',$sv.lead).Replace('{{P1}}',$sv.p1).Replace('{{P2}}',$sv.p2).Replace('{{AREAS}}',$areas).Replace('{{CARDS}}',$cards).Replace('{{OTHERS}}',$others).Replace('{{FAQ}}',$faq).Replace('{{FAQ_LD}}',$faqLd)
  $photo = "$Root\assets\images\hizmetler\$($sv.slug).jpg"
  if (Test-Path $photo) { $html = $html.Replace('<img src="../assets/images/placeholder.svg" alt="' + $sv.title + ' uygulama görseli (eklenecek)">', '<img src="../assets/images/hizmetler/' + $sv.slug + '.jpg" alt="' + $sv.title + ' saha uygulaması">') }
  [System.IO.File]::WriteAllText("$Root\hizmetler\$($sv.slug).html", $html, $utf8)
  $count++
}
"generated service pages: $count"
