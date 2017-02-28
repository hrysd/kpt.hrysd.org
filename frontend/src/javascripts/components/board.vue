<template>
  <div class='board'>
    <div class='panel'>
      <remarks kind='keep'    :remarks='keeps' />
      <remarks kind='problem' :remarks='problems' />
    </div>

    <div class='panel'>
      <remarks kind='tri' :remarks='tries' />
    </div>
  </div>
</template>

<script>
const Remarks = require('./remarks');

module.exports = {
  components: {
    'remarks': Remarks
  }
};
</script>
