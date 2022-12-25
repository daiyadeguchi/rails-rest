<script>
import axios from 'axios'
export default {
  el: '#app',
  data () {
    return {
      info: null,
      loading: true,
      errored: false
    }
  },
  mounted () {
    axios
      .get("http://localhost:3000/api/v1/users")
      .then(response => {
        this.info = response.data
        console.log(this.info)
      })
      .catch(error => {
        console.log(error)
        this.errored = true
      })
      .finally(() => this.loading = false)
  }
}
</script>

<template>
  <main>
    <div id="app">
      <section v-if="errored">
        <p>Error occured</p>
      </section>
      <section v-else>
        <div v-if="loading">Loading...</div>
        <div v-else v-for="user in info">
          {{ user.username }}
        </div>
      </section>
    </div>
  </main>
</template>


