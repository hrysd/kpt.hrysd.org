<template>
  <div class='board'>
    <div class='panel'>
      <remarks resource='keeps'    kind='keep'    />
      <remarks resource='problems' kind='problem' />
    </div>

    <div class='panel'>
      <remarks resource='tris' kind='try' />
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
