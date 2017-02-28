<template>
  <form class='inline-form' v-on:submit.prevent='onSubmit'>
    <input type='text' v-model='newRemark.title' :disabled='submitting'>

    <button class='submit-button' :disabled='submitting'>Add</button>
  </form>
</template>

<script>
const {mapActions} = require('vuex');

module.exports = {
  props: ['resource'],
  data() {
    return {
      submitting: false,
      newRemark: {
        title: ''
      },
    }
  },
  methods: {
    ...mapActions(['addRemark']),
    onSubmit() {
      this.submitting = true;

      this.addRemark({resource: this.resource, content: this.newRemark.title}).then(() => {
        this.newRemark.title = '';
        this.submitting = false;
      });
    }
  }
}
</script>
