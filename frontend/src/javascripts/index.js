const Vue = require('vue').default;

const Board = require('./components/board');

window.addEventListener('load', () => {
  const permalink = new URL(location).pathname.replace('/', '');

  fetchInitialState(permalink).then((data) => {
    mount('#board', data)
  });
});

function mount(el, data) {
  new Vue({
    el: el,
    data() {
      return {
        ...data
      }
    },
    render: (h) => { h(Board) }
  });
};

function fetchInitialState(permalink) {
  return fetch(`/api/${permalink}`).then((response) => {
    return response.json();
  });
}