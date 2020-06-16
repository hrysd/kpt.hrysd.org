const Vue  = require('vue').default;
const Vuex = require('vuex').default;

const {fetchInitialState} = require('./store');
const Board = require('./components/board');

Vue.use(Vuex);

window.addEventListener('DOMContentLoaded', () => {
  const isBoard = document.getElementById('board');

  if (!isBoard) { return; }

  const permalink = (new URL(location)).pathname.replace('/b/', '');

  fetchInitialState(permalink).then((store) => {
    mount('#board', store)
  });
});

function mount(el, store) {
  new Vue(Object.assign({store,}, Board)).$mount(el);
}
