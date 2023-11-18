'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"assets/AssetManifest.bin": "80350a91fe9d730bffeeabad334c9a83",
"assets/AssetManifest.json": "41cdf7b65364223206dbbbb7ad82a869",
"assets/assets/blender.svg": "85fee1db0cfb4438919d226da5060359",
"assets/assets/Bumho-nisubire.pdf": "ec53c996384831f863ecfb7afcffc06d",
"assets/assets/cnn_ml.png": "7ccd9a20ee2155a06602844081fc93f6",
"assets/assets/coursera.png": "cb652ac9ab6fc741d289632079038c47",
"assets/assets/django.svg": "da233e2d2eb2fa886848d04ef1665456",
"assets/assets/dotnet.svg": "4423a342852bf689593b387f1877328e",
"assets/assets/eventend.png": "4c82f6ba59c4517bc09f8c4d0ccde036",
"assets/assets/expo.svg": "b8a78ee4814b1d28a99bab524ab18361",
"assets/assets/face.png": "afd00eea08977455522e46ac65de87a4",
"assets/assets/ffwpu.png": "10b8e5d0ed11f18610ec846f95b74e0d",
"assets/assets/figma.svg": "e4d477f4b50ca750010cc10c5a5bbb53",
"assets/assets/findMe.png": "6331f2a997aa31169a1f832f21aa6115",
"assets/assets/flutter.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/assets/github.svg": "c31dcc2633c4b99013595d5ddce9697e",
"assets/assets/javascript.svg": "ae3d7b8293d2ad6bcc3047fc5792d215",
"assets/assets/linkedin.svg": "5100826d208b6c173e599d9463b36dcf",
"assets/assets/mmu.png": "fc5bb5a4468df6900d66556525a84c2a",
"assets/assets/node.png": "5b38d2335d9870bc95b6403b9e01bd1f",
"assets/assets/nodejs.svg": "ddd3342cd4917adc644ff531e3ec945d",
"assets/assets/photoshop.svg": "25ad5390ba6cce267ef0740b584c91f1",
"assets/assets/pinterest.svg": "3aa1a46860d996e3a01563ee676e08a8",
"assets/assets/profile.png": "a53af84600996148a03020fbe14a26fe",
"assets/assets/project.png": "5b7610f851ff5e75cc57f9542b2915dc",
"assets/assets/python.svg": "85368627053aa7df8e1340c0f29acdb8",
"assets/assets/react.svg": "f0340143227cc3546b667fd9c4d1e1d8",
"assets/assets/status.png": "fbee608489ea0f9031534b2e08be5b1a",
"assets/assets/tensorflow.svg": "706632becdc8402b77f67bf50e6a0da5",
"assets/assets/twitter.svg": "37caa6621fbf99d618c438b5a3c3ca5e",
"assets/assets/yetublog.png": "93154e55110127946bb211c475782558",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "c988feca268fe335a80c14eb3823017c",
"assets/NOTICES": "d821d923686254f430ac909d709988bc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "9d30accd58f53adf3afaac02f45d0087",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "a0d4a6d0517ba596bd2f190d7774faad",
"icons/Icon-512.png": "9147d943950f70a04abb7fb6597a07a5",
"icons/Icon-maskable-192.png": "a0d4a6d0517ba596bd2f190d7774faad",
"icons/Icon-maskable-512.png": "9147d943950f70a04abb7fb6597a07a5",
"index.html": "78f7afc4f31004126e89fda290f3860b",
"/": "78f7afc4f31004126e89fda290f3860b",
"main.dart.js": "25638e446248847f898b92f3997b0d12",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "96fcfd96208c77d7d003a5e6cc5c72bd"};
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
