import { defineConfig } from 'vite';
import laravel, { refreshPaths } from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/css/app.css',
                'resources/js/app.js',
            ],
            refresh: [
                ...refreshPaths,
                'app/Http/Livewire/**',
            ],
        }),
    ],
    server: {
        host: '0.0.0.0',
        port: 3000,
        open: false,
     }
    /* server: {
        host: true,
        port: 5173,
        // strictPort: true,
    } */
    /* server: {
        host: true,
        port: 5173,
        hmr: {
            host: '0.0.0.0'
        },
    }, */
});
