param([string]$Root = "C:\Users\Lenovo\Desktop\yıbayataysondaj")

$utf8 = New-Object System.Text.UTF8Encoding $false
$domain = "http://yiba.oxit.net.tr"

$regions = [ordered]@{
  "Marmara Bölgesi" = @(
    @("İstanbul","istanbul"),@("Edirne","edirne"),@("Kırklareli","kirklareli"),@("Tekirdağ","tekirdag"),@("Çanakkale","canakkale"),
    @("Balıkesir","balikesir"),@("Bursa","bursa"),@("Yalova","yalova"),@("Kocaeli","kocaeli"),@("Sakarya","sakarya"),@("Bilecik","bilecik"))
  "Ege Bölgesi" = @(
    @("İzmir","izmir"),@("Aydın","aydin"),@("Muğla","mugla"),@("Manisa","manisa"),@("Denizli","denizli"),@("Uşak","usak"),@("Kütahya","kutahya"),@("Afyonkarahisar","afyonkarahisar"))
  "Akdeniz Bölgesi" = @(
    @("Antalya","antalya"),@("Isparta","isparta"),@("Burdur","burdur"),@("Mersin","mersin"),@("Adana","adana"),@("Osmaniye","osmaniye"),@("Hatay","hatay"),@("Kahramanmaraş","kahramanmaras"))
  "İç Anadolu Bölgesi" = @(
    @("Ankara","ankara"),@("Eskişehir","eskisehir"),@("Konya","konya"),@("Karaman","karaman"),@("Aksaray","aksaray"),@("Niğde","nigde"),@("Nevşehir","nevsehir"),
    @("Kayseri","kayseri"),@("Kırşehir","kirsehir"),@("Kırıkkale","kirikkale"),@("Çankırı","cankiri"),@("Yozgat","yozgat"),@("Sivas","sivas"))
  "Karadeniz Bölgesi" = @(
    @("Zonguldak","zonguldak"),@("Bartın","bartin"),@("Karabük","karabuk"),@("Bolu","bolu"),@("Düzce","duzce"),@("Kastamonu","kastamonu"),@("Sinop","sinop"),
    @("Samsun","samsun"),@("Çorum","corum"),@("Amasya","amasya"),@("Tokat","tokat"),@("Ordu","ordu"),@("Giresun","giresun"),@("Gümüşhane","gumushane"),
    @("Trabzon","trabzon"),@("Rize","rize"),@("Artvin","artvin"),@("Bayburt","bayburt"))
  "Doğu Anadolu Bölgesi" = @(
    @("Erzurum","erzurum"),@("Erzincan","erzincan"),@("Kars","kars"),@("Ardahan","ardahan"),@("Iğdır","igdir"),@("Ağrı","agri"),@("Van","van"),
    @("Hakkari","hakkari"),@("Bitlis","bitlis"),@("Muş","mus"),@("Bingöl","bingol"),@("Tunceli","tunceli"),@("Elazığ","elazig"),@("Malatya","malatya"))
  "Güneydoğu Anadolu Bölgesi" = @(
    @("Gaziantep","gaziantep"),@("Kilis","kilis"),@("Şanlıurfa","sanliurfa"),@("Adıyaman","adiyaman"),@("Diyarbakır","diyarbakir"),@("Mardin","mardin"),
    @("Batman","batman"),@("Siirt","siirt"),@("Şırnak","sirnak"))
}

$template = @'
<!doctype html>
<html lang="tr">
<head>
  <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{NAME}} Yatay Sondaj | Kazısız Altyapı ve Yatay Delgi - Yiba</title>
  <meta name="description" content="{{NAME}} yatay sondaj, yatay delgi ve boru geçişi hizmetleri. Yiba, {{NAME}} ilinde ve {{REGION}} genelinde kazısız altyapı projelerini saha ve proje koşullarına göre değerlendirir. 0312 271 47 47">
  <link rel="canonical" href="{{DOMAIN}}/hizmet-bolgeleri/{{SLUG}}-yatay-sondaj.html">
  <meta property="og:title" content="{{NAME}} Yatay Sondaj | Yiba Yatay Sondaj">
  <meta property="og:description" content="{{NAME}} ilinde yönlendirilebilir yatay sondaj, boru sürme ve kazısız altyapı geçişleri için Yiba ekibiyle görüşün.">
  <meta property="og:image" content="{{DOMAIN}}/assets/images/yiba-logo.png">
  <meta property="og:url" content="{{DOMAIN}}/hizmet-bolgeleri/{{SLUG}}-yatay-sondaj.html">
  <meta property="og:type" content="website">
  <link rel="icon" href="../assets/images/favicon.svg" type="image/svg+xml"><link rel="stylesheet" href="../assets/site.css"><script src="../assets/site.js" defer></script>
  <script type="application/ld+json">{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"{{NAME}} Yatay Sondaj","serviceType":"Yönlendirilebilir yatay sondaj ve kazısız altyapı","url":"{{DOMAIN}}/hizmet-bolgeleri/{{SLUG}}-yatay-sondaj.html","provider":{"@type":"HomeAndConstructionBusiness","name":"Yiba Yatay Sondaj","telephone":"+903122714747","email":"yibayataysondaj2@gmail.com","url":"{{DOMAIN}}/","address":{"@type":"PostalAddress","streetAddress":"Yeşilova Mah. 4023. Cad. Ser Tower No:1/21","addressLocality":"Etimesgut","addressRegion":"Ankara","addressCountry":"TR"}},"areaServed":{"@type":"AdministrativeArea","name":"{{NAME}}"}},{"@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Ana Sayfa","item":"{{DOMAIN}}/"},{"@type":"ListItem","position":2,"name":"Hizmet Bölgeleri","item":"{{DOMAIN}}/hizmet-bolgeleri.html"},{"@type":"ListItem","position":3,"name":"{{NAME}} Yatay Sondaj","item":"{{DOMAIN}}/hizmet-bolgeleri/{{SLUG}}-yatay-sondaj.html"}]},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"{{NAME}} ilinde yatay sondaj hizmeti veriyor musunuz?","acceptedAnswer":{"@type":"Answer","text":"Evet. Yiba Yatay Sondaj, Ankara merkezli ekibiyle {{NAME}} dahil Türkiye'nin 81 ilinde yönlendirilebilir yatay sondaj ve kazısız altyapı projelerini proje bazında değerlendirir."}},{"@type":"Question","name":"{{NAME}} yatay sondaj fiyatı nasıl belirlenir?","acceptedAnswer":{"@type":"Answer","text":"Fiyat; geçiş uzunluğu, boru çapı ve türü, zemin koşulları, derinlik ve saha erişimi gibi verilere göre belirlenir. Proje bilgilerini paylaştığınızda size özel teklif hazırlanır."}},{"@type":"Question","name":"Hangi altyapı hatları için yatay sondaj yapılabilir?","acceptedAnswer":{"@type":"Answer","text":"Doğalgaz, içme suyu, kanalizasyon, elektrik, fiber optik ve telekomünikasyon hatları ile çelik kılıf boru geçişleri için yatay sondaj ve boru sürme uygulanabilir."}}]}]}</script>
</head>
<body data-page="area-city">
  <div class="preloader" aria-hidden="true"><div class="preloader-inner"><span class="preloader-ring"></span><img src="../assets/images/yiba-logo-white.png" alt=""><div class="preloader-bar"><span></span></div></div></div>
  <div id="site-header"></div>
  <main>
    <section class="page-hero" style="background-image:url('../assets/images/banner.jpg')"><div class="container page-hero-content"><p class="eyebrow eyebrow-pill eyebrow-pill-dark" data-icon="bolt">{{NAME}} ve {{REGION}}</p><h1>{{NAME}} Yatay Sondaj <em>hizmetleri.</em></h1><div class="breadcrumbs"><a href="../index.html">Ana Sayfa</a><span>/</span><a href="../hizmet-bolgeleri.html">Hizmet Bölgeleri</a><span>/</span>{{NAME}} Yatay Sondaj</div></div></section>

    <section class="section-pad"><div class="container city-content">
      <p class="eyebrow eyebrow-pill" data-icon="bolt">Türkiye genelinde hizmet</p>
      <h2>{{NAME}} yatay sondaj ve<br><em>kazısız altyapı hizmeti.</em></h2>
      <p>{{NAME}} yatay sondaj hizmeti, altyapı hatlarının mevcut yollar, ulaşım koridorları ve yerleşim alanları üzerindeki etkisini en aza indiren kazısız bir uygulama yaklaşımı sunar. Yol kapatmadan, asfaltı sökmeden ve yüzeydeki yaşamı kesintiye uğratmadan borular zemin altından kontrollü biçimde geçirilir.</p>
      <p>Yiba Yatay Sondaj, 2000 yılından bu yana edindiği tecrübeyle {{NAME}} ve {{REGION}} genelindeki projelerde geçiş güzergâhını, zemin koşullarını ve hat gereksinimlerini birlikte değerlendirir. Yönlendirilebilir yatay sondaj, yatay delgi, boru sürme ve altyapı boru geçişleri; yol altı, demiryolu altı, dere ve kanal geçişleri için uygulanabilen hizmetlerimiz arasındadır.</p>

      <div class="city-service-boxes">
        <a href="../hizmetler/yonlendirilebilir-yatay-sondaj.html">Yönlendirilebilir yatay sondaj <span>↗</span></a>
        <a href="../hizmetler/boru-surme-ve-itme.html">Boru sürme ve çelik boru itme <span>↗</span></a>
        <a href="../hizmetler/yol-alti-gecis.html">Yol, demiryolu ve kanal altı geçişleri <span>↗</span></a>
      </div>

      <h2>{{NAME}} ilinde hangi projelerde<br><em>yatay sondaj uygulanır?</em></h2>
      <p>Doğalgaz dağıtım hatları, içme suyu ve kanalizasyon şebekeleri, elektrik dağıtım kabloları, fiber optik ve telekomünikasyon altyapısı, sulama hatları ile sanayi tesislerinin boru geçişleri {{NAME}} ilinde en sık karşılaşılan uygulama alanlarıdır. Karayolu, demiryolu, dere, kanal ve kalabalık şehir içi caddelerin altından geçişlerde açık kazı yerine yatay sondaj tercih edilerek hem süre hem de çevresel etki azaltılır.</p>

      <div class="city-highlight">
        <strong>Merkez</strong><span>Ankara / Etimesgut ofisimizden {{NAME}} dahil 81 ile saha ekibi ve ekipman sevkiyatı planlanır.</span>
        <strong>Bölge</strong><span>{{NAME}} ile birlikte {{REGION}} içindeki {{NEARBY_NAMES}} illerinde de aynı ekip ve makine parkıyla hizmet veriyoruz.</span>
        <strong>Yöntem</strong><span>Uygunluk ve yöntem, proje verileri ile saha koşulları incelendikten sonra belirlenir; kesin teklif keşif sonrasında hazırlanır.</span>
      </div>

      <h2>{{NAME}} yatay sondaj projesi<br><em>nasıl ilerler?</em></h2>
      <div class="city-steps">
        <div><span>01</span><strong>Proje bilgisi</strong><p>Konum, güzergâh, tahmini geçiş uzunluğu, boru çapı ve hat türünü bizimle paylaşırsınız.</p></div>
        <div><span>02</span><strong>Keşif ve planlama</strong><p>Zemin, mevcut altyapı ve saha erişimi değerlendirilir; makine ve takım seçimi yapılır.</p></div>
        <div><span>03</span><strong>Uygulama</strong><p>Pilot delgi, genişletme ve boru çekme aşamaları yüzeyi açmadan kontrollü biçimde tamamlanır.</p></div>
        <div><span>04</span><strong>Teslim</strong><p>Hat geçişi kontrol edilir, giriş-çıkış noktaları düzenlenir ve proje teslim edilir.</p></div>
      </div>

      <h2>{{NAME}} yatay sondaj hakkında<br><em>sık sorulan sorular</em></h2>
      <div class="city-faq">
        <details><summary>{{NAME}} ilinde yatay sondaj hizmeti veriyor musunuz?</summary><p>Evet. Yiba Yatay Sondaj, Ankara merkezli ekibiyle {{NAME}} dahil Türkiye'nin 81 ilinde yönlendirilebilir yatay sondaj ve kazısız altyapı projelerini proje bazında değerlendirir.</p></details>
        <details><summary>{{NAME}} yatay sondaj fiyatı nasıl belirlenir?</summary><p>Fiyat; geçiş uzunluğu, boru çapı ve türü, zemin koşulları, derinlik ve saha erişimi gibi verilere göre belirlenir. Proje bilgilerini paylaştığınızda size özel teklif hazırlanır.</p></details>
        <details><summary>Hangi altyapı hatları için yatay sondaj yapılabilir?</summary><p>Doğalgaz, içme suyu, kanalizasyon, elektrik, fiber optik ve telekomünikasyon hatları ile çelik kılıf boru geçişleri için yatay sondaj ve boru sürme uygulanabilir.</p></details>
      </div>

      <h2>{{REGION}} içinde<br><em>diğer hizmet illerimiz</em></h2>
      <div class="city-nearby">{{NEARBY_LINKS}}<a href="../hizmet-bolgeleri.html">81 ilin tamamı ↗</a></div>

      <div class="city-cta"><a class="button button-dark" href="../iletisim.html">{{NAME}} projeniz için iletişime geçin <span>↗</span></a><a class="text-link" href="tel:+903122714747">0312 271 47 47 <span>↗</span></a></div>
    </div></section>

  </main>
  <div id="site-footer"></div>
</body>
</html>
'@

$count = 0
foreach ($region in $regions.Keys) {
  $list = $regions[$region]
  foreach ($city in $list) {
    $name = $city[0]; $slug = $city[1]
    $others = @($list | Where-Object { $_[1] -ne $slug })
    $nearbyLinks = ($others | ForEach-Object { '<a href="' + $_[1] + '-yatay-sondaj.html">' + $_[0] + ' yatay sondaj</a>' }) -join ''
    $names = @($others | ForEach-Object { $_[0] })
    if ($names.Count -gt 1) { $nearbyNames = (($names[0..($names.Count-2)]) -join ', ') + ' ve ' + $names[-1] } else { $nearbyNames = $names[0] }
    $html = $template.Replace('{{NAME}}', $name).Replace('{{SLUG}}', $slug).Replace('{{REGION}}', $region).Replace('{{DOMAIN}}', $domain).Replace('{{NEARBY_LINKS}}', $nearbyLinks).Replace('{{NEARBY_NAMES}}', $nearbyNames)
    [System.IO.File]::WriteAllText("$Root\hizmet-bolgeleri\$slug-yatay-sondaj.html", $html, $utf8)
    $count++
  }
}
"Generated $count city pages"
