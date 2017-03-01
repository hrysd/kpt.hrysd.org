<template>
  <li>
    <p>{{remark.content}}</p>

    <button class='thumbs-up' v-on:click='thumbsUp(remark.id)'>
      <i class='fa fa-thumbs-o-up'></i>
      {{remark.reactions_count}}
    </button>

    <button class='remove-button' v-on:click='onRemove'>
      <i class='fa fa-times'></i>
    </button>
  </li>
</template>

<script>
const {mapActions} = require('vuex');

module.exports = {
  props: ['remark', 'resource'],
  methods: {
    ...mapActions(['thumbsUp', 'removeRemark']),
    onRemove() {
      const confirmation = window.confirm('Are you sure you want to delete this?');

      if (!confirmation) return;

      this.removeRemark({resource: this.resource, remarkId: this.remark.id});
    }
  }
};
</script>
