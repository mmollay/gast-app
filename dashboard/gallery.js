/* Foto-Galerie — Airbnb-Import (Gast auf Erden). Baut Grid + Lightbox, eine Aufgabe. */
(function () {
  function init() {
    var COUNT = 14; // /gallery/00.jpg .. 13.jpg
    var grid = document.getElementById('galleryGrid');
    var box = document.getElementById('galleryLightbox');
    if (!grid || !box) return;

    var photos = [];
    for (var i = 0; i < COUNT; i++) {
      photos.push('/gallery/' + (i < 10 ? '0' + i : '' + i) + '.jpg');
    }

    photos.forEach(function (src, i) {
      var item = document.createElement('div');
      item.className = 'gallery-grid__item';
      var img = document.createElement('img');
      img.src = src;
      img.loading = 'lazy';
      img.alt = 'Gast auf Erden – Foto ' + (i + 1);
      item.appendChild(img);
      item.addEventListener('click', function () { openAt(i); });
      grid.appendChild(item);
    });

    var boxImg = document.getElementById('galleryLightboxImg');
    var counter = document.getElementById('galleryCounter');
    var current = 0;

    function show(i) {
      current = (i + photos.length) % photos.length;
      boxImg.src = photos[current];
      counter.textContent = (current + 1) + ' / ' + photos.length;
    }
    function openAt(i) { show(i); box.classList.add('active'); }
    function closeBox() { box.classList.remove('active'); }

    document.getElementById('galleryClose').addEventListener('click', closeBox);
    document.getElementById('galleryPrev').addEventListener('click', function (e) { e.stopPropagation(); show(current - 1); });
    document.getElementById('galleryNext').addEventListener('click', function (e) { e.stopPropagation(); show(current + 1); });
    box.addEventListener('click', function (e) { if (e.target === box) closeBox(); });
    document.addEventListener('keydown', function (e) {
      if (!box.classList.contains('active')) return;
      if (e.key === 'Escape') closeBox();
      else if (e.key === 'ArrowLeft') show(current - 1);
      else if (e.key === 'ArrowRight') show(current + 1);
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
