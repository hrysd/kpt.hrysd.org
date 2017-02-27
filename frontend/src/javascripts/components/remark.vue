<template>
  <li>
    <p>{{remark.content}}</p>

    <button class='thumbs-up' v-on:click='onThumbsUp'>
      <i class='fa fa-thumbs-o-up'></i>
      {{remark.reactions_count}}
    </button>

    <button class='remove-button' v-on:click='onRemove'>
      <i class='fa fa-times'></i>
    </button>
  </li>
</template>

<script>
module.exports = {
  props: ['remark'],
  methods: {
    onThumbsUp() {
      console.log(`Make ${this.remark.id} +1`);
    },
    onRemove() {
      const confirmation = window.confirm('Are you sure you want to delete this?');

      if (!confirmation) return;

      console.log(`remove this ${this.remark.id}`);
    }
  }
};
</script>