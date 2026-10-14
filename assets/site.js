const cities = [
  ["Adana", "adana"], ["Adıyaman", "adiyaman"], ["Afyonkarahisar", "afyonkarahisar"], ["Ağrı", "agri"],
  ["Amasya", "amasya"], ["Ankara", "ankara"], ["Antalya", "antalya"], ["Artvin", "artvin"],
  ["Aydın", "aydin"], ["Balıkesir", "balikesir"], ["Bilecik", "bilecik"], ["Bingöl", "bingol"],
  ["Bitlis", "bitlis"], ["Bolu", "bolu"], ["Burdur", "burdur"], ["Bursa", "bursa"],
  ["Çanakkale", "canakkale"], ["Çankırı", "cankiri"], ["Çorum", "corum"], ["Denizli", "denizli"],
  ["Diyarbakır", "diyarbakir"], ["Edirne", "edirne"], ["Elazığ", "elazig"], ["Erzincan", "erzincan"],
  ["Erzurum", "erzurum"], ["Eskişehir", "eskisehir"], ["Gaziantep", "gaziantep"], ["Giresun", "giresun"],
  ["Gümüşhane", "gumushane"], ["Hakkari", "hakkari"], ["Hatay", "hatay"], ["Isparta", "isparta"],
  ["Mersin", "mersin"], ["İstanbul", "istanbul"], ["İzmir", "izmir"], ["Kars", "kars"],
  ["Kastamonu", "kastamonu"], ["Kayseri", "kayseri"], ["Kırklareli", "kirklareli"], ["Kırşehir", "kirsehir"],
  ["Kocaeli", "kocaeli"], ["Konya", "konya"], ["Kütahya", "kutahya"], ["Malatya", "malatya"],
  ["Manisa", "manisa"], ["Kahramanmaraş", "kahramanmaras"], ["Mardin", "mardin"], ["Muğla", "mugla"],
  ["Muş", "mus"], ["Nevşehir", "nevsehir"], ["Niğde", "nigde"], ["Ordu", "ordu"],
  ["Rize", "rize"], ["Sakarya", "sakarya"], ["Samsun", "samsun"], ["Siirt", "siirt"],
  ["Sinop", "sinop"], ["Sivas", "sivas"], ["Tekirdağ", "tekirdag"], ["Tokat", "tokat"],
  ["Trabzon", "trabzon"], ["Tunceli", "tunceli"], ["Şanlıurfa", "sanliurfa"], ["Uşak", "usak"],
  ["Van", "van"], ["Yozgat", "yozgat"], ["Zonguldak", "zonguldak"], ["Aksaray", "aksaray"],
  ["Bayburt", "bayburt"], ["Karaman", "karaman"], ["Kırıkkale", "kirikkale"], ["Batman", "batman"],
  ["Şırnak", "sirnak"], ["Bartın", "bartin"], ["Ardahan", "ardahan"], ["Iğdır", "igdir"],
  ["Yalova", "yalova"], ["Karabük", "karabuk"], ["Kilis", "kilis"], ["Osmaniye", "osmaniye"],
  ["Düzce", "duzce"]
];

const navItems = [
  { label: "Ana Sayfa", href: "index.html", pages: ["home"] },
  { label: "Kurumsal", href: "kurumsal.html", pages: ["corporate"], children: [
    ["Hakkımızda", "kurumsal.html"],
    ["Vizyon & Misyon", "vizyon-misyon.html"],
    ["Değerlerimiz", "degerlerimiz.html"],
    ["Kalite Politikamız", "kalite-politikamiz.html"],
    ["İş Sağlığı ve Güvenliği", "is-sagligi-ve-guvenligi.html"],
    ["Çevre & Sürdürülebilirlik", "cevre-ve-surdurulebilirlik.html"]
  ] },
  { label: "Hizmetler", href: "hizmetler.html", pages: ["services"], wide: true, children: [
    ["Yönlendirilebilir Yatay Sondaj", "hizmetler/yonlendirilebilir-yatay-sondaj.html"],
    ["Yatay Delgi", "hizmetler/yatay-delgi.html"],
    ["Boru Sürme ve İtme", "hizmetler/boru-surme-ve-itme.html"],
    ["Çelik Boru Sürme", "hizmetler/celik-boru-surme.html"],
    ["Yol Altı Geçişleri", "hizmetler/yol-alti-gecis.html"],
    ["Demiryolu Altı Geçişleri", "hizmetler/demiryolu-alti-gecis.html"],
    ["Dere ve Kanal Altı Geçişleri", "hizmetler/dere-ve-kanal-alti-gecis.html"],
    ["Özel Geçiş Projeleri", "hizmetler/ozel-gecis-projeleri.html"],
    ["Tüm hizmetlerimiz", "hizmetler.html", "all"]
  ] },
  { label: "Sektörler", href: "sektorler.html", pages: ["sectors"] },
  { label: "Makina Parkı", href: "makina-parkimiz.html", pages: ["machines"] },
  { label: "Hizmet Bölgeleri", href: "hizmet-bolgeleri.html", pages: ["areas", "area-city"] },
  { label: "Referanslar", href: "referanslar.html", pages: ["references"] },
  { label: "İletişim", href: "iletisim.html", pages: ["contact"] }
];

const chevronDown = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="m6 9 6 6 6-6"/></svg>';
const renderNavItem = (item, prefix, current) => {
  const isCurrent = item.pages.includes(current);
  if (!item.children) {
    return `<a href="${prefix}${item.href}"${isCurrent ? ' aria-current="page"' : ""}>${item.label}</a>`;
  }
  const links = item.children.map(([label, href, kind]) => `<a href="${prefix}${href}"${kind === "all" ? ' class="nav-sub-all"' : ""}>${label}<span>↗</span></a>`).join("");
  return `<div class="nav-item has-children${isCurrent ? " is-current" : ""}"><a href="${prefix}${item.href}"${isCurrent ? ' aria-current="page"' : ""}>${item.label}</a><button class="nav-sub-toggle" type="button" aria-expanded="false" aria-label="${item.label} alt menüsü">${chevronDown}</button><div class="nav-sub${item.wide ? " nav-sub-wide" : ""}">${links}</div></div>`;
};

const page = document.body.dataset.page || "";
const header = document.getElementById("site-header");
const footer = document.getElementById("site-footer");
const inCityPage = /\/(hizmet-bolgeleri|hizmetler)\//.test(location.pathname);
const assetPrefix = inCityPage ? "../" : "";
const pagePrefix = inCityPage ? "../" : "";

const svgAttrs = 'xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"';
const icons = {
  pin: `<svg ${svgAttrs}><path d="M12 21s-7-6.2-7-11a7 7 0 0 1 14 0c0 4.8-7 11-7 11z"/><circle cx="12" cy="10" r="2.5"/></svg>`,
  phone: `<svg ${svgAttrs}><path d="M22 16.9v3a2 2 0 0 1-2.2 2A19.8 19.8 0 0 1 2.1 4.2 2 2 0 0 1 4.1 2h3a2 2 0 0 1 2 1.7c.1.9.4 1.8.7 2.6a2 2 0 0 1-.5 2.1L8 9.7a16 16 0 0 0 6.3 6.3l1.3-1.3a2 2 0 0 1 2.1-.5c.8.3 1.7.6 2.6.7a2 2 0 0 1 1.7 2z"/></svg>`,
  mail: `<svg ${svgAttrs}><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m2 7 10 7 10-7"/></svg>`,
  whatsapp: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 0 1-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 0 1-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 0 1 2.893 6.994c-.003 5.45-4.437 9.885-9.885 9.885m8.413-18.297A11.815 11.815 0 0 0 12.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 0 0 5.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 0 0-3.48-8.413Z"/></svg>`,
  instagram: `<svg ${svgAttrs}><rect x="2" y="2" width="20" height="20" rx="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.5" cy="6.5" r="1" fill="currentColor" stroke="none"/></svg>`,
  bolt: `<svg ${svgAttrs}><path d="M13 2 3 14h8l-1 8 10-12h-8l1-8z"/></svg>`,
  target: `<svg ${svgAttrs}><circle cx="12" cy="12" r="9"/><circle cx="12" cy="12" r="4"/><circle cx="12" cy="12" r="1" fill="currentColor"/></svg>`,
  eye: `<svg ${svgAttrs}><path d="M2 12s4-7 10-7 10 7 10 7-4 7-10 7S2 12 2 12z"/><circle cx="12" cy="12" r="3"/></svg>`,
  award: `<svg ${svgAttrs}><circle cx="12" cy="9" r="6"/><path d="m8.5 14-1.5 8 5-3 5 3-1.5-8"/></svg>`,
  check: `<svg ${svgAttrs}><circle cx="12" cy="12" r="9"/><path d="m8.5 12 2.5 2.5 5-5"/></svg>`,
  arrow: `<svg ${svgAttrs}><path d="M12 4v16m0 0-6-6m6 6 6-6"/></svg>`,
  "arrow-up-right": `<svg ${svgAttrs}><path d="M7 17 17 7M8 7h9v9"/></svg>`,
  "arrow-up": `<svg ${svgAttrs}><path d="M12 20V4m0 0-6 6m6-6 6 6"/></svg>`,
  building: `<svg ${svgAttrs}><rect x="4" y="3" width="16" height="18" rx="2"/><path d="M9 7h2M13 7h2M9 11h2M13 11h2M9 15h2M13 15h2M10 21v-3h4v3"/></svg>`,
  gear: `<svg ${svgAttrs}><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.7 1.7 0 0 0 .3 1.8l.1.1a2 2 0 1 1-2.8 2.8l-.1-.1a1.7 1.7 0 0 0-1.8-.3 1.7 1.7 0 0 0-1 1.5V21a2 2 0 1 1-4 0v-.1a1.7 1.7 0 0 0-1.1-1.5 1.7 1.7 0 0 0-1.8.3l-.1.1a2 2 0 1 1-2.8-2.8l.1-.1a1.7 1.7 0 0 0 .3-1.8 1.7 1.7 0 0 0-1.5-1H3a2 2 0 1 1 0-4h.1a1.7 1.7 0 0 0 1.5-1.1 1.7 1.7 0 0 0-.3-1.8l-.1-.1a2 2 0 1 1 2.8-2.8l.1.1a1.7 1.7 0 0 0 1.8.3H9a1.7 1.7 0 0 0 1-1.5V3a2 2 0 1 1 4 0v.1a1.7 1.7 0 0 0 1 1.5 1.7 1.7 0 0 0 1.8-.3l.1-.1a2 2 0 1 1 2.8 2.8l-.1.1a1.7 1.7 0 0 0-.3 1.8V9a1.7 1.7 0 0 0 1.5 1H21a2 2 0 1 1 0 4h-.1a1.7 1.7 0 0 0-1.5 1z"/></svg>`,
  layers: `<svg ${svgAttrs}><path d="m12 2 9 5-9 5-9-5 9-5z"/><path d="m3 12 9 5 9-5M3 17l9 5 9-5"/></svg>`,
  hammer: `<svg ${svgAttrs}><path d="m15 12-8.5 8.5a2.1 2.1 0 1 1-3-3L12 9"/><path d="M17.6 15 22 10.6 13.4 2 9 6.4l3 3 5.6 5.6z"/></svg>`,
  "chevron-left": `<svg ${svgAttrs}><path d="m15 5-7 7 7 7"/></svg>`,
  "chevron-right": `<svg ${svgAttrs}><path d="m9 5 7 7-7 7"/></svg>`,
  drill: `<svg ${svgAttrs}><path d="M2 12h7"/><path d="M9 8h5l7 4-7 4H9z"/><path d="M12 8v8"/><path d="M4 9v6"/></svg>`,
  pipe: `<svg ${svgAttrs}><rect x="2" y="9" width="20" height="6" rx="3"/><path d="M7 9v6M17 9v6"/></svg>`,
  steel: `<svg ${svgAttrs}><path d="M4 5h16v4H4zM4 15h16v4H4z"/><path d="M8 9v6M16 9v6"/></svg>`,
  road: `<svg ${svgAttrs}><path d="M4 20 9 4h6l5 16"/><path d="M12 6v3m0 4v3m0 4v1"/></svg>`,
  rail: `<svg ${svgAttrs}><path d="M7 3v18M17 3v18M7 7h10M7 12h10M7 17h10"/></svg>`,
  waves: `<svg ${svgAttrs}><path d="M2 8c2-2 4-2 6 0s4 2 6 0 4-2 6 0M2 14c2-2 4-2 6 0s4 2 6 0 4-2 6 0M2 20c2-2 4-2 6 0s4 2 6 0 4-2 6 0"/></svg>`,
  flame: `<svg ${svgAttrs}><path d="M12 22c4 0 7-3 7-7 0-3-2-5-3-7-1 3-2 4-4 4 0-3-1-6-3-8-1 5-4 7-4 11 0 4 3 7 7 7z"/></svg>`,
  antenna: `<svg ${svgAttrs}><path d="M12 22V10"/><circle cx="12" cy="8" r="2"/><path d="M6 4a9 9 0 0 1 12 0M8.5 7a5.5 5.5 0 0 1 7 0"/></svg>`,
  fiber: `<svg ${svgAttrs}><path d="M3 17c5 0 5-10 10-10h8"/><path d="M3 12c5 0 5-5 10-5"/><circle cx="21" cy="7" r="1" fill="currentColor"/></svg>`,
  droplet: `<svg ${svgAttrs}><path d="M12 3s6 6 6 11a6 6 0 0 1-12 0c0-5 6-11 6-11z"/></svg>`,
  recycle: `<svg ${svgAttrs}><path d="M4 15v-3a8 8 0 0 1 14-5"/><path d="M20 9v3a8 8 0 0 1-14 5"/><path d="m15 3 3 4-4 3M9 21l-3-4 4-3"/></svg>`,
  sun: `<svg ${svgAttrs}><circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M2 12h2M20 12h2M4.9 4.9l1.4 1.4M17.7 17.7l1.4 1.4M4.9 19.1l1.4-1.4M17.7 6.3l1.4-1.4"/></svg>`
};

document.querySelectorAll("[data-icon]").forEach((node) => {
  const icon = icons[node.dataset.icon];
  if (icon) node.insertAdjacentHTML("afterbegin", icon);
});
document.querySelectorAll("[data-icon-end]").forEach((node) => {
  const icon = icons[node.dataset.iconEnd];
  if (icon) node.insertAdjacentHTML("beforeend", icon);
});

document.querySelectorAll("[data-logo]").forEach((tile) => {
  const img = new Image();
  img.alt = `${tile.textContent.trim()} logosu`;
  img.loading = "lazy";
  img.decoding = "async";
  img.addEventListener("load", () => tile.classList.add("has-logo"));
  img.addEventListener("error", () => img.remove());
  img.src = `${assetPrefix}assets/images/referanslar/${tile.dataset.logo}`;
  tile.appendChild(img);
});

const lightboxLinks = [...document.querySelectorAll("[data-lightbox]")];
if (lightboxLinks.length) {
  document.body.insertAdjacentHTML("beforeend", `<div class="lightbox" hidden role="dialog" aria-modal="true" aria-label="Görsel önizleme"><button class="lightbox-close" type="button" aria-label="Kapat">${icons["chevron-left"].replace('d="m15 5-7 7 7 7"', 'd="M6 6l12 12M18 6 6 18"')}</button><button class="lightbox-prev" type="button" aria-label="Önceki">${icons["chevron-left"]}</button><figure><img alt=""><figcaption></figcaption></figure><button class="lightbox-next" type="button" aria-label="Sonraki">${icons["chevron-right"]}</button></div>`);
  const box = document.querySelector(".lightbox");
  const img = box.querySelector("img");
  const cap = box.querySelector("figcaption");
  let current = 0;
  const show = (i) => {
    current = (i + lightboxLinks.length) % lightboxLinks.length;
    const link = lightboxLinks[current];
    img.src = link.getAttribute("href");
    img.alt = link.dataset.title || "";
    cap.textContent = link.dataset.title || "";
    box.hidden = false;
    document.body.classList.add("lightbox-open");
  };
  const close = () => { box.hidden = true; document.body.classList.remove("lightbox-open"); };
  lightboxLinks.forEach((link, i) => link.addEventListener("click", (e) => { e.preventDefault(); show(i); }));
  box.querySelector(".lightbox-close").addEventListener("click", close);
  box.querySelector(".lightbox-prev").addEventListener("click", () => show(current - 1));
  box.querySelector(".lightbox-next").addEventListener("click", () => show(current + 1));
  box.addEventListener("click", (e) => { if (e.target === box) close(); });
  document.addEventListener("keydown", (e) => {
    if (box.hidden) return;
    if (e.key === "Escape") close();
    if (e.key === "ArrowLeft") show(current - 1);
    if (e.key === "ArrowRight") show(current + 1);
  });
  if (lightboxLinks.length < 2) { box.querySelector(".lightbox-prev").hidden = true; box.querySelector(".lightbox-next").hidden = true; }
}

const regionsSection = document.querySelector(".regions-section");
if (regionsSection) {
  const setHot = (key, on) => regionsSection.querySelectorAll(`[data-region="${key}"]`).forEach((el) => el.classList.toggle("is-hot", on));
  regionsSection.querySelectorAll(".regions-list a").forEach((link) => {
    link.addEventListener("mouseenter", () => setHot(link.dataset.region, true));
    link.addEventListener("mouseleave", () => setHot(link.dataset.region, false));
  });
  if ("IntersectionObserver" in window) {
    const io = new IntersectionObserver((entries) => { entries.forEach((e) => { if (e.isIntersecting) { regionsSection.classList.add("is-visible"); io.disconnect(); } }); }, { threshold: 0.25 });
    io.observe(regionsSection);
  } else {
    regionsSection.classList.add("is-visible");
  }
}

const preloader = document.querySelector(".preloader");
if (preloader) {
  let seen = false;
  try { seen = sessionStorage.getItem("yiba-preloaded") === "1"; } catch (error) { seen = false; }
  const minTime = seen ? 300 : 1300;
  const started = performance.now();
  const finish = () => {
    const wait = Math.max(0, minTime - (performance.now() - started));
    window.setTimeout(() => {
      preloader.classList.add("is-done");
      try { sessionStorage.setItem("yiba-preloaded", "1"); } catch (error) { /* storage unavailable */ }
    }, wait);
  };
  if (document.readyState === "complete") finish(); else window.addEventListener("load", finish);
  window.setTimeout(() => preloader.classList.add("is-done"), 5000);
}

document.querySelectorAll("[data-track]").forEach((track) => {
  let dragging = false;
  let moved = false;
  let startX = 0;
  let startLeft = 0;
  track.addEventListener("pointerdown", (event) => {
    if (event.pointerType === "touch" || event.button !== 0) return;
    dragging = true;
    moved = false;
    startX = event.clientX;
    startLeft = track.scrollLeft;
    track.classList.add("is-dragging");
    track.setPointerCapture(event.pointerId);
  });
  track.addEventListener("pointermove", (event) => {
    if (!dragging) return;
    const dx = event.clientX - startX;
    if (Math.abs(dx) > 4) moved = true;
    track.scrollLeft = startLeft - dx;
  });
  const endDrag = () => {
    if (!dragging) return;
    dragging = false;
    track.classList.remove("is-dragging");
  };
  track.addEventListener("pointerup", endDrag);
  track.addEventListener("pointercancel", endDrag);
  track.addEventListener("click", (event) => {
    if (moved) { event.preventDefault(); event.stopPropagation(); moved = false; }
  }, true);
  const scope = track.closest("section") || document;
  const step = () => {
    const card = track.firstElementChild;
    return card ? card.getBoundingClientRect().width + 20 : 320;
  };
  const prev = scope.querySelector("[data-track-prev]");
  const next = scope.querySelector("[data-track-next]");
  const atEnd = () => track.scrollLeft + track.clientWidth >= track.scrollWidth - 4;
  const atStart = () => track.scrollLeft <= 4;
  if (prev) prev.addEventListener("click", () => {
    if (atStart()) track.scrollTo({ left: track.scrollWidth, behavior: "smooth" });
    else track.scrollBy({ left: -step(), behavior: "smooth" });
  });
  if (next) next.addEventListener("click", () => {
    if (atEnd()) track.scrollTo({ left: 0, behavior: "smooth" });
    else track.scrollBy({ left: step(), behavior: "smooth" });
  });
});

document.querySelectorAll(".intro-tabs").forEach((tabs) => {
  const buttons = [...tabs.querySelectorAll("[data-tab]")];
  const panels = [...document.querySelectorAll("[data-panel]")];
  buttons.forEach((button) => {
    button.addEventListener("click", () => {
      buttons.forEach((b) => b.setAttribute("aria-selected", String(b === button)));
      panels.forEach((panel) => { panel.hidden = panel.dataset.panel !== button.dataset.tab; });
    });
  });
});

if (header) {
  header.innerHTML = `
    <div class="topbar"><div class="container topbar-inner"><span class="topbar-address">${icons.bolt} Ankara'dan 81 ile yönlendirilebilir yatay sondaj | Keşiften teslimata tek ekip</span><div><a href="tel:+903122714747">${icons.phone} +90 312 271 47 47</a><a class="topbar-mail" href="mailto:yibayataysondaj2@gmail.com">${icons.mail} yibayataysondaj2@gmail.com</a><a class="topbar-icon-link" href="https://wa.me/905322655807" target="_blank" rel="noopener" aria-label="WhatsApp ile yazın">${icons.whatsapp}</a><a class="topbar-icon-link" href="https://www.instagram.com/yibasondaj/" target="_blank" rel="noopener" aria-label="Instagram sayfamız">${icons.instagram}</a></div></div></div>
    <header class="site-header"><div class="container nav-wrap">
      <a class="brand" href="${pagePrefix}index.html" aria-label="Yiba Yatay Sondaj ana sayfa"><img src="${assetPrefix}assets/images/yiba-logo-white.png" alt="Yiba Yatay Sondaj Ticaret Limited Şirketi logosu"></a>
      <button class="menu-toggle" type="button" aria-expanded="false" aria-controls="primary-nav"><span></span><span></span><span></span><b class="sr-only">Menüyü aç</b></button>
      <nav id="primary-nav" class="primary-nav" aria-label="Ana menü">${navItems.map((item) => renderNavItem(item, pagePrefix, page)).join("")}</nav>
    </div></header>`;
}

if (footer) {
  footer.innerHTML = `
    <footer class="site-footer">
      <div class="container footer-main">
        <div class="footer-brand-col"><a class="brand brand-footer" href="${pagePrefix}index.html"><img src="${assetPrefix}assets/images/yiba-logo-white.png" alt="Yiba Yatay Sondaj Ticaret Limited Şirketi logosu"></a><p>Yönlendirilebilir yatay sondaj ve kazısız altyapı uygulamalarında 2000'den bu yana güvenilir çözüm ortağınız.</p></div>
        <div><h2>Kurumsal</h2><a href="${pagePrefix}kurumsal.html">Hakkımızda</a><a href="${pagePrefix}vizyon-misyon.html">Vizyon & Misyon</a><a href="${pagePrefix}degerlerimiz.html">Değerlerimiz</a><a href="${pagePrefix}kalite-politikamiz.html">Kalite Politikamız</a><a href="${pagePrefix}is-sagligi-ve-guvenligi.html">İş Sağlığı ve Güvenliği</a><a href="${pagePrefix}cevre-ve-surdurulebilirlik.html">Çevre & Sürdürülebilirlik</a></div>
        <div><h2>Hizmetler</h2><a href="${pagePrefix}hizmetler/yonlendirilebilir-yatay-sondaj.html">Yönlendirilebilir yatay sondaj</a><a href="${pagePrefix}hizmetler/boru-surme-ve-itme.html">Boru sürme ve itme</a><a href="${pagePrefix}hizmetler/yol-alti-gecis.html">Yol altı geçişleri</a><a href="${pagePrefix}hizmetler/ozel-gecis-projeleri.html">Özel geçiş projeleri</a></div>
        <div class="footer-areas"><h2>Hizmet Bölgeleri</h2>${[["Ankara", "ankara"], ["İstanbul", "istanbul"], ["İzmir", "izmir"], ["Bursa", "bursa"], ["Antalya", "antalya"], ["Konya", "konya"]].map(([name, slug]) => `<a href="${pagePrefix}hizmet-bolgeleri/${slug}-yatay-sondaj.html">${name} yatay sondaj</a>`).join("")}<a class="footer-all" href="${pagePrefix}hizmet-bolgeleri.html">81 ilin tamamı ↗</a></div>
        <div class="footer-contact"><h2>İletişim</h2><a href="tel:+903122714747">${icons.phone}<span>+90 312 271 47 47</span></a><a href="https://wa.me/905322655807" target="_blank" rel="noopener">${icons.whatsapp}<span>+90 532 265 58 07</span></a><a href="mailto:yibayataysondaj2@gmail.com">${icons.mail}<span>yibayataysondaj2@gmail.com</span></a><a href="https://maps.app.goo.gl/3iwv2M8fkxDeFS4S7" target="_blank" rel="noopener">${icons.pin}<span>Yeşilova Mah. 4023. Cad. Ser Tower No:1/21, Etimesgut / Ankara</span></a></div>
      </div>
      <div class="container footer-bottom"><span>© <span data-year></span> Yiba Yatay Sondaj. All Rights Reserved. Designed by <a class="footer-credit" href="https://www.oxit.com.tr/" target="_blank" rel="noopener">Oxit Bilişim Teknolojileri</a></span></div>
    </footer>`;
}

document.querySelectorAll(".whatsapp-float").forEach((node) => node.remove());
document.body.insertAdjacentHTML("beforeend", `
  <div class="contact-dock" aria-label="Hızlı iletişim">
    <a href="tel:+905322655807" aria-label="Hemen ara">${icons.phone}<span>Hemen ara</span></a>
    <a href="mailto:yibayataysondaj2@gmail.com" aria-label="E-posta gönder">${icons.mail}<span>E-posta</span></a>
    <a href="https://www.instagram.com/yibasondaj/" target="_blank" rel="noopener" aria-label="Instagram">${icons.instagram}<span>Instagram</span></a>
    <a class="dock-main" href="https://wa.me/905322655807" target="_blank" rel="noopener" aria-label="WhatsApp ile yazın">${icons.whatsapp}<span>WhatsApp</span></a>
  </div>
  <button class="to-top" type="button" aria-label="Yukarı çık">${icons["arrow-up"]}</button>`);
const toTop = document.querySelector(".to-top");
if (toTop) {
  const onTopScroll = () => toTop.classList.toggle("is-visible", window.scrollY > 500);
  window.addEventListener("scroll", onTopScroll, { passive: true });
  onTopScroll();
  toTop.addEventListener("click", () => window.scrollTo({ top: 0, behavior: reduceMotionQuery.matches ? "auto" : "smooth" }));
}

document.querySelectorAll("[data-year]").forEach((node) => {
  node.textContent = new Date().getFullYear();
});

if (header) {
  const onScroll = () => header.classList.toggle("is-scrolled", window.scrollY > 40);
  onScroll();
  window.addEventListener("scroll", onScroll, { passive: true });
}

const menuToggle = document.querySelector(".menu-toggle");
const primaryNav = document.querySelector(".primary-nav");
if (menuToggle && primaryNav) {
  const setMenu = (open) => {
    menuToggle.setAttribute("aria-expanded", String(open));
    primaryNav.classList.toggle("is-open", open);
    if (header) header.classList.toggle("menu-open", open);
  };
  menuToggle.addEventListener("click", () => setMenu(menuToggle.getAttribute("aria-expanded") !== "true"));
  primaryNav.addEventListener("click", (event) => {
    const toggle = event.target.closest(".nav-sub-toggle");
    if (toggle) {
      const item = toggle.closest(".nav-item");
      const open = !item.classList.contains("is-open");
      primaryNav.querySelectorAll(".nav-item.is-open").forEach((other) => {
        if (other !== item) {
          other.classList.remove("is-open");
          other.querySelector(".nav-sub-toggle").setAttribute("aria-expanded", "false");
        }
      });
      item.classList.toggle("is-open", open);
      toggle.setAttribute("aria-expanded", String(open));
      return;
    }
    if (event.target.closest("a")) setMenu(false);
  });
  document.addEventListener("click", (event) => {
    if (!event.target.closest(".primary-nav")) {
      primaryNav.querySelectorAll(".nav-item.is-open").forEach((item) => {
        item.classList.remove("is-open");
        item.querySelector(".nav-sub-toggle").setAttribute("aria-expanded", "false");
      });
    }
  });
}

const cityGrid = document.getElementById("city-grid");
if (cityGrid) {
  cityGrid.innerHTML = cities.map(([name, slug]) => `<a href="hizmet-bolgeleri/${slug}-yatay-sondaj.html"><span>${name} yatay sondaj</span><i>↗</i></a>`).join("");
}

const cityList = document.getElementById("city-list");
if (cityList) {
  cityList.innerHTML = cities.map(([name]) => `<option value="${name}"></option>`).join("");
}

const quoteForm = document.getElementById("quote-form");
if (quoteForm) {
  const note = quoteForm.querySelector("[data-form-note]");
  quoteForm.addEventListener("submit", (event) => {
    event.preventDefault();
    const required = [...quoteForm.querySelectorAll("[required]")];
    const missing = required.filter((field) => !field.value.trim());
    if (missing.length) {
      missing[0].focus();
      if (note) note.textContent = "Lütfen ad, telefon ve proje ili alanlarını doldurun.";
      return;
    }
    const data = new FormData(quoteForm);
    const text = [
      "Merhaba, Yiba Yatay Sondaj web sitesinden teklif talebi gönderiyorum.",
      `Ad Soyad / Firma: ${data.get("name")}`,
      `Telefon: ${data.get("phone")}`,
      `Proje ili: ${data.get("city")}`,
      `Hizmet: ${data.get("service")}`,
      `Proje bilgisi: ${data.get("message") || "-"}`
    ].join("\n");
    const channel = (event.submitter && event.submitter.dataset.channel) || "whatsapp";
    if (channel === "email") {
      const subject = encodeURIComponent(`Teklif talebi - ${data.get("city")} yatay sondaj`);
      window.location.href = `mailto:yibayataysondaj2@gmail.com?subject=${subject}&body=${encodeURIComponent(text)}`;
    } else {
      window.open(`https://wa.me/905322655807?text=${encodeURIComponent(text)}`, "_blank", "noopener");
    }
    if (note) note.textContent = "Mesajınız hazırlandı. Açılan pencerede göndermeyi onaylayın.";
  });
}

const reduceMotionQuery = window.matchMedia("(prefers-reduced-motion: reduce)");
if (!reduceMotionQuery.matches && "IntersectionObserver" in window) {
  const revealTargets = document.querySelectorAll(
    ".section-heading, .intro-grid > *, .process-head, .process-track, .process-card, .process-foot, .services-head, .sectors-head, .sector-card, .references-head, .machine-card, .value-grid article, .sector-grid article, .city-steps > div, .reference-tile, .reference-logos span, .contact-banner > *, .cta-strip > *, .machine-teaser-copy, .equipment-grid > *, .service-list article, .city-service-boxes a, .city-highlight, .city-faq, .contact-details, .contact-form, .contact-address, .corporate-grid > *, .sector-chips"
  );
  if (revealTargets.length) {
    document.documentElement.classList.add("js-reveal");
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.12, rootMargin: "0px 0px -6% 0px" });
    revealTargets.forEach((node) => {
      const siblings = node.parentElement ? [...node.parentElement.children] : [];
      const index = Math.max(0, siblings.indexOf(node));
      node.dataset.reveal = "";
      node.style.transitionDelay = `${(index % 5) * 70}ms`;
      observer.observe(node);
    });
  }
}

const heroVideo = document.querySelector(".hero-video");
if (heroVideo) {
  if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
    heroVideo.removeAttribute("autoplay");
    heroVideo.pause();
  } else {
    heroVideo.muted = true;
    heroVideo.defaultMuted = true;
    heroVideo.playsInline = true;
    const tryPlay = () => heroVideo.play().catch(() => {});
    tryPlay();
    heroVideo.addEventListener("canplay", tryPlay, { once: true });
    document.addEventListener("pointerdown", tryPlay, { once: true });
  }
}

const slides = [...document.querySelectorAll(".hero-slide")];
const dots = [...document.querySelectorAll("[data-slide-to]")];
if (slides.length > 1) {
  let activeSlide = 0;
  let timer;
  const showSlide = (index) => {
    activeSlide = (index + slides.length) % slides.length;
    slides.forEach((slide, i) => slide.classList.toggle("is-active", i === activeSlide));
    dots.forEach((dot, i) => {
      dot.classList.toggle("is-active", i === activeSlide);
      dot.setAttribute("aria-pressed", String(i === activeSlide));
    });
  };
  const progress = document.querySelector("[data-hero-progress]");
  const restartTimer = () => {
    window.clearInterval(timer);
    if (!window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
      timer = window.setInterval(() => { showSlide(activeSlide + 1); runProgress(); }, 6500);
      runProgress();
    }
  };
  const runProgress = () => {
    if (!progress) return;
    progress.classList.remove("is-running");
    void progress.offsetWidth;
    progress.classList.add("is-running");
  };
  document.querySelector("[data-slide-prev]")?.addEventListener("click", () => { showSlide(activeSlide - 1); restartTimer(); });
  document.querySelector("[data-slide-next]")?.addEventListener("click", () => { showSlide(activeSlide + 1); restartTimer(); });
  dots.forEach((dot, i) => dot.addEventListener("click", () => { showSlide(i); restartTimer(); }));
  restartTimer();
}
