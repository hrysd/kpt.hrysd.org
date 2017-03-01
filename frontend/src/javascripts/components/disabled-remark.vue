<template>
  <li>
    <p>{{remark.content}}</p>

    <button class='thumbs-up' disabled=true>
      <i class='fa fa-thumbs-o-up'></i>
      {{remark.reactions_count}}
    </button>

    <button class='remove-button' disabled=true>
      <i class='fa fa-times'></i>
    </button>
  </li>
</template>

<script>
module.exports = {
  props: ['remark'],
};
</script>
