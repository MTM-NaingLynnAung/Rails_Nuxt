<template>
<div>
  <div class="jumbotron jumbotron-fluid mb-0">
    <div class="container" style="height:160px">
      
    </div>
  </div>
  <div style="margin-top: -20px;">
    <form class="col-4 d-flex justify-content-center m-auto" @submit.prevent="postLists(currentPage)">
      <input type="search" class="form-control mr-3" v-model="search" placeholder="Find with model" style="height:45px">
      <button class="btn btn-primary">Search</button>
    </form>
  </div>
  <div class="container">
    <h3 class="text-center my-5">Latest Post</h3>
    <div class="row">
      <div v-for="post in posts" :key="post.id" class="col-4 mb-4">
        <div class="card" @click="detail(post.id)">
          <div v-for="image in post.images" :key="image.id">
            <img :src="imageUrl(image.src.url)" alt="..." class="card-img-top">
          </div>
          <div class="card-body">
            <NuxtLink :to="`/posts/detail/${post.id}`" class="nuxt-link"><h5 class="card-title">{{ post.manufacture }} ( {{ post.car_model }} ) </h5></NuxtLink>
            <div v-if="post.price">
              <h4 class="text-success"> {{ post.price }} Lakhs </h4>
            </div>
            <div v-else>
              <h4 class="text-success">Negotiate</h4>
            </div>
            <div class="row bg-light mt-3">
              <div class="col-6">
                <span><font-awesome-icon icon="gas-pump" /></span>
                <span class="card-text">{{ post.fuel_type }}</span>
              </div>
              <div class="col-6">
                <span><font-awesome-icon icon="sun" /></span>
                <span class="card-text">{{ post.transmission }}</span>
              </div>
              <div class="col-12 mt-2">
                <p class="card-text">{{ post.created_at }}</p>
              </div>
            </div>
            <hr>
            <div class="">
              <img src="~/assets/default.png" alt="Profile" width="40px" height="40px" class="rounded-circle">
              <p class="d-inline ml-3">{{ post.user }}</p>
            </div>
            
          </div>
        </div>
      </div>
    </div>
    <div class="d-flex justify-content-center">
      <img src="~/assets/not_found.jpg" alt="No Post Here" v-if="!posts.length && search.length" style="width:50%">
    </div>
  </div>
   <b-pagination
   v-show="rows > perPage"
      v-model="currentPage"
      :total-rows="rows"
      :per-page="perPage"
      prev-text="« Previous"
      next-text="Next »"
      :hide-goto-end-buttons="true"
      limit="1"
      align="center"
      @input="postLists(currentPage)"
    ></b-pagination>
</div>
</template>

<script>

export default {
  middleware: 'auth',
  data() {
    return {
      posts: [],
      search: "",
      currentPage: 1,
      rows: null,
      perPage: null,
    }
    
  },
  methods: {
    postLists(page = 1){
      this.$axios.get(`/posts/?page=${page}&search=${this.search}`)
        .then(response => {
          this.rows = response.data.pagy.count
          this.currentPage = response.data.pagy.page
          this.perPage = response.data.pagy.items
          this.posts = response.data.posts
        })
    },
    detail(id){
      this.$router.push(`posts/detail/${id}`)
    },
    imageUrl(image){
      return `http://127.0.0.1:8080${image}`
    }
    
  },
  mounted() {
    this.postLists()
  }
}
</script>
<style>
  .card:hover{
    cursor: pointer;
  }
  .nuxt-link:hover {
    text-decoration: none;
    color: #008A63;
  }
  .nuxt-link {
    color: #000;
  }
  .jumbotron {
    background-image: url('~/assets/lam.jpg');
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
  }
  .page-item:nth-child(2) {
    display: none;
  }

</style>
