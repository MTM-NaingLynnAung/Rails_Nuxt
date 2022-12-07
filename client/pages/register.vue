<template>
  <div>
    <h3 class="my-3 text-center">Register</h3>
    <form class="col-3 m-auto" @submit.prevent="register">
      <div class="form-group">
        <label>Name</label>
        <input type="text" class="form-control" v-model="user.name">
         <div v-if="errorMessage">
            <span class="text-danger" v-for="error in errors.name" :key="error"> Name {{ error }}</span>
          </div>
      </div>
      <div class="form-group">
        <label>Email address</label>
        <input type="email" class="form-control" v-model="user.email">
         <div v-if="errorMessage">
            <span class="text-danger" v-for="error in errors.email" :key="error"> Email {{ error }}</span>
          </div>
      </div>
      <div class="form-group">
        <label>Password</label>
        <input type="password" class="form-control" v-model="user.password">
         <div v-if="errorMessage">
            <span class="text-danger" v-for="error in errors.password" :key="error"> Password {{ error }}</span>
          </div>
      </div>
      <div class="form-group">
        <label>Confirm Password</label>
        <input type="c_password" class="form-control" v-model="user.password_confirmation">
         <div v-if="errorMessage">
            <span class="text-danger" v-for="error in errors.password_confirmation" :key="error"> Password Confirmation {{ error }}</span>
          </div>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
</template>

<script>
export default {
  auth: 'guest',
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      },
      errors: [],
      errorMessage: false
    }
  },
  methods: {
    register(){
      this.$axios.post('/users', this.user)
      .then(response => {
        this.errorMessage = false
        this.$notify({
          title: 'Success',
          text: 'Successfully created'
        });
        this.$router.push('/login')
      })
      .catch(error => {
        console.log(error.response.data)
        this.errors = error.response.data
        this.errorMessage = true
        this.$notify({
          title: 'Fail',
          text: 'Something went wrong. Please try again',
          type: 'error'
        });
      })
    }
  }
  
}
</script>
