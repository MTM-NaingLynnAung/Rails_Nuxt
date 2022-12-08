<template>
<div>
  <div class="jumbotron jumbotron-fluid mb-0">
    <div class="container">
      <h1 class="display-4">Fluid jumbotron</h1>
      <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
    </div>
  </div>
  <div style="margin-top: -20px;">
    <div class="col-4 d-flex justify-content-center m-auto">
      <input type="search" class="form-control mr-3">
      <button class="btn btn-primary">Search</button>
    </div>
  </div>
  <div class="container">
    <h3 class="text-center my-5">Latest Post</h3>
    <div class="row">
      <div v-for="post in posts" :key="post.id" class="col-4 mb-4">
        <div class="card">
          <img src="~/assets/default.png" class="card-img-top" alt="...">
          <div class="card-body">
            <NuxtLink :to="`/posts/detail/${post.id}`"><h5 class="card-title">{{ post.manufacture }} ( {{ post.car_model }} ) </h5></NuxtLink>
            <div v-if="post.price">
              <h4 class="text-success"> {{ post.price }} Lakhs </h4>
            </div>
            <div v-else>
              <h4 class="text-success">Negotiate</h4>
            </div>
            <div class="row bg-light">
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
  </div>
</div>
</template>

<script>

export default {
  middleware: 'auth',
  data() {
    return {
      posts: []
    }
    
  },
  methods: {
      
  },
  mounted() {
    this.$axios.get('/posts')
    .then(response => {
      this.posts = response.data
    })
  }
}
</script>
