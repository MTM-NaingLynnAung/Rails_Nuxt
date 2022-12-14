<template>
  <div class="mt-5 container">
    <div class="col-8 m-auto border">
      <div class="p-4">
        <div class="d-inline">
          <b-img v-if="imageUrl" :src="imageUrl" fluid alt="Responsive image" class="rounded-circle" style="width: 100px; height: 100px;"></b-img>
          <b-img v-else-if="image" :src="url(image.src.url)" alt="..." class="rounded-circle" style="width:100px;height:100px;" v-show="imageUrl == null"></b-img>
          <b-img v-else src="~/assets/default.png" fluid alt="Responsive image" class="rounded-circle" style="width: 100px; height: 100px;"></b-img>
        </div>
        <button class="btn btn-info ml-4 rounded-pill">
          <label for="image" class="mb-0 pointer">Edit Image</label>
        </button>
        <b-form-file v-model="user.image" class="hidden" plain @change="uploadImage" id="image"></b-form-file>
        <div v-if="errorMessage">
            <span class="text-danger" v-for="error in errors['image.src']" :key="error"> {{ error }}</span>
          </div>
        <form @submit.prevent="profileChange" class="mt-3">
          <div>
            <label for="">Name</label>
            <input type="text" class="form-control col-6" v-model="user.name">
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.name" :key="error"> Name {{ error }}</span>
            </div>
          </div>
          <div class="my-3">
            <label for="">Email</label>
            <input type="text" class="form-control col-6" disabled v-model="user.email">
          </div>
          <div>
            <label for="">Phone</label>
            <input type="text" class="form-control col-6" v-model="user.phone">
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.phone" :key="error"> Phone {{ error }}</span>
            </div>
          </div>
          <div class="my-3">
            <label for="">Address</label>
            <textarea name="" id="" rows="4" class="form-control" v-model="user.address"></textarea>
            <div v-if="errorMessage">
              <span class="text-danger" v-for="error in errors.address" :key="error"> Address {{ error }}</span>
            </div>
          </div>
          <div class="d-flex justify-content-between">
            <a href="javascript:void(0)" data-toggle="modal" data-target="#staticBackdrop">Change Password</a>
            <button class="btn btn-primary rounded-pill">Save</button>
          </div>
        </form>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Change Password</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" @click="close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="" @submit.prevent="changePass">
                  <div class="form-group">
                    <label>Old Password</label>
                    <input type="password" class="form-control" placeholder="Old Password" v-model="passwords.old_pass">
                    <div v-if="errorMessage">
                      <span class="text-danger"> {{ errors.error }}</span>
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" placeholder="New Password" v-model="passwords.password">
                    <div v-if="errorMessage">
                      <span class="text-danger" v-for="error in errors.password" :key="error"> Password {{ error }}</span>
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Confirm Password</label>
                    <input type="password" class="form-control" placeholder="Confirm Password" v-model="passwords.password_confirmation">
                    <div v-if="errorMessage">
                      <span class="text-danger" v-for="error in errors.password_confirmation" :key="error"> Password Confirmation {{ error }}</span>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between">
                    <button type="button" class="btn btn-outline-secondary rounded-pill" data-dismiss="modal" @click="close">Close</button>
                    <button class="btn btn-primary rounded-pill" :disabled="!passwords.old_pass">Change</button>
                  </div>
                </form>
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
  data(){
    return {
      user: {
        id: '',
        name: '',
        email: '',
        phone: '',
        address: '',
        image: []
      },
      passwords: {
        old_pass: '',
        password: '',
        password_confirmation: '',
      },
      errors: [],
      errorMessage: false,
      imageUrl: null,
      image: null
    }
  },
  methods: {
    profileChange(){
      let formData = new FormData()
      for (let [key, value] of Object.entries(this.user)) {
        formData.append(key, value)
      }
      this.$axios.put(`/users/${this.user.id}`, formData)
      .then(response => {
        this.$router.push('/profile')
        this.errorMessage = false
        this.$notify({
          title: 'Success',
          text: 'Profile updated successfully'
        })
      })
      .catch(error => {
        this.errorMessage = true
        this.errors = error.response.data
        this.$notify({
          title: 'Fail',
          text: 'Something went wrong. Please try again',
          type: 'warn'
        })
      })
    },
    uploadImage(e){
      let file = e.target.files[0]
      this.imageUrl = URL.createObjectURL(file)
    },
    url(image){
      return `http://127.0.0.1:8080${image}`
    },
    changePass(){
      this.$axios.post('/users/change_password', this.passwords)
      .then(response => {
        this.$router.push('/profile')
        this.errorMessage = false
        this.$notify({
          title: 'Success',
          text: 'Password changed successfully'
        })
      })
      .catch(error => {
        console.log(error.response.data)
        this.errorMessage = true
        this.errors = error.response.data
        this.$notify({
          title: 'Fail',
          text: 'Something went wrong. Please try again',
          type: 'warn'
        })
      })
    },
    close(){
        this.passwords.old_pass = this.passwords.password = this.passwords.password_confirmation = ''
        this.errorMessage = false
      }
  },
  mounted() {
    
    this.$axios.get('/profile')
    .then(response => {
      this.user = response.data.user
      this.image = response.data.image
    })
  }
}
</script>
<style>
  .pointer {
    cursor: pointer;
  }
  .hidden {
    display: none;
  }
</style>
