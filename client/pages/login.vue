<template>
  <div>
    <h3 class="my-3 text-center">Login</h3>
    <form @submit.prevent="login" class="col-3 m-auto">
      <div class="form-group">
        <label>Email address</label>
        <input type="email" class="form-control" v-model="user.email">
      </div>
      <div class="form-group">
        <label>Password</label>
        <input type="password" class="form-control" v-model="user.password">
        <div v-if="errorMessage">
            <span class="text-danger" >{{ errors }}</span>
          </div>
      </div>
      <button type="submit" class="btn btn-primary">Login</button>
    </form>
  </div>
</template>

<script>
export default {
  auth: 'guest',
  data(){
    return {
       user:{
         email : '',
          password: '',
       },
      errors: {},
      errorMessage: false
    }
  },
  methods: {
    async login(){
    
      await this.$auth.loginWith('local', { data: this.user })
      .then(response => {
        this.$notify({
          title: 'Success',
          text: 'Login successful'
        });
        this.$router.push('/')
        this.errorMessage = false
      })
      .catch(error => {
        this.$notify({
          title: 'Fail',
          text: 'Something went wrong. Please try again',
          type: 'error'
        });
        this.errors = error.response.data.error
        this.errorMessage = true
      })
      
    },

  }
}
</script>
