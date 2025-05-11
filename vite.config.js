import { defineConfig } from 'vite';
import { resolve } from 'path';
import fs from 'fs';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
  plugins: [vue()],
  server: {
    port: 4999
  },
  define: {
    'process.env': {}
  }
}); 