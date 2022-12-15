<template>
  <div class="">
    <nav class="navbar bg-light">
      <div class="container">
        <NuxtLink to="/" class="navbar-brand">AutoMobile</NuxtLink>
        <div v-if="$auth.loggedIn == true" class="d-flex justify-content-center align-items-center">

          <NuxtLink to="/posts/create" class="dropdown-item d-inline"><font-awesome-icon icon="circle-plus" class="mr-2 text-primary font-awesome" /> Create Post</NuxtLink>
          <li class="nav-item dropdown list-unstyled d-flex">
            <a class="nav-link dropdown-toggle text-dark d-inline" data-toggle="dropdown" href="javascript:avoid(0)" role="button" aria-expanded="false">
              <b-img v-if="$auth.user.image" :src="url($auth.user.image.src.url)" class="rounded-circle" style="width:30px;height:30px;"></b-img>
              <b-img v-else src="~/assets/default.png" fluid alt="Responsive image" class="rounded-circle" style="width:30px;height:30px;"></b-img>
              {{ $auth.user.user.name }}
            </a>
            <div class="dropdown-menu">
              <NuxtLink to="/profile" class="dropdown-item"><font-awesome-icon icon="circle-user" class="mr-2 text-primary font-awesome" /> Profile</NuxtLink>
              <a class="dropdown-item" @click="logout" href="#"><font-awesome-icon icon="reply" class="mr-2 text-danger" /> Logout</a>
            </div>
          </li>
        </div>
        <div v-else>
          <NuxtLink to="/login" class="btn btn-sm btn-outline-success">Login</NuxtLink>
          <NuxtLink to="/register" class="btn btn-sm btn-outline-primary">Register</NuxtLink>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
export default {

  methods: {
    async logout(){
      await this.$auth.logout();
      this.$notify({
          title: 'Success',
          text: 'Logout successful',
        });
      this.$router.push('/login')
    },
    url(image){
      return `http://127.0.0.1:8080${image}`
    },
  },

}
</script>
<style>
  .dropdown-item:active .font-awesome {
    color: #fff !important;
  }
</style>
