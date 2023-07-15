module.exports = {
  root: true,
  parser: "@typescript-eslint/parser",
  parserOptions: {
    ecmaVersion: 2021,
    sourceType: "module",
    project: "./tsconfig.json",
  },
  plugins: ["@typescript-eslint", "prettier", "import"],
  extends: ["eslint:recommended", "plugin:@typescript-eslint/recommended", "plugin:prettier/recommended"],
  rules: {
    "max-lines": ["error", { max: 120 }],
    "prettier/prettier": ["error", { semi: true }],
    "@typescript-eslint/quotes": ["error", "double"],
    "@typescript-eslint/no-namespace": "off",
    "no-useless-constructor": "off",
    "@typescript-eslint/no-require-imports": "error",
    "@typescript-eslint/no-non-null-assertion": "off",
    "@typescript-eslint/explicit-member-accessibility": [
      "error",
      {
        accessibility: "explicit",
        overrides: {
          constructors: "no-public",
        },
      },
    ],
    "no-restricted-imports": [
      "error",
      {
        patterns: ["../*", "./*"],
      },
    ],
    "@typescript-eslint/no-implicit-any-catch": "off",
    "@typescript-eslint/no-explicit-any-catch": "off",
    "@typescript-eslint/no-implicit-any": "off",
    "@typescript-eslint/no-explicit-any": "off",
    "@typescript-eslint/no-empty-interface": "off",
    "@typescript-eslint/explicit-function-return-type": "error",
    "@typescript-eslint/no-unused-vars": "error",
  },
};