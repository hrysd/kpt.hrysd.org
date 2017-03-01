const {Store} = require('vuex').default;
const Client = require('./client');
const createWebsocketPlugin = require('./websocket-plugin');

const initialState = {
  title:     '',
  permalink: '',
  keeps:    [],
  problems: [],
  tris:    []
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
              plugins: [createWebsocketPlugin('/cable', permalink)]
            }
          )
        );
    });
  });
}

const ADD_REMARK    = 'ADD_REMARK';
const REMOVE_REMARK = 'REMOVE_REMARK';
const THUMBS_UP     = 'THUMBS_UP';

const mutations = {
  [ADD_REMARK] (state, {resource, remark}) {
    state[resource].push(remark);
  },
  [REMOVE_REMARK] (state, {resource, remarkId}) {
    const index = state[resource].findIndex((r) => {
      return r.id === remarkId;
    });

    state[resource].splice(index, 1);
  },
  [THUMBS_UP] (state, {resource, remark}) {
    const index = state[resource].findIndex((r) => {
      return r.id === remark.id;
    });

    if (index === -1) { return; }

    state[resource].splice(index, 1, remark);
  }
};

const actions = {
  addRemark({commit, state}, {resource, content}) {
    Client.createRemark(state.permalink, resource, content)
  },
  thumbsUp({state}, remarkId) {
    Client.createReaction(state.permalink, remarkId)
  },
  removeRemark({state}, {resource, remarkId}) {
    Client.removeRemark(state.permalink, resource, remarkId)
  }
};

module.exports = {fetchInitialState};
