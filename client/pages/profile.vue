<template>
  <div class="mt-5 container">
    <div class="col-8 m-auto border">
      <div class="p-4">
        <img src="~/assets/default.png" alt="" class="rounded-circle" style="width: 100px; height: 100px;">
        <button class="btn btn-info ml-4 rounded-pill">Edit Image</button>
        <button class="btn btn-outline-danger ml-4 rounded-pill">Delete</button>
        <form action="" class="mt-3">
          <div>
            <label for="">Name</label>
            <input type="text" class="form-control col-6">
          </div>
          <div class="my-3">
            <label for="">Email</label>
            <input type="text" class="form-control col-6" disabled>
          </div>
          <div>
            <label for="">Phone</label>
            <input type="number" class="form-control col-6">
          </div>
          <div class="my-3">
            <label for="">Address</label>
            <textarea name="" id="" rows="4" class="form-control"></textarea>
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
  
}
</script>
