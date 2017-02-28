<template>
  <div class='board'>
    <div class='panel'>
      <remarks resource='keeps'    kind='keep'    :remarks='keeps' />
      <remarks resource='problems' kind='problem' :remarks='problems' />
    </div>

    <div class='panel'>
      <remarks resource='tries' kind='try' :remarks='tries' />
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
