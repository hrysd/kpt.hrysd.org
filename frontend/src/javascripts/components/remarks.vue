<template>
  <section :class='kind'>
    <header>
      <h2>{{kind | capitalize}}</h2>
    </header>

    <ul>
      <remark v-for='(remark, index) in remarks' :remark='remark'></remark>
    </ul>

    <remark-form />
  </section>
</template>

<script>
const Remark     = require('./remark');
const RemarkForm = require('./remark-form');

module.exports = {
  props: ['kind', 'remarks', 'resource'],
  components: {
    remark: Remark,
    'remark-form': RemarkForm
  },
  filters: {
    capitalize(value) {
      if (!value) return ''

      value = value.toString();
      return value.charAt(0).toUpperCase() + value.slice(1)
    }
  }
}
</script>
