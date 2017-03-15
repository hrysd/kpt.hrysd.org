<template>
  <div class='content'>
    <button v-on:click='openModal'>export</button>
    <modal v-if='showModal' v-on:onClose='this.showModal=false'>
      <h1 slot='header'> hiihihihihgie</h1>
    </modal>

    <header id='header'>
      <h1>{{title}}</h1>

      <button class='close-button' v-if='state === "opened"' v-on:click='close'>
        <i class='fa fa-check' aria-hidden='true'></i>
        Close
      </button>
    </header>

    <div class='board'>
      <div class='panel'>
        <remarks v-if='state === "opened"' resource='keeps'  kind='keep' />
        <disabled-remarks v-else resource='keeps' kind='keep' />

        <remarks v-if='state === "opened"' resource='problems' kind='problem' />
        <disabled-remarks v-else resource='problems' kind='problem' />
      </div>

      <div class='panel'>
        <remarks v-if='state === "opened"' resource='tris' kind='try' />
        <disabled-remarks v-else resource='tris' kind='try' />
      </div>
    </div>
  </div>
</template>

<script>
const {mapState, mapActions} = require('vuex');

const Remarks         = require('./remarks');
const DisabledRemarks = require('./disabled-remarks');
const Modal           = require('./modal');

module.exports = {
  components: {
    'remarks': Remarks,
    'disabled-remarks': DisabledRemarks,
    'modal': Modal
  },
  data() {
    return {
      showModal: false
    };
  },
  computed: mapState(['title','state']),
  methods: {
    ...mapActions(['closeBoard']),
    close() {
      const confirmation = window.confirm('Are you sure you want to close this?');

      if (!confirmation) return;

      this.closeBoard();
    },
    openModal() {
      this.showModal = true
    }
  }
};
</script>
