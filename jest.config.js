module.exports = {
  preset: '@vue/cli-plugin-unit-jest',
  reporters: ['default', 'jest-junit'],
  collectCoverage: false,
  coverageDirectory: 'coverage',
  collectCoverageFrom: ['**/src/**/*.{js,vue}', '!**/node_modules/**', '!**/vendor/**', '!**/tests/**', '!**/config/**', '!*.config.js', '!gulpfile.js', '!**/store/index.js', '!**/router/index.js'],
  coverageReporters: ['text-summary', 'lcov']
}
