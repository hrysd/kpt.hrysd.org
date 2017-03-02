const {
  ADD_REMARK,
  REMOVE_REMARK,
  THUMBS_UP,
  CLOSE_BOARD,
} = require('./mutation-types');

module.exports = {
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
  },
  [CLOSE_BOARD] (state) {
    state.state = 'closed';
  }
};
