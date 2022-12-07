<template>
  <div class="">
    <nav class="navbar bg-light">
      <div class="container">
        <NuxtLink to="/" class="navbar-brand">AutoMobile</NuxtLink>
        <div v-if="$auth.loggedIn == true" class="d-flex">
          
            <li class="nav-item dropdown list-unstyled">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">{{ $auth.user.email }}</a>
              <div class="dropdown-menu">
                <NuxtLink to="/profile" class="dropdown-item">Profile</NuxtLink>
                <NuxtLink to="/posts/create" class="dropdown-item">Create Post</NuxtLink>
                <a class="dropdown-item" @click="logout" href="#">Logout</a>
              </div>
            </li>

          <!-- <nuxt-link to="/category" class="btn btn-sm btn-secondary mr-3">Category List</nuxt-link>
          <nuxt-link to="/product" class="btn btn-sm btn-info mr-3">Product List</nuxt-link> -->
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
          group: 'auth',
          title: 'Success',
          text: 'Logout successful',
        });
      this.$router.push('/login')
    }
  },

}
</script>
