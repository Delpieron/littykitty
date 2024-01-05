'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "66a3683dc130f3fce3662c6293cf83b4",
"assets/AssetManifest.json": "14bd2c133723db76df82ed4d34a002a4",
"assets/assets/bags/about_us.png": "7a3919137f9a7b3a030c756c33c05e0a",
"assets/assets/bags/about_us.webp": "db6c813f3800011ebb11cfde9d9642be",
"assets/assets/bags/kontakt.png": "450ddf78a35b3b7e0612ccb1a7c5b42a",
"assets/assets/bags/kontakt.webp": "befbbb8ec58bd7e36e4c093beddeb878",
"assets/assets/bags/lavend0.png": "080f54d61015e16150f692b1fdd6fba8",
"assets/assets/bags/lavend0.webp": "3a62b6f1ac789984e3f8071df2d0ef87",
"assets/assets/bags/lavend1.png": "4084ff26b7fdc0071fd5ffde408f7ae6",
"assets/assets/bags/lavend1.webp": "6f7c579619a6a7a568e82903343a9aaf",
"assets/assets/bags/lavend2.png": "8ebcc4473e47a7e762ce41f57f0e4d99",
"assets/assets/bags/lavend2.webp": "3c232a37330073657f98dc60cbeb9cf6",
"assets/assets/bags/natural0.png": "3b175bb48cd316d50281adc7da586164",
"assets/assets/bags/natural0.webp": "6219d92b62648722b8dfab84336157c2",
"assets/assets/bags/natural1.png": "b0d4edce981c6cf65fe513bf4158ded6",
"assets/assets/bags/natural1.webp": "ac0d71cf07b7e56ee63c0892c8df2d1b",
"assets/assets/bags/natural2.png": "f2bfba26b496cd2597480ee7ae271e61",
"assets/assets/bags/natural2.webp": "303fc45c48b915c9d2fedd38a000c369",
"assets/assets/bags/produktdohubuna.png": "41f8e320b221a1bd0aad352b7c700e42",
"assets/assets/bags/produktdohubuna.webp": "59148b539dbdc31d6bb1b9b9733120c7",
"assets/assets/bags/worki_end.png": "e1352b84c1ae784b2de0a6abadc74b3b",
"assets/assets/bags/worki_end.webp": "24aaf07769b2c81fc3f4533d5779cdc7",
"assets/assets/bags/worki_end2.png": "c8c84dcf84adc0d66a46c34bdf48e106",
"assets/assets/bags/worki_start.png": "b9b44803390d3b2f4ed6ae8d859a0ed0",
"assets/assets/bags/worki_start.webp": "5a3575d3c285ff9d6ab434e3dae150ba",
"assets/assets/bags/worki_start2.png": "cc9914611119f3bb7385357387134428",
"assets/assets/cats/koty-02.png": "36dec91e1eba12b55c2fd9f4278a4dcd",
"assets/assets/cats/koty-02.webp": "8e44f31bb9164009aa0fec301b3724e7",
"assets/assets/cats/koty-15.png": "f2c60f163333c9c13ffb96d3a7cd03fc",
"assets/assets/cats/koty-15.webp": "7ddd4cfa6cb5923d58d247d234171316",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/iconly_svg_optimized-optimized.svg": "b17ddaf51776ee3ba9806d39dd531484",
"assets/assets/kitty_logo.png": "76623c33a76faac737ef265f258eb52c",
"assets/assets/kitty_logo.svg": "4eede2d1983dbf995fd8cd7ebc9d2449",
"assets/assets/kitty_logo.svg.bak": "3e5c1c62d57ad6e0c0a602f3978f38e9",
"assets/assets/kitty_logo2.svg": "57883f3fad28c75a26078db0624b78b7",
"assets/assets/kitty_logoF.png": "23b80505cef8bc3088f787169d746f3c",
"assets/assets/koty-04.png": "a3693b2e349a45cee05bfece09c60449",
"assets/assets/output-onlinepngtools.png": "55ca2a07e0b631e40ba18ffd1b6feb6a",
"assets/assets/output-onlinepngtools2.png": "b44906bb1cdc82331f080cd644e11a21",
"assets/assets/output-onlinepngtools3.png": "989655afd1ca68442b788cdfb3057134",
"assets/assets/specjalista.png": "6796456f4704896f0b3e55428014bc89",
"assets/FontManifest.json": "037e3255ab13f3af755e930be4c00019",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/NOTICES": "31f01850b2e619da2605be34af92c6e3",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "19d8b35640d13140fe4e6f3b8d450f04",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "1165572f59d51e963a5bf9bdda61e39b",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.ico": "da2c530c5e2945f36e68344471cc932a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/favicon.ico": "da2c530c5e2945f36e68344471cc932a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "cfe42597dbe744e69276f41747af17e3",
"/": "cfe42597dbe744e69276f41747af17e3",
"main.dart.js": "4f7e0c213e4566be4a2cecbe63df0c5d",
"manifest.json": "1f0e05ee64ff49cef0090a0f19a199d1",
"version.json": "58b7ad0698d3ed964c82541e3bff2f77"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
