<template>
  <section :class='kind'>
    <header>
      <h2>{{kind | capitalize}}</h2>
    </header>

    <ul ref='list'>
      <disabled-remark v-for='(remark, index) in remarks' :remark='remark' :key='index'></disabled-remark>
    </ul>

    <disabled-remark-form />
  </section>
</template>

<script>
const {mapState} = require('vuex');

const DisabledRemark     = require('./disabled-remark');
const DisabledRemarkForm = require('./disabled-remark-form');

module.exports = {
  props: ['kind', 'resource'],
  components: {
    'disabled-remark':      DisabledRemark,
    'disabled-remark-form': DisabledRemarkForm
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
  }
}
</script>
