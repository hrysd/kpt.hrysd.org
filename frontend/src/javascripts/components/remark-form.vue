<template>
  <form class='inline-form' v-on:submit.prevent='onSubmit'>
    <input type='text' v-model='newRemark.title' :disabled='submitting'>

    <button class='submit-button' :disabled='submitting'>Add</button>
  </form>
</template>

<script>
module.exports = {
  data() {
    return {
      submitting: false,
      newRemark: {
        title: ''
      },
    }
  },
  methods: {
    onSubmit() {
      this.submitting = true;

      setTimeout(() => {
        this.submitting = false;
      }, 5000)
    }
  }
}
</script>
