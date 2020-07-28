test('Can mount app', () => {
  document.body.innerHTML =
    '<div id="app">' +
    '</div>'

  // Executes main file
  require('../../src/main')

  const pElement = document.getElementById('main-content')
  expect(pElement).toBeTruthy()
  const expectedContent = 'Test Phrase:'
  expect(pElement.textContent.trim().startsWith(expectedContent)).toBe(true)
})
