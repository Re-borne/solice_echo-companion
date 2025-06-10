self.addEventListener('install', (event) => {
  console.log('Echo Eyes installed.');
  self.skipWaiting();
});

self.addEventListener('fetch', (event) => {
  event.respondWith(fetch(event.request));
});
