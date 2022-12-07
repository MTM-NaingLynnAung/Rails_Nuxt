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
      <div v-for="index in 7" :key="index.id" class="col-3 mb-4">
        <div class="card">
          <img src="~/assets/default.png" class="card-img-top" alt="...">
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
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
      posts: [
            {
              img: "~/assets/default.png",
              text: "Some quick example text to build on the card title and make up the bulk of the card's content."
            },
            
          ]
    }
    
  },
  methods: {
    
  }
}
</script>
