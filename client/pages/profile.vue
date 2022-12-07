<template>
  <div class="mt-5 container">
    <div class="col-8 m-auto border">
      <div class="p-4">
        <img src="~/assets/default.png" alt="" class="rounded-circle" style="width: 100px; height: 100px;">
        <button class="btn btn-info ml-4 rounded-pill">Edit Image</button>
        <button class="btn btn-outline-danger ml-4 rounded-pill">Delete</button>
        <form @submit.prevent="profileChange" class="mt-3">
          <div>
            <label for="">Name</label>
            <input type="text" class="form-control col-6" v-model="user.name">
          </div>
          <div class="my-3">
            <label for="">Email</label>
            <input type="text" class="form-control col-6" disabled v-model="user.email">
          </div>
          <div>
            <label for="">Phone</label>
            <input type="number" class="form-control col-6" v-model="user.phone">
          </div>
          <div class="my-3">
            <label for="">Address</label>
            <textarea name="" id="" rows="4" class="form-control" v-model="user.address"></textarea>
          </div>
          <div class="d-flex justify-content-between">
            <a href="#">Change Password</a>
            <button class="btn btn-primary rounded-pill">Save</button>
          </div>
        </form>
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
        address: ''
      },
      errors: [],
      errorMessage: false
    }
  },
  methods: {
    profileChange(){
      this.$axios.put(`/users/${this.user.id}`, this.user)
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
        this.errors = error.response.data.error
        this.$notify({
          title: 'Fail',
          text: 'Something went wrong. Please try again',
          type: 'warn'
        })
      })
    }
  },
  mounted() {
    
    this.$axios.get('/profile')
    .then(response => {
      this.user = response.data
    })
  }
}
</script>
