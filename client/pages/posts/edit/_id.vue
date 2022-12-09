<template>
  <div class="container mt-5">
    <div class="col-8 m-auto border p-4">
      <h3>Update Post</h3>
      <form @submit.prevent="update">
        <div class="mb-3">
          <label for="">Add Image</label>
          <input type="file" class="form-control col-5">
        </div>
        <div class="row">
          <div class="col-6">
            <label for="">Manufactures (Optional)</label>
            <select class="form-control" v-model="post.manufacture_id">
              <option selected :value="null">--Select--</option>
              <option :value="model.id" v-for="model in manufacture" :key="model.id">{{ model.name }}</option>
            </select>
            <div class="form-group mt-3" v-show="post.manufacture_id">
              <label for="">Models </label>
               <select class="form-control" v-model="post.car_model_id">
                <option selected :value="null">--Select--</option>
                <option :value="model.id" v-for="model in car_model" :key="model.id" selected v-show="model.manufacture_id == post.manufacture_id">{{ model.name }}</option>
              </select>
            </div>
          </div>
          <div class="col-6 mb-3">
            <label for="">Buid Type (Optional)</label>
            <select class="form-control" v-model="post.build_type_id">
              <option selected :value="null">--Select--</option>
              <option :value="type.id" v-for="type in build_type" :key="type.id">{{ type.name }}</option>
            </select>
          </div>
          <div class="col-6">
            <label for="">Trim Name (Optional)</label>
            <input type="text" class="form-control" v-model="post.trim_name" placeholder="Trim Name">
          </div>
          <div class="col-6 mb-3">
            <label for="">Engine Power (Optional)</label>
            <input type="text" class="form-control" v-model="post.engine_power" placeholder="Engine Power">
          </div>
          <div class="col-12 mb-3">
            <label for="" class="d-block">Car Condition</label>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Used" v-model="post.condition">
              <label class="form-check-label" for="inlineRadio1">Used</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="Brand New" v-model="post.condition">
              <label class="form-check-label" for="inlineRadio2">Brand New</label>
            </div>
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.condition" :key="error"> Condition {{ error }}</span>
            </div>
          </div>
          <div class="col-6">
            <label for="">Steering Position</label>
            <select class="form-control" v-model="post.steering_position">
              <option :value="null" selected>--Select--</option>
              <option>Left</option>
              <option>Right</option>
            </select>
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.steering_position" :key="error"> Steering Position {{ error }}</span>
            </div>
          </div>
          <div class="col-6 mb-3">
            <label for="">Transmissions</label>
            <select class="form-control" v-model="post.transmission">
              <option selected :value="null">--Select--</option>
              <option value="auto">Auto</option>
              <option value="manual">Manual</option>
              <option value="semi-auto">Semi Auto</option>
            </select>
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.transmission" :key="error"> Transmissions {{ error }}</span>
            </div>
          </div>
          <div class="col-6">
            <label for="">Fuel Type (Optional)</label>
            <select class="form-control" v-model="post.fuel_type">
              <option selected :value="null">--Select--</option>
              <option>Petrol</option>
              <option>CNG</option>
              <option>Diesel</option>
              <option>Electric</option>
            </select>
          </div>
          <div class="col-6 mb-3">
            <label for="">Manufacturer Year</label>
            <select class="form-control" v-model="post.year">
              <option selected :value="null">--Select--</option>
              <option value="2022">2022</option>
              <option value="2021">2021</option>
              <option value="2020">2020</option>
              <option value="2019">2019</option>
            </select>
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.year" :key="error"> Manufacture Year {{ error }}</span>
            </div>
          </div>
          <div class="col-6">
            <label for="">Price</label>
            <input type="text" class="form-control" v-model="post.price" :disabled="post.negotiate == true" placeholder="0">
          </div>
          <div class="col-6">
            <label for="" class="d-block">Negotiate</label>
            <input type="checkbox" value="true" v-model="post.negotiate">
          </div>
          <div class="col-6">
            <label for="">Color</label>
            <select class="form-control" v-model="post.color">
              <option :value="null" selected>--Select--</option>
              <option value="Black">Black</option>
              <option value="Blue">Blue</option>
              <option value="White">White</option>
              <option value="Red">Red</option>
              <option value="Green">Green</option>
            </select>
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.color" :key="error"> Color {{ error }}</span>
            </div>
          </div>
          <div class="col-6 mb-3">
            <label for="">Vehicle Identification Number (Optional)</label>
            <input type="text" class="form-control" v-model="post.vin" placeholder="Vehicle Identification Number">
          </div>
          <div class="col-6">
            <label for="">Plate Number</label>
            <input type="text" placeholder="1Z/1111" class="form-control" v-model="post.plate_number">
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.plate_number" :key="error"> Plate Number {{ error }}</span>
            </div>
          </div>
          <div class="col-6 mb-3">
            <label for="">Numbers Of Seats(Optional)</label>
            <input type="number" class="form-control" placeholder="0" v-model="post.seat">
          </div>
          <div class="col-6 mb-3">
            <label for="">Numbers Of Doors(Optional)</label>
            <input type="number" class="form-control" placeholder="0" v-model="post.door">
          </div>
          <div class="col-12 mb-3">
            <label for="">Description</label>
            <textarea name="" id="" rows="4" class="form-control" v-model="post.description"></textarea>
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.description" :key="error"> Description {{ error }}</span>
            </div>
          </div>
          <div class="col-12 mb-3">
            <label for="">Phone</label>
            <input type="text" class="form-control col-6" placeholder="09777999888" v-model="post.phone">
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.phone" :key="error"> Phone {{ error }}</span>
            </div>
          </div>
          <div class="col-12 mb-4">
            <label for="">Address</label>
            <textarea name="" id="" rows="4" class="form-control" v-model="post.address"></textarea>
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.address" :key="error"> Address {{ error }}</span>
            </div>
          </div>
        </div>
        <div class="d-flex justify-content-between">
          <NuxtLink :to="`/posts/detail/${post_id}`" class="btn btn-outline-dark">Back</NuxtLink>
          <button class="btn btn-primary">Update</button>
        </div>
      </form>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      post: {
        condition: '',
        trim_name: '',
        engine_power: '',
        steering_position: null,
        transmission: null,
        negotiate: '',
        fuel_type: null,
        color: null,
        price: '',
        vin: '',
        plate_number: '',
        seat: '',
        door: '',
        description: '',
        year: null,
        phone: '',
        address: '',
        manufacture_id: null,
        user_id: this.$auth.user.id,
        car_model_id: null,
        build_type_id: null,
      },
      manufacture: [],
      build_type: [],
      car_model: [],
      errors: [],
      errorMessage: false,
      post_id: this.$route.params.id
    }
  },
  methods: {
    update(){
      this.$axios.put(`/posts/${this.post_id}`, this.post)
      .then(response => {
        this.$router.push(`/posts/detail/${this.post_id}`)
        this.$notify({
          title: 'Success',
          text: 'Post updated successfully'
        })
        this.errorMessage = false
      })
      .catch(error => {
        this.errorMessage = true
        this.errors = error.response.data
        this.$notify({
          title: 'Fail',
          text: 'Something went wrong',
          type: 'error'
        })
       })
    }
  },
  mounted() {
    this.$axios.get(`/posts/edit/${this.post_id}`)
    .then(response => {
      this.post = response.data.post
      this.manufacture = response.data.manufacture
      this.build_type = response.data.build_type
      this.car_model = response.data.model
    })
  }
}
</script>
