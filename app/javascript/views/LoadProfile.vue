<template>
  <div>
    <div class="profile">
      <div class="card" aria-id="contentIdForA11y3" style="width: 50%">
        <div
          class="card-header"
          role="button"
          aria-controls="contentIdForA11y3"
        >
          <p class="card-header-title">
            <template>Load Profile</template>
          </p>
        </div>
        <div class="card-content">
          <div class="content">
            <template>
              <b-field label="Select profile">
                <b-autocomplete
                  v-model="name"
                  placeholder="e.g. jondoe"
                  :keep-first="keepFirst"
                  :open-on-focus="openOnFocus"
                  :data="filteredDataObj"
                  field="name"
                  @select="(option) => (selected = option)"
                  :clearable="clearable"
                >
                </b-autocomplete>
              </b-field>
            </template>
          </div>
        </div>
        <footer class="card-footer">
          <div class="card-footer-item">
            <b-button type="is-success" outlined @click="loadProfile" style="width: 30%"
              >Load</b-button
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
      keepFirst: false,
      openOnFocus: false,
      name: "",
      selected: null,
      clearable: false,
      data: [],
    };
  },
  mounted() {
    axios
      .get("/profiles")
      .then((res) => {
        this.data = res.data.profiles;
      })
      .catch((err) => {});
  },

  computed: {
    filteredDataObj() {
      return this.data.filter((option) => {
        return (
          option.name
            .toString()
            .toLowerCase()
            .indexOf(this.name.toLowerCase()) >= 0
        );
      });
    },
  },
  methods: {
    loadProfile() {
      if(this.selected) {
        this.$router.push(`/folders/${this.selected["id"]}`)
      } else {
        this.$buefy.toast.open({
            message: "Please select profile to load!",
            type: "is-danger",
        });
      }
    },
  },
};
</script>
<style scoped>
.profile {
  display: flex;
  justify-content: center;
  width: 100%;
  margin-top: 20px;
}
.btn-home {
  margin: 10px;
}
</style>
