<template>
  <div>
    <div class="profile">
      <div class="card" aria-id="contentIdForA11y3" style="width: 90%;">
        <div
          class="card-header"
          role="button"
          aria-controls="contentIdForA11y3"
        >
          <p class="card-header-title">
            <template
              >Create Profile</template
            >
          </p>
        </div>
        <div class="card-content">
          <div class="content">
            <template>
              <b-field
                label="Username"
                label-position="on-border"
                :type="hasError ? 'is-danger' : null"
                :message="hasError ? message : null"
              >
                <b-input v-model="username" placeholder="e.g John doe"></b-input>
              </b-field>
            </template>
          </div>
        </div>
        <footer class="card-footer">
          <div class="card-footer-item">
            <b-button type="is-success" outlined @click="saveProfile" style="width: 30%"
              >Save</b-button
            >
          </div>
        </footer>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      username: "",
      message: "Username is required",
      hasError: false
    };
  },
  methods: {
    saveProfile() {
      if (this.username) {
        const user = { name: this.username };
        axios
          .post("/profiles", { profile: user })
          .then(res => {
            this.$buefy.toast.open({
              message: "Profile successfully created!",
              type: "is-success"
            });
            this.$router.push(`/folders/${res.data.profile.id}`);
          })
          .catch(err => {
            this.$buefy.toast.open({
              message: err.message,
              type: "is-danger"
            });
          });
      } else {
        this.hasError = true;
      }
    }
  }
};
</script>
<style scoped>
  .profile {
    display: flex;
    justify-content: center;
    width: 80%;
    margin-top: 40px;
  }
  .btn-home {
    margin: 10px;
  }

  .profile:hover {
    z-index: 10;
    width: 100%;
    height: 90%;
  }
</style>
