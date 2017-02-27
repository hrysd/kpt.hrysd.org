<template>
  <section :class='kind'>
    <header>
      <h2>{{kind}} TODO: Capitalize</h2>
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
  props: ['kind', 'remarks'],
  components: {
    remark: Remark,
    'remark-form': RemarkForm
  }
}
</script>