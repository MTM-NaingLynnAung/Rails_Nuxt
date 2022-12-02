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
    list() {
      this.$axios.get('/users')
      .then( response => {
        console.log(response.data)
      })
    }

  },
  mounted(){
    this.list()
  }
}
</script>
