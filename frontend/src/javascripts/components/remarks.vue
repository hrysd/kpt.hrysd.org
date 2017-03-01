<template>
  <section :class='kind'>
    <header>
      <h2>{{kind | capitalize}}</h2>
    </header>

    <ul ref='list'>
      <remark v-for='(remark, index) in remarks' :remark='remark' :resource='resource' :key='index' ref='remark'></remark>
    </ul>

    <remark-form :resource='resource'/>
  </section>
</template>

<script>
const {mapState} = require('vuex');

const Remark     = require('./remark');
const RemarkForm = require('./remark-form');

module.exports = {
  props: ['kind', 'resource'],
  components: {
    remark: Remark,
    'remark-form': RemarkForm
  },
  computed: mapState({
    remarks(state) {
      return state[this.resource];
    }
  }),
  filters: {
    capitalize(value) {
      if (!value) return ''

      value = value.toString();
      return value.charAt(0).toUpperCase() + value.slice(1)
    }
  },
  watch: {
    remarks() {
      this.$nextTick(() => {
        const elem = this.$refs['list'];
        elem.scrollTop = elem.scrollHeight - elem.clientHeight;
      });
    }
  }
}
</script>
