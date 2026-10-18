// The app moved to /rust_particles/ (deployed from the rust_particles repo).
// This replaces the old cache-first worker for anyone who still has it installed:
// it drops its cache, unregisters itself and reloads open pages onto the redirect.
self.addEventListener('install', function () {
    self.skipWaiting();
});

self.addEventListener('activate', function (e) {
    e.waitUntil(
        caches.delete('egui-template-pwa').then(function () {
            return self.registration.unregister();
        }).then(function () {
            return self.clients.matchAll({ type: 'window' });
        }).then(function (clients) {
            clients.forEach(function (client) {
                client.navigate(client.url);
            });
        })
    );
});
