<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <button v-on:click="load">Load something</button>
    <p v-if="loaded">{{ loadedContent }}</p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'hello',
  data() {
    return {
      loaded: false,
      loadedContent: 'nah',
      msg: 'Welcome to Your Vue.js App',
    };
  },
  methods: {
    load() {
      const endpoint = 'https://raw.githubusercontent.com/e0/dotfiles/master/vimrc';

      axios.get(endpoint)
        .then((response) => {
          this.loaded = true;
          this.loadedContent = response.data;
        })
        .catch((error) => {
          this.loaded = true;
          this.loadedContent = error.message;
        });
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
