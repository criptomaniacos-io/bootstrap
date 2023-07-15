/* eslint-disable no-undef */
// eslint-disable-next-line @typescript-eslint/no-require-imports, @typescript-eslint/no-var-requires
const esbuild = require("esbuild");

esbuild
  .build({
    entryPoints: ["src/main/index.ts"],
    outfile: "dist/server.js",
    bundle: true,
    platform: "node",
    target: "es2020",
    sourcemap: true,
    external: [],
    plugins: [],
    logLevel: "info",
    tsconfig: "./tsconfig.json",
    alias: {
      "@": "./src",
      "#": "./",
    },
  })
  // eslint-disable-next-line no-undef
  .catch(() => process.exit(1));