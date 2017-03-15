require('whatwg-fetch')

const {Store} = require('vuex').default;

const actions   = require('./actions');
const mutations = require('./mutations');
const getters   = require('./getters');
const createWebsocketPlugin = require('./websocket-plugin');

const initialState = {
  title:     '',
  permalink: '',
  keeps:     [],
  problems:  [],
  tris:      []
};

function fetchInitialState(permalink) {
  return new Promise((resolve) => {
    fetch(`/api/${permalink}`).then((response) => {
      return response.json();
    }).then((data) => {
      resolve(
        new Store(
          {
            state: Object.assign(initialState, data),
            mutations,
            actions,
            getters,
            plugins: [createWebsocketPlugin('/cable', permalink)]
          }
        )
      );
    });
  });
}

module.exports = {fetchInitialState};
