param([string]$Root)
$utf8 = New-Object System.Text.UTF8Encoding $false
$domain = "https://www.yibayataysondaj.com"
$preloader = [regex]::Match([System.IO.File]::ReadAllText("$Root\kurumsal.html", [System.Text.Encoding]::UTF8), '(?s)<div class="preloader".*?</div></div></div>').Value

$pages = @(
  @{ slug="vizyon-misyon"; title="Vizyon & Misyon"; pill="Kurumsal"; icon="target";
     h1='Yönümüzü belirleyen <em>vizyon ve misyon.</em>';
     desc="Yiba Yatay Sondaj'ın vizyonu ve misyonu: kazısız altyapı teknolojilerinde güvenilir, çevreye duyarlı ve öncü çözümler.";
     lead="2000 yılında Ankara'da kurulduğumuz günden bu yana yönümüzü belirleyen iki cümle var: nereye gitmek istediğimizi anlatan vizyonumuz ve her gün ne yaptığımızı anlatan misyonumuz.";
     stTitle="Vizyonumuz"; st="Kazısız altyapı teknolojilerinde yenilikleri takip eden, güvenilir uygulama anlayışıyla sektörde kalıcı değer yaratan öncü firmalardan biri olmak.";
     st2Title="Misyonumuz"; st2="Her projeye uygun yöntemi ve ekipmanı belirleyerek altyapı ihtiyaçlarına güvenli, verimli ve çevreye duyarlı yatay sondaj çözümleri sunmak.";
     paras=@(
       "Şehirleşme arttıkça klasik açık kazı yöntemleri trafik, çevre, mevcut yollar ve yaşam alanları üzerinde ciddi sorunlara yol açıyor. Biz, yönlendirilebilir yatay sondaj teknolojilerinin bu sorunlara daha hızlı, kontrollü ve çevreye duyarlı bir cevap olduğuna inanıyoruz; vizyonumuz bu teknolojiyi Türkiye'nin her ilinde erişilebilir kılmak.",
       "Misyonumuzu her projede aynı adımlarla hayata geçiriyoruz: güzergâhı ve zemini keşfediyor, boru çapına uygun makine ve takımı seçiyor, uygulamayı tek ekiple yönetiyor ve hattı yüzeyi bozmadan teslim ediyoruz. Mühendislerimiz, saha teknikerlerimiz ve uygulama ekiplerimiz bu sorumluluğu birlikte taşıyor."
     );
     cardsTitle="Vizyonumuzu <em>nasıl yaşatıyoruz?</em>";
     cards=@(
       @("layers","Teknolojiyi takip ederiz","Makine parkımızı ve uygulama yöntemlerimizi gelişen kazısız teknolojilere göre sürekli yeniliyoruz."),
       @("target","Keşiften teslimata tek ekip","Planlama, uygulama ve teslim aynı ekibin elinden geçer; sorumluluk bölünmez."),
       @("award","Uzun ömürlü çözümler","Hızlı olmak kadar kalıcı olmak da önemli: her hat, yıllarca sorunsuz çalışacak şekilde yerleştirilir."),
       @("pin","81 ilde erişilebilir","Ankara merkezli ekibimiz Türkiye'nin her ilindeki projeleri proje bazında değerlendirir.")
     ) },
  @{ slug="degerlerimiz"; title="Değerlerimiz"; pill="Kurumsal"; icon="award";
     h1='İşimizi şekillendiren <em>değerlerimiz.</em>';
     desc="Yiba Yatay Sondaj'ın değerleri: güvenilirlik, şeffaf iletişim, iş birliği, teknik yetkinlik ve verilen sözü zamanında yerine getirme sorumluluğu.";
     lead="Bir altyapı hattı yer altında kalır; görünmez. Bu yüzden işimizin temeli güvendir. Değerlerimiz, 2000'den bu yana her projede aynı özeni göstermemizi sağlayan ilkelerdir.";
     stTitle="Sözümüz"; st="Verdiğimiz sözleri zamanında ve eksiksiz yerine getiririz; projenin her aşamasında açık ve dürüst iletişim kurarız.";
     st2Title=""; st2="";
     paras=@(
       "Güvenilirlik bizim için bir slogan değil, ölçülebilir bir davranıştır: keşifte söylediğimiz yöntem sahada uygulanır, teklifte verdiğimiz süre teslimde tutulur. Proje paydaşları, kurumlar ve ana yükleniciler bizimle çalışırken ne alacaklarını baştan bilir.",
       "Şeffaf iletişim ve iş birliği, zorlu zemin ve saha koşullarında bile projeyi doğru yönetmemizi sağlar. Teknik yetkinliğimizi ekipman altyapımız ve deneyimli kadromuzla destekler; her ekip üyesinin sorumluluk almasını bekleriz."
     );
     cardsTitle="Altı temel <em>değerimiz.</em>";
     cards=@(
       @("check","Güvenilirlik","Söylediğimizi yapar, yaptığımızı söyleriz. Keşif, teklif ve teslim arasında sürpriz yoktur."),
       @("antenna","Şeffaf iletişim","Proje durumu, riskler ve değişiklikler paydaşlarla zamanında ve açıkça paylaşılır."),
       @("layers","İş birliği","Kurum, yüklenici ve saha ekibiyle koordineli çalışır; sorunu değil çözümü büyütürüz."),
       @("gear","Teknik yetkinlik","Doğru makine, doğru takım, doğru yöntem: her kararın arkasında mühendislik vardır."),
       @("award","Sorumluluk","Verilen sözü zamanında ve eksiksiz yerine getirmek bizim için bir onur meselesidir."),
       @("waves","Çevreye saygı","Yolu, peyzajı ve mevcut altyapıyı koruyan yöntemleri tercih ederiz.")
     ) },
  @{ slug="kalite-politikamiz"; title="Kalite Politikamız"; pill="Kurumsal"; icon="gear";
     h1='Planlı çalışma, <em>ölçülebilir kalite.</em>';
     desc="Yiba Yatay Sondaj kalite politikası: işin başından sonuna planlı çalışmak; proje gerekliliklerine, teknik standartlara ve müşteri beklentilerine uygun hizmet sunmak.";
     lead="Kalite politikamızın özü basit: işin başından sonuna kadar planlı çalışmak ve her projeyi proje gerekliliklerine, teknik standartlara ve müşteri beklentilerine uygun teslim etmek.";
     stTitle="Kalite politikamız"; st="İşin başından sonuna kadar planlı çalışmak; proje gerekliliklerine, teknik standartlara ve müşteri beklentilerine uygun hizmet sunmak; her uygulamadan öğrenerek sürekli iyileşmek.";
     st2Title=""; st2="";
     paras=@(
       "Kalite sahada başlamaz, keşifte başlar. Güzergâh, zemin yapısı, mevcut altyapı ve giriş-çıkış noktaları incelenmeden makine ve takım seçimi yapılmaz. Boru çapı, geçiş uzunluğu ve derinlik proje verileriyle doğrulanır; yöntem ancak bu adımdan sonra belirlenir.",
       "Uygulama sırasında pilot delgi, genişletme ve boru çekme aşamaları kontrol listeleriyle izlenir. Makine ve takımlar düzenli bakımla hazır tutulur; sahaya çıkmadan önce ekipman kontrolü yapılır. Teslimde hat geçişi kontrol edilir, giriş-çıkış noktaları düzenlenir ve proje kayıtları paydaşlarla paylaşılır."
     );
     cardsTitle="Kaliteyi güvence altına alan <em>dört adım.</em>";
     cards=@(
       @("target","Keşif ve doğrulama","Zemin, güzergâh ve hat verileri sahada doğrulanmadan yöntem seçilmez."),
       @("layers","Planlı uygulama","Her aşama kontrol listesiyle ilerler; sapmalar anında kayda alınır ve düzeltilir."),
       @("gear","Bakımlı ekipman","Makine parkı ve delgi takımları düzenli bakımla hazır tutulur; sahaya hazır çıkılır."),
       @("check","Kontrollü teslim","Hat geçişi test edilir, saha düzenlenir, kayıtlar paylaşılır; iş tam bittiğinde biter.")
     ) },
  @{ slug="is-sagligi-ve-guvenligi"; title="İş Sağlığı ve Güvenliği"; pill="Kurumsal"; icon="award";
     h1='Önce insan, <em>sonra iş.</em>';
     desc="Yiba Yatay Sondaj iş sağlığı ve güvenliği yaklaşımı: saha risklerini önceden değerlendirmek, uygun tedbirleri almak, çalışanlar ve proje paydaşları için güvenli çalışma ortamı sağlamak.";
     lead="Çalışmalarımızın temelinde kalite ve güvenilirlik kadar iş güvenliği de yer alır. Çalışanlarımızın güvenliği her projede ilk önceliğimizdir; hiçbir teslim tarihi bir kişinin güvenliğinden daha değerli değildir.";
     stTitle="İSG yaklaşımımız"; st="Saha risklerini önceden değerlendirmek, uygun tedbirleri almak ve çalışanlarımız ile proje paydaşları için güvenli bir çalışma ortamını gözetmek.";
     st2Title=""; st2="";
     paras=@(
       "Her sahaya çıkmadan önce risk değerlendirmesi yapılır: yer altındaki mevcut hatlar, trafik, zemin koşulları, giriş-çıkış çukurları ve ekipman hareketleri ayrı ayrı ele alınır. Yol altı ve demiryolu altı geçişlerinde ilgili kurumların şartları çalışma planına işlenir.",
       "Saha ekibimiz kişisel koruyucu donanımla çalışır, makine ve takımlar düzenli kontrol edilir, çalışma alanı trafik ve yaya güvenliği gözetilerek düzenlenir. Acil durum planı sahadaki herkes tarafından bilinir; sorumluluk yalnızca kendi ekibimizi değil, proje sahasındaki tüm paydaşları kapsar."
     );
     cardsTitle="Güvenli saha için <em>temel kurallarımız.</em>";
     cards=@(
       @("target","Risk değerlendirmesi","Mevcut altyapı, trafik ve zemin riskleri her projede sahaya çıkmadan önce belirlenir."),
       @("award","KKD ve eğitim","Ekip kişisel koruyucu donanımla çalışır; görevine uygun güvenlik eğitimini almış olur."),
       @("road","Trafik ve saha düzeni","Çalışma alanı işaretlenir, trafik ve yaya akışı güvenli biçimde yönlendirilir."),
       @("gear","Ekipman kontrolü","Makine, takım ve kaldırma ekipmanları kullanım öncesi kontrol listesiyle doğrulanır."),
       @("bolt","Acil durum planı","Sahadaki herkes acil durumda ne yapacağını bilir; iletişim zinciri önceden belirlenir."),
       @("layers","Paydaş güvenliği","Kurum temsilcileri, yüklenici ekipleri ve çevredeki insanlar için de güvenli ortam sağlanır.")
     ) },
  @{ slug="cevre-ve-surdurulebilirlik"; title="Çevre & Sürdürülebilirlik"; pill="Kurumsal"; icon="waves";
     h1='Kazmadan geçen, <em>iz bırakmayan altyapı.</em>';
     desc="Yiba Yatay Sondaj çevre ve sürdürülebilirlik yaklaşımı: açık kazı ihtiyacını azaltan kazısız yöntemlerle çevreye, mevcut altyapıya ve şehir yaşamına duyarlı uygulamalar.";
     lead="Yatay sondajın en büyük avantajı çevreseldir: yol kapanmaz, asfalt sökülmez, ağaçlar kesilmez, dere yatağı bozulmaz. Sürdürülebilirlik bizim için ek bir politika değil, işimizin kendisidir.";
     stTitle="Çevre yaklaşımımız"; st="Açık kazı ihtiyacını azaltan yöntemleri tercih etmek; çevreye, mevcut altyapıya ve şehir yaşamına duyarlı, uzun ömürlü uygulamalar geliştirmek.";
     st2Title=""; st2="";
     paras=@(
       "Açık kazıya kıyasla yönlendirilebilir yatay sondaj; daha az hafriyat, daha az iş makinesi hareketi ve daha kısa trafik kesintisi anlamına gelir. Dere ve kanal altı geçişlerinde su yapısı ve çevresi korunur; yol altı geçişlerinde yüzey ve peyzaj olduğu gibi kalır.",
       "Uygulamada kullandığımız sondaj sıvısı doğal kil bazlıdır; sıvı ve hafriyat kontrollü biçimde yönetilir, saha teslimde temiz bırakılır. Yerleştirdiğimiz hatların uzun ömürlü olması, aynı güzergâhın yıllar boyunca yeniden kazılmaması demektir; en sürdürülebilir altyapı, bir kez doğru yapılan altyapıdır."
     );
     cardsTitle="Çevre için <em>somut taahhütlerimiz.</em>";
     cards=@(
       @("road","Yüzey ve peyzaj korunur","Asfalt, kaldırım ve yeşil alanlar sökülmez; giriş-çıkış noktaları dışında iz kalmaz."),
       @("waves","Su yapıları korunur","Dere ve kanal altı geçişlerinde su yatağı ve çevresi bozulmaz."),
       @("recycle","Sıvı ve hafriyat yönetimi","Doğal kil bazlı sondaj sıvısı ve hafriyat kontrollü toplanır, saha temiz teslim edilir."),
       @("sun","Daha az emisyon","Daha az iş makinesi hareketi ve daha kısa süre, daha düşük yakıt tüketimi ve emisyon demektir."),
       @("layers","Mevcut altyapıya saygı","Yer altındaki hatlar keşifte belirlenir, güzergâh bunlara zarar vermeyecek şekilde planlanır."),
       @("award","Uzun ömürlü hatlar","Bir kez doğru yerleştirilen hat, yıllarca yeniden kazı gerektirmez.")
     ) }
)

$allLinks = New-Object System.Collections.ArrayList; [void]$allLinks.Add(@("Hakkımızda","kurumsal.html")); foreach ($pg0 in $pages) { [void]$allLinks.Add(@($pg0.title, "$($pg0.slug).html")) }

$template = @'
<!doctype html>
<html lang="tr">
<head>
  <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{TITLE}} | Kurumsal - Yiba Yatay Sondaj</title>
  <meta name="description" content="{{DESC}}">
  <link rel="canonical" href="{{DOMAIN}}/{{SLUG}}.html">
  <meta property="og:title" content="{{TITLE}} | Yiba Yatay Sondaj">
  <meta property="og:description" content="{{DESC}}">
  <meta property="og:image" content="{{DOMAIN}}/assets/images/yiba-logo.png">
  <meta property="og:url" content="{{DOMAIN}}/{{SLUG}}.html">
  <meta property="og:type" content="website">
  <meta property="og:locale" content="tr_TR">
  <link rel="icon" href="assets/images/favicon.svg" type="image/svg+xml"><link rel="stylesheet" href="assets/site.css"><script src="assets/site.js" defer></script>
  <script type="application/ld+json">{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Ana Sayfa","item":"{{DOMAIN}}/"},{"@type":"ListItem","position":2,"name":"Kurumsal","item":"{{DOMAIN}}/kurumsal.html"},{"@type":"ListItem","position":3,"name":"{{TITLE}}","item":"{{DOMAIN}}/{{SLUG}}.html"}]}</script>
</head>
<body data-page="corporate">
  {{PRELOADER}}
  <div id="site-header"></div>
  <main>
    <section class="page-hero" style="background-image:url('assets/images/banner.jpg')"><div class="container page-hero-content"><p class="eyebrow eyebrow-pill eyebrow-pill-dark" data-icon="bolt">{{PILL}}</p><h1>{{H1}}</h1><div class="breadcrumbs"><a href="index.html">Ana Sayfa</a><span>/</span><a href="kurumsal.html">Kurumsal</a><span>/</span> {{TITLE}}</div></div></section>

    <section class="section-pad about-section corp-page">
      <div class="container">
        <div class="about-head">
          <p class="eyebrow eyebrow-pill" data-icon="{{ICON}}">{{TITLE}}</p>
          <h2>{{H1}}</h2>
        </div>
        <div class="corp-intro">
          <p class="about-lead">{{LEAD}}</p>
          {{PARAS}}
        </div>
        <div class="statement-row">
          <div class="statement-card"><span class="statement-label">{{ST_TITLE}}</span><p>{{ST}}</p></div>
          {{ST2}}
        </div>
      </div>
    </section>

    <section class="section-pad section-soft corp-cards-section corp-page-cards">
      <div class="container">
        <div class="sectors-head"><p class="eyebrow eyebrow-pill" data-icon="bolt">{{TITLE}}</p><h2>{{CARDS_TITLE}}</h2></div>
        <div class="corp-cards corp-cards-compact{{CARDS_CLASS}}">{{CARDS}}</div><div class="corp-links corp-links-center"><span>Kurumsal</span>{{LINKS}}</div>
      </div>
    </section>

  </main>
  <div id="site-footer"></div>
</body>
</html>
'@

$count = 0
foreach ($pg in $pages) {
  $paras = ($pg.paras | ForEach-Object { "<p class=`"about-text`">$_</p>" }) -join "`n          "
  $cardsClass = if ($pg.cards.Count -eq 4) { " corp-cards-4" } else { "" }
  $cards = ($pg.cards | ForEach-Object { "<article><span class=`"corp-card-icon`" data-icon=`"$($_[0])`"></span><h3>$($_[1])</h3><p>$($_[2])</p></article>" }) -join ""
  $links = ($allLinks | Where-Object { $_[1] -ne "$($pg.slug).html" } | ForEach-Object { "<a href=`"$($_[1])`">$($_[0])</a>" }) -join ""
  $st2 = ""; if ($pg.st2Title) { $st2 = "<div class=`"statement-card statement-card-alt`"><span class=`"statement-label`">$($pg.st2Title)</span><p>$($pg.st2)</p></div>" }
  $leadShort = $pg.lead; if ($leadShort.Length -gt 150) { $leadShort = $leadShort.Substring(0, $leadShort.IndexOf('.', 90) + 1) }
  $h1Plain = $pg.h1 -replace '<[^>]+>',''
  $html = $template.Replace('{{TITLE}}',$pg.title).Replace('{{SLUG}}',$pg.slug).Replace('{{DESC}}',$pg.desc).Replace('{{DOMAIN}}',$domain).Replace('{{PRELOADER}}',$preloader).Replace('{{PILL}}',$pg.pill).Replace('{{H1}}',$pg.h1).Replace('{{LEAD_SHORT}}',$leadShort).Replace('{{ICON}}',$pg.icon).Replace('{{ST_TITLE}}',$pg.stTitle).Replace('{{ST}}',$pg.st).Replace('{{ST2}}',$st2).Replace('{{LEAD}}',$pg.lead).Replace('{{PARAS}}',$paras).Replace('{{LINKS}}',$links).Replace('{{CARDS_TITLE}}',$pg.cardsTitle).Replace('{{CARDS}}',$cards).Replace('{{CARDS_CLASS}}',$cardsClass)
  [System.IO.File]::WriteAllText("$Root\$($pg.slug).html", $html, $utf8)
  $count++
}
"generated corporate pages: $count"
