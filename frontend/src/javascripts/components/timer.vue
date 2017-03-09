<template>
  <div>
    <p>{{currentTime}}</p>
    <input type='number' v-model='minute' />
    <span v-on:click='start'> Start</span>
    <span v-on:click='pause'> Stop</span>
  </div>
</template>

<script>
const Timer = require('timer.js');

module.exports = {
  data() {
    return {
      timer: new Timer(),
      currentTime: 0,
      minute: 0,
      working: false
    }
  },
  created() {
    this.timer = new Timer({
      tick: 1,
      ontick: (ms) => {
        this.currentTime = ms;
      }
    });
  },
  computed: {
    minuteToSecond() {
      return this.minute * 60
    }
  },
  methods: {
    start() {
      this.timer.start(this.minuteToSecond)
    },
    pause() {
      this.timer.pause();
    }
  }
};
</script>
