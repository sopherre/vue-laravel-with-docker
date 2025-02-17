export default defineConfig({
    server: {
      proxy: {
        "/api": {
          target: "http://localhost",
          changeOrigin: true,
          secure: false,
        },
      },
    },
  });