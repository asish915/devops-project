import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'

// https://vite.dev/config/
export default defineConfig({
  base: "./",             // 👈 Ensures relative paths for CSS/JS in index.html
  plugins: [react()],
})

