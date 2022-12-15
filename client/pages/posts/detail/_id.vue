<template>
  <div class="container">
    <div class="d-flex justify-content-end align-items-center mt-3">
      <NuxtLink :to="`/posts/edit/${post_id}`" class="btn btn-primary rounded-pill px-4">
      <font-awesome-icon icon="pen-to-square" />
      Edit</NuxtLink>
      <button class="ml-2 trash" @click="destroy(post_id)">
        <font-awesome-icon icon="trash-can" class="text-danger" />
      </button>
    </div>
    <div class="row mt-5">
      <div class="col-lg-8 col-12 mb-3">
        <div v-for="image in post.images" :key="image.id">
          <img :src="imageUrl(image.src.url)" alt="..." class="card-img-top image-size">
        </div>
      </div>
      <div class="col-lg-4 col-12 border p-3">
        <div class="d-flex justify-content-between">
          <h5 class="mt-2">{{ post.manufacture }} ( {{ post.car_model }} )</h5>
          <p class="text-success bg-light p-2 rounded-pill">{{ post.condition }}</p>
        </div>
        <div v-if="post.price">
          <h4 class="text-success"> Price - {{ post.price }} Lakhs </h4>
        </div>
        <div v-else>
          <h4 class="text-success">Price - Negotiate</h4>
        </div>
        <hr>
        <div class="mb-2">
          <b-img v-if="post.image" :src="imageUrl(post.image.src.url)" class="rounded-circle" style="width:30px;height:30px;"></b-img>
          <b-img v-else src="~/assets/default.png" fluid alt="Responsive image" class="rounded-circle" style="width:30px;height:30px;"></b-img>
          <p class="d-inline ml-5">{{ post.user }}</p>
        </div>
        <div class="mb-2" style="height:30px;">
          <font-awesome-icon icon="calendar-days" style="width:30px;height:25px" class="text-success" />
          <p class="d-inline ml-5">{{ post.created_at }}</p>
        </div>
        <div class="" style="height:40px;">
          <font-awesome-icon icon="location-dot" style="width:30px;height:25px" class="text-success" />
          <p class="d-inline ml-5">{{ post.address }}</p>
        </div>
        <a href="" class="btn btn-primary d-block mt-3 rounded-pill"><font-awesome-icon icon="phone" /> Call Now ({{ post.phone }})</a>
      </div>
    </div>
    <div class="my-5">

      <ul class="nav nav-tabs mb-5" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="detail-tab" data-toggle="tab" data-target="#detail" type="button" role="tab" aria-controls="detail" aria-selected="true">Detail</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="spec-tab" data-toggle="tab" data-target="#spec" type="button" role="tab" aria-controls="spec" aria-selected="false">Specification</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="desc-tab" data-toggle="tab" data-target="#desc" type="button" role="tab" aria-controls="desc" aria-selected="false">Description</button>
        </li>
      </ul>
      <div class="tab-content ml-4" id="myTabContent">
        <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab">
          <div class="row">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Plate Number</span>
            <span v-if="post.plate_number" class="col-4">{{ post.plate_number }}</span>
            <span v-else class="col-4">-</span>
          </div>
          <div class="row my-3">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Vehicle Identification Number</span>
            <span v-if="post.vin" class="col-4"> {{ post.vin }}</span>
            <span v-else class="col-4">-</span>
          </div>
          <div class="row my-3">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Color</span>
            <span v-if="post.color" class="col-4"> {{ post.color }}</span>
            <span v-else class="mr-4 col-4">-</span>
          </div>
          <div class="row my-3">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Number of Seats</span>
            <span v-if="post.seat" class="col-4"> {{ post.seat }}</span>
            <span v-else class="col-4">-</span>
          </div>
          <div class="row my-3">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Number of Doors</span>
            <span v-if="post.door" class="col-4"> {{ post.door }}</span>
            <span v-else class="col-4">-</span>
          </div>
        </div>
        <div class="tab-pane fade" id="spec" role="tabpanel" aria-labelledby="spec-tab">
          <div class="row">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Build Type</span>
            <span v-if="post.build_type" class="col-4"> {{ post.build_type }}</span>
            <span v-else class="col-4">-</span>
          </div>
          <div class="row my-3">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Trim Name</span>
            <span v-if="post.trim_name" class="col-4"> {{ post.trim_name }}</span>
            <span v-else class="col-4">-</span>
          </div>
          <div class="row my-3">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Engine Power</span>
            <span class="col-4" v-if="post.engine_power"> {{ post.engine_power }}</span>
            <span v-else class="col-4">-</span>
          </div>
          <div class="row my-3">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Steering Position</span>
            <span class="col-4" v-if="post.steering_position"> {{ post.steering_position }}</span>
            <span class="col-4" v-else>-</span>
          </div>
          <div class="row my-3">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Fuel Type</span>
            <span class="col-4" v-if="post.fuel_type"> {{ post.fuel_type }}</span>
            <span class="col-4" v-else>-</span>
          </div>
          <div class="row my-3">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Transmissions</span>
            <span class="col-4" v-if="post.transmission"> {{ post.transmission }}</span>
            <span class="col-4" v-else>-</span>
          </div>
          <div class="row my-3">
            <span class="col-1"><font-awesome-icon icon="circle-check" style="width:20px;height:20px" class="text-success" /></span>
            <span class="col-4">Manufacture Year</span>
            <span class="col-4" v-if="post.year"> {{ post.year }}</span>
            <span class="col-4" v-else>-</span>
          </div>
        </div>
        <div class="tab-pane fade" id="desc" role="tabpanel" aria-labelledby="desc-tab">
          <div class="card-body">
            {{ post.description }}
          </div>
        </div>
      </div>
    </div>

    <div>
      <h3 class="text-center mb-5" v-if="posts.length">Related Post</h3>
      <div class="row">
        <div v-for="post in posts" :key="post.id" class="col-sm-12 col-md-6 col-lg-4  mb-4">
          <div class="card" @click="detail(post.id)">
            <div v-for="image in post.images" :key="image.id">
              <img :src="imageUrl(image.src.url)" alt="..." class="card-img-top height">
            </div>
            <div class="card-body">
              <NuxtLink :to="`/posts/detail/${post.id}`" class="nuxt-link"><h5 class="card-title">{{ post.manufacture }} ( {{ post.car_model }} ) </h5></NuxtLink>
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
                <b-img v-if="post.image" :src="imageUrl(post.image.src.url)" class="rounded-circle" style="width:40px;height:40px;"></b-img>
                <b-img v-else src="~/assets/default.png" fluid alt="Responsive image" class="rounded-circle" style="width:40px;height:40px;"></b-img>
                <p class="d-inline ml-3">{{ post.user }}</p>
              </div>
              
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="d-flex justify-content-center mb-5" v-if="posts.length > 3">
      <NuxtLink to="/" class="btn btn-outline-primary">View More</NuxtLink>
    </div>

  </div>
</template>
<script>

export default {
  data() {
    return{
      post: [],
      posts: [],
      post_id: this.$route.params.id
    }
  },
  methods: {
    detail(id){
      this.$router.push('/posts/detail/'+id)
    },
    destroy(id) {
      this.$bvModal.msgBoxConfirm('Are you Sure to Delete.', {
        title: 'Please Confirm',
        okVariant: 'danger',
        okTitle: 'YES',
        cancelTitle: 'NO',
        footerClass: 'p-2',
        hideHeaderClose: false,
        centered: true
        })
        .then(value => {
          if (value == true) {
            this.$axios.delete('/posts/' + id)
              .then(response => {
                this.$router.push('/')
                this.$notify({
                  title: 'Success',
                  text: 'Post delete successfully'
                })
              })
          }
        })
    },
    imageUrl(image){
      return `http://127.0.0.1:8080${image}`
    }
  },
  mounted() {
    this.$axios.get(`/posts/${this.post_id}`)
    .then(response => {
      this.post = response.data.post
      this.posts = response.data.posts
    })
  }
}
</script>
<style scoped>
  .text-success {
    color: #008A63!important;
  }
  .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
    border: none;
    color: green;
    border-bottom: 1px solid green;
  }
  .nav-tabs .nav-link:hover, .nav-tabs .nav-link:focus {
    border-bottom: 1px solid green;
  }
  .trash {
    border: none;
    border-radius: 50%;
    padding: 7px 12px;
    background: none;
  }
  .trash:hover {
    cursor: pointer;
    border-radius: 50%;
    padding: 7px 12px;
    background: rgb(254 242 242);
  }
  @media screen and (min-width: 991px) {
    .image-size {
      width: 500px;
      height: 300px;
    }
  }

</style>
