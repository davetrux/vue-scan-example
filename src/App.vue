<template>
  <div id="app">
    <div class="header">
      <div class="logo"><img src="./assets/logo.jpeg" alt="Confiturator Logo" /></div>
      <div class="subtitle">CatchPhrase!</div>
      <div class="techlogo"><img src="./assets/vue-logo.png" alt="Vue Logo" /></div>
    </div>
    <div id="main-content" class="content">
      Test Phrase: {{ phrase }}!
    </div>
  </div>
</template>

<script>
export default {
  name: 'App',
  data: function () {
    return {
      phrase: 'Not Configured'
    }
  },
  created () {
    if (process.env.VUE_APP_TEST_PHRASE !== undefined) {
      this.phrase = process.env.VUE_APP_TEST_PHRASE
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.header {
  display: flex;
  align-items: center;
  background: #E79115;
  border-bottom: 25px solid #2E2929;
  border-radius: 15px;
}
.logo {
  flex: 1;
}
.logo img {
  margin-left: 25px;
  margin-top: 10px;
}
.techlogo {
  flex: 1;
  text-align: center;
}
.techlogo img {
  background: white;
  height: 125px;
  padding: 5px;
  border-radius: 15px;
}
.subtitle {
  font-size: 2.5rem;
  vertical-align: middle;
  text-align: center;
  font-weight: 500;
  flex: 3;
}
.content {
  text-align: center;
  font-size: 2.0rem;
  padding-top: 25px;
}
</style>
