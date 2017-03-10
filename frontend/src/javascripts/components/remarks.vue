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
  data() {
    return {
      currentLength: 0
    }
  },
  components: {
    remark: Remark,
    'remark-form': RemarkForm
  },
  computed: mapState({
    remarks(state) {
      return state[this.resource];
    }
  }),
  created() {
    this.currentLength = this.remarks.length;
  },
  filters: {
    capitalize(value) {
      if (!value) return '';

      value = value.toString();
      return value.charAt(0).toUpperCase() + value.slice(1)
    }
  },
  watch: {
    remarks(changed) {
      if (this.currentLength === changed.length) { return; }

      this.currentLength = changed.length;

      this.$nextTick(() => {
        const elem = this.$refs['list'];
        elem.scrollTop = elem.scrollHeight - elem.clientHeight;
      });
    }
  }
}
</script>
