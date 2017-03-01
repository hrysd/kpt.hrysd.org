const {Store} = require('vuex').default;
const Client = require('./client');

const initialState = {
  title:     '',
  permalink: '',
  keeps:    [],
  problems: [],
  tries:    []
};

function fetchInitialState(permalink) {
  return new Promise((resolve) => {
    fetch(`/api/${permalink}`).then((response) => {
      return response.json();
    }).then((data) => {
      resolve(new Store({state: Object.assign(initialState, data), mutations, actions}));
    });
  });
}

const ADD_REMARK = 'ADD_REMARK';

const mutations = {
  [ADD_REMARK] (state, {resource, remark}) {
    state[resource].push(remark);
  }
};

const actions = {
  addRemark({commit, state}, {resource, content}) {
    Client.createRemark(state.permalink, resource, content).then(() => {
      commit(ADD_REMARK, {resource, remark: {content: content}});
    });
  },
  thumbsUp({state}, remarkId) {
    Client.createReaction(state.permalink, remarkId)
  },
  removeRemark({state}, {resource, remarkId}) {
    Client.removeRemark(state.permalink, resource, remarkId)
  }
};

module.exports = {fetchInitialState};
