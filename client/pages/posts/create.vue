<template>
  <div class="container mt-5">
    <div class="col-8 m-auto border p-4">
      <h3>Create Post</h3>
      <form action="">
        <div class="mb-3">
          <label for="">Add Image</label>
          <input type="file" class="form-control col-5">
        </div>
        <div class="row">
          <div class="col-6">
            <label for="">Manufactures/Model (Optional)</label>
            <select class="form-control">
              <option>--Select--</option>
            </select>
          </div>
          <div class="col-6 mb-3">
            <label for="">Buid Type (Optional)</label>
            <select class="form-control">
              <option>--Select--</option>
            </select>
          </div>
          <div class="col-6">
            <label for="">Trim Name (Optional)</label>
            <input type="text" class="form-control">
          </div>
          <div class="col-6 mb-3">
            <label for="">Engine Power (Optional)</label>
            <input type="text" class="form-control">
          </div>
          <div class="col-12 mb-3">
            <label for="" class="d-block">Car Condition</label>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="true">
              <label class="form-check-label" for="inlineRadio1">Used</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="false">
              <label class="form-check-label" for="inlineRadio2">Brand New</label>
            </div>
          </div>
          <div class="col-6">
            <label for="">Steering Position</label>
            <select class="form-control">
              <option>--Select--</option>
            </select>
          </div>
          <div class="col-6 mb-3">
            <label for="">Transmissions</label>
            <select class="form-control">
              <option>--Select--</option>
            </select>
          </div>
          <div class="col-6">
            <label for="">Fuel Type (Optional)</label>
            <select class="form-control">
              <option>--Select--</option>
            </select>
          </div>
          <div class="col-6 mb-3">
            <label for="">Manufacturer Year</label>
            <select class="form-control">
              <option>--Select--</option>
            </select>
          </div>
          <div class="col-6">
            <label for="">Price</label>
            <input type="text" class="form-control">
          </div>
          <div class="col-6">
            <label for="" class="d-block">Negotiate</label>
            <input type="checkbox">
          </div>
          <div class="col-6">
            <label for="">Color</label>
            <select class="form-control">
              <option>--Select--</option>
            </select>
          </div>
          <div class="col-6 mb-3">
            <label for="">Vehicle Identification Number (Optional)</label>
            <select class="form-control">
              <option>--Select--</option>
            </select>
          </div>
          <div class="col-6">
            <label for="">Plate Number</label>
            <input type="text" placeholder="1Z/1111" class="form-control">
          </div>
          <div class="col-6 mb-3">
            <label for="">Numbers Of Seats(Optional)</label>
            <input type="number" class="form-control">
          </div>
          <div class="col-6 mb-3">
            <label for="">Numbers Of Doors(Optional)</label>
            <input type="number" class="form-control">
          </div>
          <div class="col-12 mb-3">
            <label for="">Description</label>
            <textarea name="" id="" rows="4" class="form-control"></textarea>
          </div>
          <div class="col-12 mb-3">
            <label for="">Phone</label>
            <input type="number" class="form-control col-6">
          </div>
          <div class="col-12 mb-4">
            <label for="">Address</label>
            <textarea name="" id="" rows="4" class="form-control"></textarea>
          </div>
        </div>
        <div class="d-flex justify-content-between">
          <a href="#" class="btn btn-outline-dark">Back</a>
          <button class="btn btn-primary">Submit</button>
        </div>
      </form>
    </div>
  </div>
</template>
<script>
export default {
  
}
</script>
