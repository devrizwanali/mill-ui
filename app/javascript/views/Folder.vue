<template>
  <div class="container" style="margin-top: 50px;">
    <div class="columns is-desktop">
      <div class="column is-four-fifths" >
        <div class="box">
          <article class="media">
            <div class="media-content">
              <div class="content">
                <p>
                  <strong>Folders</strong>
                <hr>
                <div v-if="folders.length > 0"  style="display: flex;">
                  <template v-for="folder in folders">
                   <div class="folder" @click="openFolder(folder)">
                     <div style="border: 1px dashed #ccc; display: flex;justify-content: center;">
                     <img src="./../assets/img/folder-open-solid.svg" alt="" style="width: 70px;">
                   </div>
                     <span style="">{{folder.name}}</span>
                   </div>
                  </template>
                </div>
                <h1 v-else>No folders to show. create now.!</h1>
                </p>
              </div>
            </div>
          </article>
        </div>
      </div>
      <div class="column">
        <b-field
          label="Foldr name"
          label-position="on-border"
          :type="hasError? 'is-danger' : null"
          :message="hasError ? message : null"
          >
          <b-input v-model="name" placeholder="e.g my folder"></b-input>
          <b-button type="is-success" outlined @click="saveFolder" >Create</b-button>
        </b-field>
          <b-button type="is-success" outlined @click="createGasket" style="width: 100%">Create Gasket</b-button>

      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data() {
    return {
      name: "",
      message: "name is required",
      folders: [],
      hasError: false
    };
  },
  mounted() {
    axios.get(`/folders?id=${this.$route.params.id}`)
      .then(res => {
        this.folders = res.data.folders
      })
      .catch(err => {
        this.$buefy.toast.open({
          message: err.message,
          type: "is-danger",
        });
      })
  },
  methods: {
    saveFolder() {
      if (this.name) {
        axios.post(`/folders?id=${this.$route.params.id}`, { folder: {name: this.name}})
        .then(res => {
          this.$buefy.toast.open({
            message: "Folder successfully created!",
            type: "is-success",
          });
          this.folders.push(res.data.folder)
        })
        .catch(err => {
          this.$buefy.toast.open({
            message: err.message,
            type: "is-success",
          });
        })
      } else {
        this.hasError = true;
      }
    },
    openFolder(folder) {
      this.$router.push(`/files/${folder.id}`)
    },
    createGasket() {
      this.$router.push('/gasket')
    }
  }
};
</script>
<style scoped>
.folder {
  width: 10%;
  cursor: pointer;
  margin-right: 20px;
  margin-bottom: 20px;
  text-align: center;
}
</style>
