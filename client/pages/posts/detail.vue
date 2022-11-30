<template>
  <div class="container">
    <div class="row mt-5">
      <div class="col-8">
        <img src="~/assets/default.png" alt="---" style="width: 500px">
      </div>
      <div class="col-4 border">

      </div>
    </div>
    <div class="my-5">
      <nav class="navbar navbar-expand-lg navbar-light">
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item mx-4">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled">Disabled</a>
          </li>
        </ul>
      </div>
    </nav>
    <ul class="d-block">
      <li v-for="index in 7" :key="index" class="my-3">test data</li>
    </ul>
    </div>
    <div>
      <h3 class="text-center mb-5">Related Post</h3>
      <div class="row">
        <div v-for="index in 4" :key="index.id" class="col-3 mb-4">
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
  
}
</script>
