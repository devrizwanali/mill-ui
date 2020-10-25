<template>
  <div>
    <b-navbar>
      <template slot="brand">
        <b-navbar-item tag="router-link" :to="{ path: '/' }">
          <img
            src="https://www.rkdengineering.com/assets/img/RKD_Alternative.png"
            alt="Lightweight UI components for Vue.js based on Bulma"
          />
        </b-navbar-item>
      </template>
      <template slot="start">
        <b-navbar-item href="#" tag="router-link" :to="{ path: '/' }"> Home </b-navbar-item>
        <b-navbar-item href="#"> Documentation </b-navbar-item>
        <b-navbar-dropdown label="Info">
          <b-navbar-item href="#"> About </b-navbar-item>
          <b-navbar-item href="#"> Contact </b-navbar-item>
        </b-navbar-dropdown>
      </template>

      <template slot="end">
        <b-navbar-item tag="div">
          <div class="buttons">
            <b-button @click="create">
              <strong>Create New Profile</strong>
            </b-button>
            <a class="button is-light" @click="loadProfile"> Load Profile </a>
          </div>
        </b-navbar-item>
      </template>
    </b-navbar>
    <router-view />
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  props: {
    msg: String
  },

  methods: {
    create() {
      //this.$buefy.notification.open('Clicked!!')
      this.$router.push({ name: "CreateNewProfile" });
    },
    loadProfile() {
      this.$router.push({ name: "LoadProfile" });
    }
  }
};
</script>

<style scoped>
h3 {
  margin: 40px 0 0;
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
